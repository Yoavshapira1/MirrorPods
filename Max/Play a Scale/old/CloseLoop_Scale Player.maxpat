{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 77.0, 1852.0, 929.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 24.0,
					"id" : "obj-216",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1087.0, 131.0, 275.0, 34.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 891.06249200000002, 68.0, 210.5, 62.0 ],
					"text" : "Y axis control Volume"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-214",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 357.312492000000248, 554.0, 52.0, 22.0 ],
					"text" : "gate 1 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 304.0, 457.0, 70.0, 22.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-204",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 423.312492000000248, 529.0, 63.0, 22.0 ],
					"text" : "s ---ctlvoly"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-205",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1242.312492000000248, 491.0, 61.0, 22.0 ],
					"text" : "r ---ctlvoly"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-206",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-72",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patching_rect" : [ 50.0, 100.0, 29.5, 22.0 ],
									"text" : "t i i"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 167.0, 29.5, 22.0 ],
									"text" : "127"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 50.0, 130.0, 34.0, 22.0 ],
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-82",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-92",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 44.0, 249.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-96",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 79.0, 249.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"source" : [ "obj-72", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"source" : [ "obj-82", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1242.312492000000248, 537.0, 34.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-207",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1242.312492000000248, 579.0, 52.0, 22.0 ],
					"text" : "gate 1 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-210",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-72",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patching_rect" : [ 50.0, 100.0, 29.5, 22.0 ],
									"text" : "t i i"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 167.0, 29.5, 22.0 ],
									"text" : "127"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 50.0, 130.0, 34.0, 22.0 ],
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-82",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-92",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 44.0, 249.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-96",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 79.0, 249.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"source" : [ "obj-72", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"source" : [ "obj-82", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 357.312492000000248, 514.0, 34.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-211",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 357.312492000000248, 491.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 985.56249200000002, 108.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_longname" : "live.text",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text",
							"parameter_type" : 2
						}

					}
,
					"text" : "Off",
					"texton" : "ON",
					"varname" : "live.text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-180",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 2018.750031000000035, 698.5, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-181",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1858.250031000000035, 730.0, 190.0, 22.0 ],
					"text" : "if $i1 == 0 || $i2 == 0 then 0 else 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-182",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 2033.750031000000035, 636.0, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-184",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1873.250031000000035, 674.5, 190.0, 22.0 ],
					"text" : "if $i1 == 0 || $i2 == 0 then 0 else 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-198",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2033.750031000000035, 602.0, 68.0, 22.0 ],
					"text" : "r usr2h2Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-199",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1858.250031000000035, 636.0, 68.0, 22.0 ],
					"text" : "r usr1h2Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-200",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 107.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-184",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 96.0, 131.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-177",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 100.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-172",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 129.25, 212.0, 29.5, 22.0 ],
									"text" : "i"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.305882352941176, 0.666666666666667, 0.905882352941176, 1.0 ],
									"id" : "obj-170",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 205.0, 48.0, 22.0 ],
									"text" : "del 100"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-169",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 50.0, 170.0, 65.0, 22.0 ],
									"text" : "onebang 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-168",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "int" ],
									"patching_rect" : [ 50.0, 138.0, 29.5, 22.0 ],
									"text" : "t b i"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-185",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-186",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 129.25, 299.5, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 0 ],
									"source" : [ "obj-168", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-172", 1 ],
									"midpoints" : [ 70.0, 165.0, 149.25, 165.0 ],
									"source" : [ "obj-168", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-170", 0 ],
									"order" : 1,
									"source" : [ "obj-169", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-172", 0 ],
									"midpoints" : [ 59.5, 198.0, 138.75, 198.0 ],
									"order" : 0,
									"source" : [ "obj-169", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 1 ],
									"midpoints" : [ 59.5, 237.0, 132.0, 237.0, 132.0, 164.0, 105.5, 164.0 ],
									"source" : [ "obj-170", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-186", 0 ],
									"source" : [ "obj-172", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-168", 0 ],
									"source" : [ "obj-177", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 1 ],
									"source" : [ "obj-184", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-177", 0 ],
									"source" : [ "obj-185", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1950.250031000000035, 793.0, 71.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p filter input"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.427450980392157, 0.462745098039216, 0.388235294117647, 1.0 ],
					"id" : "obj-201",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1858.250031000000035, 786.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-203",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1858.250031000000035, 823.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-138",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2597.0, 934.5, 70.0, 22.0 ],
					"text" : "s usr2h2Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2597.0, 894.5, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 2597.0, 865.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-141",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 2597.0, 823.0, 29.5, 22.0 ],
					"text" : "> 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-157",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2486.0, 927.5, 70.0, 22.0 ],
					"text" : "s usr2h1Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-164",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2486.0, 887.5, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-170",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 2486.0, 858.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-175",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 2486.0, 816.0, 29.5, 22.0 ],
					"text" : "> 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2368.0, 934.5, 70.0, 22.0 ],
					"text" : "s usr1h2Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2368.0, 894.5, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 2368.0, 865.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 2368.0, 823.0, 29.5, 22.0 ],
					"text" : "> 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-197",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2257.0, 927.5, 70.0, 22.0 ],
					"text" : "s usr1h1Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2257.0, 887.5, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 2257.0, 858.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-183",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 2257.0, 816.0, 29.5, 22.0 ],
					"text" : "> 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-222",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 952.750031000000035, 449.5, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-221",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 792.250031000000035, 481.0, 190.0, 22.0 ],
					"text" : "if $i1 == 0 || $i2 == 0 then 0 else 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-215",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 967.750031000000035, 387.0, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-209",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 807.250031000000035, 425.5, 190.0, 22.0 ],
					"text" : "if $i1 == 0 || $i2 == 0 then 0 else 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-208",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 967.750031000000035, 353.0, 68.0, 22.0 ],
					"text" : "r usr2h1Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-202",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 792.250031000000035, 387.0, 68.0, 22.0 ],
					"text" : "r usr1h1Off"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-187",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 107.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-184",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 96.0, 131.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-177",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 100.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-172",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 129.25, 212.0, 29.5, 22.0 ],
									"text" : "i"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.305882352941176, 0.666666666666667, 0.905882352941176, 1.0 ],
									"id" : "obj-170",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 205.0, 48.0, 22.0 ],
									"text" : "del 100"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-169",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 50.0, 170.0, 65.0, 22.0 ],
									"text" : "onebang 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-168",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "int" ],
									"patching_rect" : [ 50.0, 138.0, 29.5, 22.0 ],
									"text" : "t b i"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-185",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-186",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 129.25, 299.5, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 0 ],
									"source" : [ "obj-168", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-172", 1 ],
									"midpoints" : [ 70.0, 165.0, 149.25, 165.0 ],
									"source" : [ "obj-168", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-170", 0 ],
									"order" : 1,
									"source" : [ "obj-169", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-172", 0 ],
									"midpoints" : [ 59.5, 198.0, 138.75, 198.0 ],
									"order" : 0,
									"source" : [ "obj-169", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 1 ],
									"midpoints" : [ 59.5, 237.0, 132.0, 237.0, 132.0, 164.0, 105.5, 164.0 ],
									"source" : [ "obj-170", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-186", 0 ],
									"source" : [ "obj-172", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-168", 0 ],
									"source" : [ "obj-177", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 1 ],
									"source" : [ "obj-184", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-177", 0 ],
									"source" : [ "obj-185", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 884.250031000000035, 544.0, 71.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p filter input"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.427450980392157, 0.462745098039216, 0.388235294117647, 1.0 ],
					"id" : "obj-71",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 792.250031000000035, 537.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 792.250031000000035, 574.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-195",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1419.81249200000002, 228.0, 212.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1751.562460999999985, 3.749984499999982, 82.0, 27.0 ],
					"text" : "Distance"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-193",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1404.81249200000002, 213.0, 212.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 687.562461000000098, 3.749984499999982, 82.0, 27.0 ],
					"text" : "Distance"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-191",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1404.81249200000002, 213.0, 212.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1679.562460999999985, 3.749984499999982, 70.0, 27.0 ],
					"text" : "Range"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 18.0,
					"id" : "obj-189",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1379.812492000000248, 269.0, 212.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 615.562461000000098, 3.749984499999982, 70.0, 27.0 ],
					"text" : "Range"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 24.0,
					"id" : "obj-179",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1430.0, 191.0, 275.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 913.06249200000002, 356.0, 103.0, 34.0 ],
					"text" : "Panning "
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-178",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1743.99995300000046, 884.0, 80.0, 22.0 ],
					"text" : "loadmess 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-177",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 762.999953000000346, 884.0, 80.0, 22.0 ],
					"text" : "loadmess 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-176",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 812.0, 984.0, 50.0, 22.0 ],
					"text" : "0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-173",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1394.812492000000248, 235.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1434.499953500000174, 40.0, 65.250030999999922, 20.0 ],
					"text" : "Legato"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-174",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1379.812492000000248, 220.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1434.499953500000174, 15.874992249999991, 65.250030999999922, 20.0 ],
					"text" : "Waveform"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-172",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1379.812492000000248, 220.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.250015499999904, 42.250015500000018, 65.250030999999922, 20.0 ],
					"text" : "Legato"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-171",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1364.812492000000248, 205.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.250015499999904, 17.0, 65.250030999999922, 20.0 ],
					"text" : "Waveform"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-168",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1364.812492000000248, 823.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-167",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 384.0, 832.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 24.0,
					"id" : "obj-166",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1430.0, 191.0, 275.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1314.562460999999985, 15.874992249999991, 112.0, 34.0 ],
					"text" : "HAND 2"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 24.0,
					"id" : "obj-165",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1415.0, 176.0, 275.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 216.562460999999985, 17.0, 112.0, 34.0 ],
					"text" : "HAND 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-162",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 210.062492000000134, 107.0, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-161",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 82.062492000000134, 63.0, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-160",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "int", "int" ],
					"patching_rect" : [ 402.0, 41.0, 42.0, 22.0 ],
					"text" : "t b 2 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-159",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 402.0, 6.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 143.562492000000134, 250.0, 22.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 82.062492000000134, 144.0, 29.5, 22.0 ],
					"text" : "i 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 281.062492000000134, 77.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "clear" ],
					"patching_rect" : [ 281.062492000000134, 107.0, 51.0, 22.0 ],
					"text" : "t b clear"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 2,
					"id" : "obj-118",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 261.062492000000134, 18.5, 64.0, 53.0 ],
					"text" : "3 create notes",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 3,
					"id" : "obj-119",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 8.062492000000134, 34.0, 64.0, 38.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 891.06249200000002, 155.5, 64.0, 38.0 ],
					"text" : "set scale",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.146476194262505, 0.770820915699005, 0.850926399230957, 1.0 ],
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 214.312492000000134, 534.0, 82.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"precision" : 6
					}
,
					"text" : "coll notes+oct",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.146476194262505, 0.770820915699005, 0.850926399230957, 1.0 ],
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 237.562492000000134, 381.0, 66.0, 22.0 ],
					"text" : "listfunnel 1",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 237.812492000000134, 352.0, 51.0, 22.0 ],
					"text" : "zl.group"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 225.312492000000134, 257.0, 29.5, 22.0 ],
					"text" : "i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 225.312492000000134, 284.0, 44.0, 22.0 ],
					"text" : "uzi 4 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.312492000000134, 319.0, 200.0, 22.0 ],
					"text" : "vexpr ($i1*12) + $i2 @scalarmode 1"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 3,
					"id" : "obj-135",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 197.062492000000134, 18.5, 66.0, 66.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 891.06249200000002, 230.0, 72.0, 52.0 ],
					"text" : "set num of octaves",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 82.062492000000134, 306.0, 29.5, 22.0 ],
					"text" : "* 1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.094117647058824, 0.266666666666667, 0.517647058823529, 1.0 ],
					"fontsize" : 24.0,
					"id" : "obj-144",
					"maxclass" : "number",
					"maximum" : 10,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 210.062492000000134, 79.0, 54.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 981.06249200000002, 238.0, 54.0, 36.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"tricolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-146",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 82.062492000000134, 212.0, 37.0, 22.0 ],
					"text" : "zl.len"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-147",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 92.562492000000134, 109.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-150",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 214.262492000000123, 574.0, 32.0, 22.0 ],
					"text" : "+ 48"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 4,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 82.062492000000134, 41.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 965.06249200000002, 134.0, 90.0, 81.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "Major", "Minor", "Harmonic Minor", "pentatonic" ],
							"parameter_longname" : "live.tab[3]",
							"parameter_mmax" : 3,
							"parameter_shortname" : "live.tab[3]",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}

					}
,
					"varname" : "live.tab[2]"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 4,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0, 2, 4, 5, 7, 9, 11 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0, 2, 3, 5, 7, 9, 10 ]
							}
, 							{
								"key" : 3,
								"value" : [ 0, 2, 3, 5, 7, 8, 11 ]
							}
, 							{
								"key" : 4,
								"value" : [ 0, 2, 4, 7, 9 ]
							}
 ]
					}
,
					"color" : [ 0.146476194262505, 0.770820915699005, 0.850926399230957, 1.0 ],
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 82.062492000000134, 172.0, 126.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1,
						"precision" : 6
					}
,
					"text" : "coll scales @embed 1",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-156",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 214.262492000000123, 603.0, 48.0, 22.0 ],
					"text" : "pack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 427.0, 498.0, 50.0, 22.0 ],
					"text" : "1.11"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 239.312492000000134, 498.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1054.0, 34.0, 53.0, 22.0 ],
					"text" : "r usr2h1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 736.562460999999985, 34.0, 53.0, 22.0 ],
					"text" : "r usr1h1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2031.0, 301.0, 53.0, 22.0 ],
					"text" : "r usr2h2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1713.562460999999985, 301.0, 53.0, 22.0 ],
					"text" : "r usr1h2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-234",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "", "float", "", "float" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 107.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 4,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 346.0, 339.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 113.0, 339.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-161",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 400.0, 209.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-162",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 299.0, 209.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-167",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 286.0, 257.5, 34.0, 22.0 ],
									"text" : "pack"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-170",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "float", "float", "float" ],
									"patching_rect" : [ 299.0, 106.5, 67.0, 22.0 ],
									"text" : "unpack f f f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-172",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 414.5, 147.5, 110.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-174",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 299.0, 147.5, 110.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-177",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 377.0, 100.0, 67.0, 29.0 ],
									"text" : "0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-164",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 164.0, 209.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-157",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 63.0, 209.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 257.5, 34.0, 22.0 ],
									"text" : "pack"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "float", "float", "float" ],
									"patching_rect" : [ 63.0, 106.5, 67.0, 22.0 ],
									"text" : "unpack f f f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 178.5, 147.5, 110.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 63.0, 147.5, 110.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-122",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 145.0, 100.0, 67.0, 29.0 ],
									"text" : "0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-230",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 98.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-231",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 332.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-232",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 339.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-233",
									"index" : 3,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 286.0, 339.5, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"source" : [ "obj-157", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-167", 1 ],
									"source" : [ "obj-161", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-167", 0 ],
									"source" : [ "obj-162", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 1 ],
									"source" : [ "obj-164", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-233", 0 ],
									"source" : [ "obj-167", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-172", 0 ],
									"source" : [ "obj-170", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-174", 0 ],
									"source" : [ "obj-170", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-170", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-161", 0 ],
									"source" : [ "obj-172", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"source" : [ "obj-174", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-122", 1 ],
									"order" : 0,
									"source" : [ "obj-230", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"order" : 1,
									"source" : [ "obj-230", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-170", 0 ],
									"order" : 1,
									"source" : [ "obj-231", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-177", 1 ],
									"order" : 0,
									"source" : [ "obj-231", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-232", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-46", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-46", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-164", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-157", 0 ],
									"source" : [ "obj-48", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 2448.0, 707.5, 91.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p usr2data"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-229",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 107.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 4,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 595.25, 382.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 225.0, 382.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-120",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 487.25, 290.5, 50.0, 36.0 ],
									"text" : "205.263158"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-146",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 332.25, 285.5, 50.0, 22.0 ],
									"text" : "100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-147",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 537.25, 239.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-153",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 423.25, 239.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-156",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 423.25, 290.5, 34.0, 22.0 ],
									"text" : "pack"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 554.25, 199.5, 130.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-160",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 427.25, 199.5, 110.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 205.0, 266.5, 50.0, 36.0 ],
									"text" : "205.263158"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-121",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 261.5, 50.0, 22.0 ],
									"text" : "100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-166",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 255.0, 215.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-165",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 141.0, 215.5, 88.0, 22.0 ],
									"text" : "routepass 100."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 141.0, 266.5, 34.0, 22.0 ],
									"text" : "pack"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 175.5, 130.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 145.0, 175.5, 110.0, 22.0 ],
									"text" : "scale 0. 0.95 100 0"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-74",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 628.0, 148.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-53",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 566.0, 148.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-93",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 469.0, 148.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-55",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 319.0, 137.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-56",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 244.0, 137.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-58",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 145.0, 137.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-103",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 566.500031000000035, 105.0, 29.5, 22.0 ],
									"text" : "$4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 627.000031000000035, 105.0, 29.5, 22.0 ],
									"text" : "$6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 467.5, 105.0, 29.5, 22.0 ],
									"text" : "$3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-114",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 244.500031000000035, 105.0, 29.5, 22.0 ],
									"text" : "$4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 319.000031000000035, 105.0, 29.5, 22.0 ],
									"text" : "$6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-72",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 145.5, 100.0, 29.5, 22.0 ],
									"text" : "$3"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-225",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 230.333251999999902, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-226",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 547.666748000000098, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-227",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 141.0, 386.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-228",
									"index" : 3,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 423.25, 386.5, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"midpoints" : [ 576.000031000000035, 130.0, 575.5, 130.0 ],
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"midpoints" : [ 254.000031000000035, 130.0, 253.5, 130.0 ],
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-156", 1 ],
									"midpoints" : [ 615.75, 277.0, 447.75, 277.0 ],
									"source" : [ "obj-147", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-120", 1 ],
									"midpoints" : [ 501.75, 277.0, 527.75, 277.0 ],
									"order" : 0,
									"source" : [ "obj-153", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 1 ],
									"midpoints" : [ 432.75, 271.0, 372.75, 271.0 ],
									"source" : [ "obj-153", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-156", 0 ],
									"midpoints" : [ 501.75, 277.0, 432.75, 277.0 ],
									"order" : 1,
									"source" : [ "obj-153", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-228", 0 ],
									"source" : [ "obj-156", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-147", 0 ],
									"midpoints" : [ 563.75, 223.0, 547.25, 223.0, 547.25, 235.0, 546.75, 235.0 ],
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-153", 0 ],
									"midpoints" : [ 436.75, 223.0, 432.75, 223.0 ],
									"source" : [ "obj-160", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-121", 1 ],
									"midpoints" : [ 150.5, 247.0, 90.5, 247.0 ],
									"source" : [ "obj-165", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 1 ],
									"midpoints" : [ 219.5, 253.0, 245.5, 253.0 ],
									"order" : 0,
									"source" : [ "obj-165", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"midpoints" : [ 219.5, 253.0, 150.5, 253.0 ],
									"order" : 1,
									"source" : [ "obj-165", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 1 ],
									"midpoints" : [ 333.5, 253.0, 165.5, 253.0 ],
									"source" : [ "obj-166", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"order" : 1,
									"source" : [ "obj-225", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"order" : 0,
									"source" : [ "obj-225", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"order" : 2,
									"source" : [ "obj-225", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-103", 0 ],
									"order" : 1,
									"source" : [ "obj-226", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-66", 0 ],
									"order" : 0,
									"source" : [ "obj-226", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"order" : 2,
									"source" : [ "obj-226", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-227", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-166", 0 ],
									"midpoints" : [ 281.5, 199.0, 265.0, 199.0, 265.0, 211.0, 264.5, 211.0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-165", 0 ],
									"midpoints" : [ 154.5, 199.0, 150.5, 199.0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-159", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"midpoints" : [ 253.5, 169.0, 281.5, 169.0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"midpoints" : [ 154.5, 160.0, 154.5, 160.0 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 636.500031000000035, 142.0, 637.5, 142.0 ],
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 0 ],
									"midpoints" : [ 477.0, 142.0, 478.5, 142.0 ],
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"midpoints" : [ 328.500031000000035, 130.0, 328.5, 130.0 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"midpoints" : [ 155.0, 124.0, 154.5, 124.0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-74", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-160", 0 ],
									"source" : [ "obj-93", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 2203.750031000000035, 717.0, 126.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p usr1data"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-163",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2556.0, 736.5, 63.0, 27.0 ],
					"text" : "82 54"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-169",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2520.0, 773.5, 55.0, 22.0 ],
					"text" : "s usr2h2"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-155",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2324.000031000000035, 744.5, 103.25, 27.0 ],
					"text" : "205 205"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-158",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2310.750031000000035, 775.5, 55.0, 22.0 ],
					"text" : "s usr1h2"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-148",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2462.0, 736.5, 63.0, 27.0 ],
					"text" : "6 49"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2448.0, 773.5, 55.0, 22.0 ],
					"text" : "s usr2h1"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-145",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2209.750031000000035, 744.5, 90.0, 27.0 ],
					"text" : "205 205"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-142",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2203.750031000000035, 775.5, 55.0, 22.0 ],
					"text" : "s usr1h1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 2448.0, 670.0, 81.0, 22.0 ],
					"text" : "route ch1 ch2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2448.0, 640.0, 91.0, 22.0 ],
					"text" : "udpreceive 101"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 2204.000031000000035, 680.0, 147.0, 22.0 ],
					"text" : "route /channel1 /channel2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2203.750031000000035, 640.0, 105.0, 23.0 ],
					"text" : "udpreceive 2222"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.98632800579071, 0.136281728744507, 0.63595986366272, 1.0 ],
					"id" : "obj-130",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 1150.250031000000035, 652.0, 82.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"precision" : 6
					}
,
					"text" : "coll notes+oct"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-19",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1629.062460999999985, 1047.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1137.250031000000035, 748.0, 32.0, 22.0 ],
					"text" : "gate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1447.312492000000248, 506.0, 97.0, 22.0 ],
					"text" : "scale 0 100 1. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1328.312492000000248, 506.0, 97.0, 22.0 ],
					"text" : "scale 0 100 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1689.562460999999985, 506.0, 77.0, 22.0 ],
					"text" : "loadmess 15"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "number",
					"maximum" : 50,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1689.562460999999985, 536.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1679.562460999999985, 32.749984499999982, 63.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.427450980392157, 0.462745098039216, 0.388235294117647, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1578.562460999999985, 674.5, 39.0, 39.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1603.562460999999985, 3.749984499999982, 58.250015500000018, 58.250015500000018 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 1933.562460999999985, 328.0, 47.0, 22.0 ],
					"text" : "unpack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1933.562460999999985, 301.0, 93.0, 22.0 ],
					"text" : "loadmess 20 20"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 1771.562460999999985, 328.0, 47.0, 22.0 ],
					"text" : "unpack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1771.562460999999985, 301.0, 80.0, 22.0 ],
					"text" : "loadmess 1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1578.562460999999985, 722.5, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1582.562460999999985, 590.0, 143.0, 22.0 ],
					"text" : "if $f1 >= $i2 then 0 else 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1775.562460999999985, 513.0, 262.0, 22.0 ],
					"text" : "pak 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-41",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1775.562460999999985, 590.0, 77.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1751.562460999999985, 32.749984499999982, 77.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1775.562460999999985, 545.0, 261.0, 22.0 ],
					"text" : "expr sqrt( pow($f1 - $f3\\,2) + pow($f2 - $f4\\, 2) )"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.17 ],
					"bottomvalue" : 100,
					"color" : [ 1.0, 0.117647058823529, 0.117647058823529, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1942.562460999999985, 372.0, 100.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1148.062460999999985, 68.0, 818.0, 478.0 ],
					"rightvalue" : 100,
					"topvalue" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1106.250031000000035, 903.5, 70.0, 22.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1027.74998450000021, 769.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1027.74998450000021, 797.0, 104.0, 22.0 ],
					"text" : "min 0, max 55, 35"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "number",
					"maximum" : 55,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1027.74998450000021, 823.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1501.74998450000021, 40.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1106.250031000000035, 953.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.36078431372549, 0.796078431372549, 0.756862745098039, 1.0 ],
					"fontsize" : 16.0,
					"id" : "obj-50",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1106.250031000000035, 931.0, 75.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1501.74998450000021, 15.874992249999991, 89.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "Saw", "Cycle" ],
							"parameter_longname" : "live.tab[2]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.tab",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}

					}
,
					"varname" : "live.tab[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1541.999953000000232, 1110.0, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 1328.312492000000248, 585.0, 63.0, 22.0 ],
					"text" : "split 0. 1.1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.698039215686274, 0.019607843137255, 0.905882352941176, 1.0 ],
					"bgcolor2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.698039215686274, 0.019607843137255, 0.905882352941176, 1.0 ],
					"bgfillcolor_color1" : [ 0.698039215686274, 0.019607843137255, 0.905882352941176, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "gradient",
					"gradient" : 1,
					"id" : "obj-55",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1489.062492000000248, 591.0, 50.0, 22.0 ],
					"text" : "125.83"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1743.99995300000046, 1029.0, 36.5, 22.0 ],
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1743.99995300000046, 984.0, 29.5, 22.0 ],
					"text" : "!- 1."
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-60",
					"maxclass" : "dial",
					"mode" : 3,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 1,
					"parameter_mappable" : 0,
					"patching_rect" : [ 1743.99995300000046, 924.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 974.06249200000002, 398.0, 40.0, 40.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 0.5 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "dial[2]",
							"parameter_mmax" : 1.0,
							"parameter_shortname" : "dial[1]",
							"parameter_type" : 0
						}

					}
,
					"size" : 1.0,
					"varname" : "dial[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1743.99995300000046, 1058.0, 82.0, 22.0 ],
					"text" : "0 0 $1, 0 1 $2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1468.312492000000248, 1158.0, 55.0, 22.0 ],
					"text" : "dac~ 1 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "list" ],
					"patching_rect" : [ 1355.562492000000248, 1109.0, 138.0, 22.0 ],
					"text" : "matrix~ 1 2 1 @ramp 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1214.06249200000002, 752.656253749999905, 30.687492500000076, 30.687492500000076 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 1137.250031000000035, 776.0, 48.0, 22.0 ],
					"text" : "t l b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 1231.31249200000002, 823.0, 34.0, 22.0 ],
					"text" : "flush"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1150.250031000000035, 710.0, 48.0, 22.0 ],
					"text" : "pack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1150.250031000000035, 679.0, 32.0, 22.0 ],
					"text" : "+ 60"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1150.250031000000035, 622.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.985935688018799, 0.0, 0.085993930697441, 1.0 ],
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1537.999953000000232, 757.5, 34.0, 22.0 ],
					"text" : "sel 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1447.312492000000248, 554.0, 103.0, 22.0 ],
					"text" : "scale 0. 1. 10 127"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1328.312492000000248, 554.0, 90.0, 22.0 ],
					"text" : "scale 0. 1. 1 12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1585.812461000000212, 995.0, 110.0, 22.0 ],
					"text" : "scale 10 127 0. 0.7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1444.0, 944.0, 29.5, 22.0 ],
					"text" : "f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1443.437492000000248, 995.0, 130.0, 22.0 ],
					"text" : "scale 10 127 0.05 0.45"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1254.81249200000002, 957.5, 43.0, 22.0 ],
					"text" : "cycle~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1191.06249200000002, 995.5, 68.0, 22.0 ],
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1443.437492000000248, 1031.0, 64.833343999999997, 23.0 ],
					"text" : "* 11025."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 1355.562492000000248, 1067.0, 194.75, 23.0 ],
					"text" : "svf~ 797. 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1027.74998450000021, 851.0, 42.0, 22.0 ],
					"text" : "\\$1 $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-103",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1210.906238250000115, 897.0, 51.749999999999886, 22.0 ],
					"text" : "$1 35"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 1210.906238250000115, 924.0, 34.0, 22.0 ],
					"text" : "line~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-107",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1364.812492000000248, 858.5, 55.0, 23.0 ],
					"text" : "legato 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1277.499999499999831, 1031.0, 44.374985000000123, 22.0 ],
					"text" : "*~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1231.31249200000002, 858.5, 32.0, 22.0 ],
					"text" : "mtof"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1210.906238250000115, 957.5, 37.0, 22.0 ],
					"text" : "saw~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1302.56249200000002, 858.5, 39.0, 22.0 ],
					"text" : "/ 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "", "" ],
					"patching_rect" : [ 1302.56249200000002, 897.0, 129.0, 22.0 ],
					"text" : "adsr~ 20 100 0.5 1000"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-18",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 648.062460999999985, 1048.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 156.250031000000035, 749.0, 32.0, 22.0 ],
					"text" : "gate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 494.312492000000248, 362.0, 97.0, 22.0 ],
					"text" : "scale 0 100 1. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 375.312492000000248, 362.0, 97.0, 22.0 ],
					"text" : "scale 0 100 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 712.562461000000098, 239.0, 77.0, 22.0 ],
					"text" : "loadmess 15"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "number",
					"maximum" : 100,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 712.562461000000098, 269.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 615.562461000000098, 32.749984499999982, 63.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.427450980392157, 0.462745098039216, 0.388235294117647, 1.0 ],
					"id" : "obj-80",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 605.562461000000098, 471.0, 39.0, 39.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 513.562460999999985, 3.749984499999982, 60.500031000000035, 60.500031000000035 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 956.562461000000098, 61.0, 47.0, 22.0 ],
					"text" : "unpack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 956.562461000000098, 34.0, 93.0, 22.0 ],
					"text" : "loadmess 20 20"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 794.562461000000098, 61.0, 47.0, 22.0 ],
					"text" : "unpack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 794.562461000000098, 34.0, 80.0, 22.0 ],
					"text" : "loadmess 1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 605.562461000000098, 519.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.562461000000098, 323.0, 143.0, 22.0 ],
					"text" : "if $f1 >= $i2 then 0 else 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 798.562461000000098, 246.0, 262.0, 22.0 ],
					"text" : "pak 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-97",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 798.562461000000098, 323.0, 77.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 687.562461000000098, 32.749984499999982, 77.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 798.562461000000098, 278.0, 261.0, 22.0 ],
					"text" : "expr sqrt( pow($f1 - $f3\\,2) + pow($f2 - $f4\\, 2) )"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.17 ],
					"bottomvalue" : 100,
					"color" : [ 1.0, 0.117647058823529, 0.117647058823529, 1.0 ],
					"id" : "obj-105",
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 965.562461000000098, 105.0, 100.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.624968999999965, 68.0, 818.0, 478.0 ],
					"rightvalue" : 100,
					"topvalue" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 125.250030999999922, 904.5, 70.0, 22.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 46.749984500000096, 770.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 46.749984500000096, 798.0, 104.0, 22.0 ],
					"text" : "min 0, max 55, 35"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-149",
					"maxclass" : "number",
					"maximum" : 55,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 46.749984500000096, 824.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 414.0, 42.250015500000018, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 125.250030999999922, 954.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.36078431372549, 0.796078431372549, 0.756862745098039, 1.0 ],
					"fontsize" : 16.0,
					"id" : "obj-64",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 125.250030999999922, 932.0, 75.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 414.0, 17.0, 90.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "Saw", "Cycle" ],
							"parameter_longname" : "live.tab",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.tab",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}

					}
,
					"varname" : "live.tab"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 560.999953000000232, 1111.0, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 375.312492000000248, 441.0, 63.0, 22.0 ],
					"text" : "split 0. 1.1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.698039215686274, 0.019607843137255, 0.905882352941176, 1.0 ],
					"bgcolor2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.698039215686274, 0.019607843137255, 0.905882352941176, 1.0 ],
					"bgfillcolor_color1" : [ 0.698039215686274, 0.019607843137255, 0.905882352941176, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "gradient",
					"gradient" : 1,
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 536.062492000000248, 447.0, 50.0, 22.0 ],
					"text" : "125.83"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-196",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 762.999953000000346, 1030.0, 36.5, 22.0 ],
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-194",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 762.999953000000346, 985.0, 29.5, 22.0 ],
					"text" : "!- 1."
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-190",
					"maxclass" : "dial",
					"mode" : 3,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 1,
					"parameter_mappable" : 0,
					"patching_rect" : [ 762.999953000000346, 925.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 913.06249200000002, 398.0, 40.0, 40.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 0.5 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "dial[1]",
							"parameter_mmax" : 1.0,
							"parameter_shortname" : "dial[1]",
							"parameter_type" : 0
						}

					}
,
					"size" : 1.0,
					"varname" : "dial[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-188",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 762.999953000000346, 1059.0, 82.0, 22.0 ],
					"text" : "0 0 $1, 0 1 $2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-186",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 487.312492000000248, 1159.0, 55.0, 22.0 ],
					"text" : "dac~ 1 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-185",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "list" ],
					"patching_rect" : [ 374.562492000000248, 1110.0, 138.0, 22.0 ],
					"text" : "matrix~ 1 2 1 @ramp 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 233.062492000000134, 753.656253749999905, 30.687492500000076, 30.687492500000076 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 156.250031000000035, 777.0, 48.0, 22.0 ],
					"text" : "t l b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 250.31249200000002, 824.0, 34.0, 22.0 ],
					"text" : "flush"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.985935688018799, 0.0, 0.085993930697441, 1.0 ],
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 564.999953000000232, 554.0, 34.0, 22.0 ],
					"text" : "sel 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 494.312492000000248, 410.0, 103.0, 22.0 ],
					"text" : "scale 0. 1. 10 127"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-192",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 375.312492000000248, 410.0, 90.0, 22.0 ],
					"text" : "scale 0. 1. 1 12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 604.812461000000212, 996.0, 110.0, 22.0 ],
					"text" : "scale 10 127 0. 0.7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 463.0, 945.0, 29.5, 22.0 ],
					"text" : "f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 462.437492000000248, 996.0, 130.0, 22.0 ],
					"text" : "scale 10 127 0.05 0.45"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 273.81249200000002, 958.5, 43.0, 22.0 ],
					"text" : "cycle~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 210.062492000000134, 996.5, 68.0, 22.0 ],
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 462.437492000000248, 1032.0, 64.833343999999997, 23.0 ],
					"text" : "* 11025."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 374.562492000000248, 1068.0, 194.75, 23.0 ],
					"text" : "svf~ 797. 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 46.749984500000096, 852.0, 42.0, 22.0 ],
					"text" : "\\$1 $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 229.906238250000115, 898.0, 51.749999999999886, 22.0 ],
					"text" : "$1 35"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 229.906238250000115, 925.0, 34.0, 22.0 ],
					"text" : "line~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-59",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 383.812492000000248, 859.5, 55.0, 23.0 ],
					"text" : "legato 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-151",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 296.499999499999944, 1032.0, 44.374985000000123, 22.0 ],
					"text" : "*~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.31249200000002, 859.5, 32.0, 22.0 ],
					"text" : "mtof"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 229.906238250000115, 958.5, 37.0, 22.0 ],
					"text" : "saw~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-152",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 321.562492000000134, 859.5, 39.0, 22.0 ],
					"text" : "/ 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "", "" ],
					"patching_rect" : [ 321.562492000000134, 898.0, 129.0, 22.0 ],
					"text" : "adsr~ 20 100 0.5 1000"
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bottomvalue" : 100,
					"id" : "obj-106",
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 787.062461000000098, 105.0, 100.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.624968999999965, 68.0, 818.0, 478.0 ],
					"rightvalue" : 100,
					"topvalue" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bottomvalue" : 100,
					"id" : "obj-114",
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1764.062460999999985, 372.0, 100.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1148.062460999999985, 68.0, 818.0, 478.0 ],
					"rightvalue" : 100,
					"topvalue" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-192", 0 ],
					"midpoints" : [ 384.812492000000248, 387.0, 384.812492000000248, 387.0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-229", 1 ],
					"midpoints" : [ 2277.500031000000035, 711.0, 2320.250031000000035, 711.0 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-229", 0 ],
					"midpoints" : [ 2213.500031000000035, 705.0, 2213.250031000000035, 705.0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"midpoints" : [ 1365.062492000000248, 1092.0, 1365.062492000000248, 1092.0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 1 ],
					"midpoints" : [ 1037.24998450000021, 888.0, 1253.156238250000115, 888.0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.985929727554321, 0.0, 0.105064779520035, 1.0 ],
					"destination" : [ "obj-116", 0 ],
					"midpoints" : [ 242.562492000000134, 810.0, 259.81249200000002, 810.0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"midpoints" : [ 1220.406238250000115, 921.0, 1220.406238250000115, 921.0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"midpoints" : [ 1220.406238250000115, 948.0, 1220.406238250000115, 948.0 ],
					"order" : 1,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"midpoints" : [ 1220.406238250000115, 948.0, 1264.31249200000002, 948.0 ],
					"order" : 0,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 3 ],
					"midpoints" : [ 1056.062460999999985, 231.0, 1051.062460999999985, 231.0 ],
					"source" : [ "obj-105", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 2 ],
					"midpoints" : [ 975.062461000000098, 231.0, 970.062461000000098, 231.0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 796.562461000000098, 225.0, 462.0, 225.0, 462.0, 354.0, 384.812492000000248, 354.0 ],
					"order" : 1,
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 877.562461000000098, 225.0, 503.812492000000248, 225.0 ],
					"order" : 1,
					"source" : [ "obj-106", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 1 ],
					"midpoints" : [ 877.562461000000098, 231.0, 889.062461000000098, 231.0 ],
					"order" : 0,
					"source" : [ "obj-106", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"midpoints" : [ 796.562461000000098, 225.0, 808.062461000000098, 225.0 ],
					"order" : 0,
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"midpoints" : [ 1374.312492000000248, 882.0, 1312.06249200000002, 882.0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"midpoints" : [ 1286.999999499999831, 1065.0, 1341.0, 1065.0, 1341.0, 1053.0, 1365.062492000000248, 1053.0 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"midpoints" : [ 1240.81249200000002, 882.0, 1220.406238250000115, 882.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 1 ],
					"midpoints" : [ 471.937492000000248, 1056.0, 471.937492000000248, 1056.0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 1 ],
					"midpoints" : [ 1220.406238250000115, 987.0, 1225.06249200000002, 987.0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"midpoints" : [ 1312.06249200000002, 882.0, 1312.06249200000002, 882.0 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 1 ],
					"midpoints" : [ 1312.06249200000002, 921.0, 1312.374984499999982, 921.0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.985929727554321, 0.0, 0.105064779520035, 1.0 ],
					"destination" : [ "obj-12", 0 ],
					"midpoints" : [ 290.562492000000134, 141.0, 91.562492000000134, 141.0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.985929727554321, 0.0, 0.105064779520035, 1.0 ],
					"destination" : [ "obj-120", 0 ],
					"midpoints" : [ 322.562492000000134, 243.0, 210.0, 243.0, 210.0, 519.0, 223.812492000000134, 519.0 ],
					"source" : [ "obj-113", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 1854.562460999999985, 492.0, 1456.812492000000248, 492.0 ],
					"order" : 1,
					"source" : [ "obj-114", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"midpoints" : [ 1773.562460999999985, 492.0, 1337.812492000000248, 492.0 ],
					"order" : 1,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 1 ],
					"midpoints" : [ 1854.562460999999985, 498.0, 1866.062460999999985, 498.0 ],
					"order" : 0,
					"source" : [ "obj-114", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"midpoints" : [ 1773.562460999999985, 492.0, 1785.062460999999985, 492.0 ],
					"order" : 0,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"midpoints" : [ 194.750031000000035, 810.0, 259.81249200000002, 810.0 ],
					"source" : [ "obj-115", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"midpoints" : [ 165.750031000000035, 810.0, 259.81249200000002, 810.0 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"midpoints" : [ 274.81249200000002, 849.0, 306.0, 849.0, 306.0, 855.0, 331.062492000000134, 855.0 ],
					"source" : [ "obj-116", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"midpoints" : [ 259.81249200000002, 849.0, 259.81249200000002, 849.0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-211", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"midpoints" : [ 91.562492000000134, 168.0, 91.562492000000134, 168.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-150", 0 ],
					"midpoints" : [ 223.812492000000134, 558.0, 223.762492000000123, 558.0 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"midpoints" : [ 247.062492000000134, 483.0, 223.812492000000134, 483.0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"midpoints" : [ 248.812492000000134, 522.0, 225.0, 522.0, 225.0, 528.0, 223.812492000000134, 528.0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-234", 1 ],
					"midpoints" : [ 2488.5, 699.0, 2529.5, 699.0 ],
					"source" : [ "obj-123", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-234", 0 ],
					"midpoints" : [ 2457.5, 693.0, 2457.5, 693.0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"midpoints" : [ 2457.5, 663.0, 2457.5, 663.0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"midpoints" : [ 56.249984500000096, 822.0, 56.249984500000096, 822.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"midpoints" : [ 1159.750031000000035, 675.0, 1159.750031000000035, 675.0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"midpoints" : [ 247.312492000000134, 375.0, 247.062492000000134, 375.0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"midpoints" : [ 234.812492000000134, 282.0, 234.812492000000134, 282.0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 247.312492000000134, 309.0, 247.312492000000134, 309.0 ],
					"source" : [ "obj-133", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"midpoints" : [ 259.812492000000134, 309.0, 259.812492000000134, 309.0 ],
					"source" : [ "obj-133", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 259.812492000000134, 342.0, 249.0, 342.0, 249.0, 348.0, 247.312492000000134, 348.0 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"midpoints" : [ 2377.5, 847.5, 2377.5, 847.5 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-192", 4 ],
					"midpoints" : [ 91.562492000000134, 414.0, 360.0, 414.0, 360.0, 396.0, 441.612492000000259, 396.0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 2213.250031000000035, 666.0, 2213.500031000000035, 666.0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"midpoints" : [ 2606.5, 847.5, 2606.5, 847.5 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"midpoints" : [ 219.562492000000134, 102.0, 219.562492000000134, 102.0 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"midpoints" : [ 91.562492000000134, 237.0, 91.562492000000134, 237.0 ],
					"order" : 1,
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 91.562492000000134, 246.0, 153.062492000000134, 246.0 ],
					"order" : 0,
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"midpoints" : [ 102.062492000000134, 132.0, 102.062492000000134, 132.0 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"midpoints" : [ 56.249984500000096, 849.0, 56.249984500000096, 849.0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 1 ],
					"midpoints" : [ 56.249984500000096, 885.0, 272.156238250000001, 885.0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"midpoints" : [ 223.762492000000123, 597.0, 223.762492000000123, 597.0 ],
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"midpoints" : [ 305.999999499999944, 1065.0, 384.062492000000248, 1065.0 ],
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 331.062492000000134, 882.0, 331.062492000000134, 882.0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 1 ],
					"midpoints" : [ 91.562492000000134, 204.0, 440.812492000000134, 204.0 ],
					"order" : 0,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"midpoints" : [ 91.562492000000134, 195.0, 91.562492000000134, 195.0 ],
					"order" : 1,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 1 ],
					"midpoints" : [ 223.762492000000123, 735.0, 178.750031000000035, 735.0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"midpoints" : [ 239.406238250000115, 921.0, 239.406238250000115, 921.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"midpoints" : [ 423.0, 75.0, 306.0, 75.0, 306.0, 72.0, 219.562492000000134, 72.0 ],
					"source" : [ "obj-160", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"midpoints" : [ 434.5, 75.0, 336.0, 75.0, 336.0, 3.0, 91.562492000000134, 3.0 ],
					"source" : [ "obj-160", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"midpoints" : [ 411.5, 75.0, 306.0, 75.0, 306.0, 72.0, 290.562492000000134, 72.0 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"midpoints" : [ 91.562492000000134, 87.0, 195.0, 87.0, 195.0, 75.0, 219.562492000000134, 75.0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"midpoints" : [ 102.062492000000134, 102.0, 102.062492000000134, 102.0 ],
					"source" : [ "obj-161", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.048551242798567, 0.426219582557678, 0.998394191265106, 1.0 ],
					"destination" : [ "obj-132", 1 ],
					"midpoints" : [ 230.062492000000134, 243.0, 245.312492000000134, 243.0 ],
					"order" : 0,
					"source" : [ "obj-162", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.048551242798567, 0.426219582557678, 0.998394191265106, 1.0 ],
					"destination" : [ "obj-137", 1 ],
					"midpoints" : [ 230.062492000000134, 237.0, 129.0, 237.0, 129.0, 291.0, 102.062492000000134, 291.0 ],
					"order" : 1,
					"source" : [ "obj-162", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"midpoints" : [ 219.562492000000134, 132.0, 267.0, 132.0, 267.0, 72.0, 290.562492000000134, 72.0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-157", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"midpoints" : [ 239.406238250000115, 948.0, 239.406238250000115, 948.0 ],
					"order" : 1,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 239.406238250000115, 954.0, 283.31249200000002, 954.0 ],
					"order" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"midpoints" : [ 2495.5, 840.5, 2495.5, 840.5 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-178", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 1 ],
					"midpoints" : [ 2038.750031000000035, 723.0, 2038.750031000000035, 723.0 ],
					"source" : [ "obj-180", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"midpoints" : [ 2028.250031000000035, 723.0, 1867.750031000000035, 723.0 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-201", 0 ],
					"midpoints" : [ 1867.750031000000035, 753.0, 1867.750031000000035, 753.0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 1 ],
					"midpoints" : [ 2053.750031000000035, 660.0, 2053.750031000000035, 660.0 ],
					"source" : [ "obj-182", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"midpoints" : [ 2043.250031000000035, 660.0, 1882.750031000000035, 660.0 ],
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"midpoints" : [ 2266.5, 840.5, 2266.5, 840.5 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"midpoints" : [ 1882.750031000000035, 717.0, 1867.750031000000035, 717.0 ],
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 1 ],
					"midpoints" : [ 443.562492000000248, 1146.0, 532.812492000000248, 1146.0 ],
					"source" : [ "obj-185", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 0 ],
					"midpoints" : [ 384.062492000000248, 1146.0, 496.812492000000248, 1146.0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-222", 0 ],
					"midpoints" : [ 893.750031000000035, 576.0, 993.0, 576.0, 993.0, 471.0, 948.0, 471.0, 948.0, 447.0, 962.250031000000035, 447.0 ],
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"midpoints" : [ 772.499953000000346, 1143.0, 360.0, 1143.0, 360.0, 1104.0, 384.062492000000248, 1104.0 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 1 ],
					"order" : 0,
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-194", 0 ],
					"midpoints" : [ 772.499953000000346, 966.0, 772.499953000000346, 966.0 ],
					"order" : 2,
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 1 ],
					"midpoints" : [ 772.499953000000346, 966.0, 747.0, 966.0, 747.0, 1017.0, 789.999953000000346, 1017.0 ],
					"order" : 1,
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 384.812492000000248, 435.0, 384.812492000000248, 435.0 ],
					"source" : [ "obj-192", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"midpoints" : [ 772.499953000000346, 1008.0, 772.499953000000346, 1008.0 ],
					"source" : [ "obj-194", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"midpoints" : [ 772.499953000000346, 1053.0, 772.499953000000346, 1053.0 ],
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"midpoints" : [ 2043.250031000000035, 627.0, 2043.250031000000035, 627.0 ],
					"source" : [ "obj-198", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"midpoints" : [ 1867.750031000000035, 669.0, 1882.750031000000035, 669.0 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"midpoints" : [ 153.062492000000134, 273.0, 210.0, 273.0, 210.0, 252.0, 234.812492000000134, 252.0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"midpoints" : [ 134.750030999999922, 927.0, 134.750030999999922, 927.0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 0 ],
					"midpoints" : [ 1959.750031000000035, 825.0, 2059.0, 825.0, 2059.0, 720.0, 2014.0, 720.0, 2014.0, 696.0, 2028.250031000000035, 696.0 ],
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-203", 0 ],
					"midpoints" : [ 1867.750031000000035, 813.0, 1867.750031000000035, 813.0 ],
					"source" : [ "obj-201", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 0 ],
					"midpoints" : [ 801.750031000000035, 420.0, 816.750031000000035, 420.0 ],
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 1867.750031000000035, 846.0, 1638.0, 846.0, 1638.0, 660.0, 1588.062460999999985, 660.0 ],
					"source" : [ "obj-203", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"source" : [ "obj-205", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-207", 0 ],
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.925490196078431, 0.325490196078431, 0.92156862745098, 1.0 ],
					"destination" : [ "obj-77", 1 ],
					"midpoints" : [ 1266.812492000000248, 561.0, 1227.0, 561.0, 1227.0, 639.0, 1242.0, 639.0, 1242.0, 696.0, 1188.750031000000035, 696.0 ],
					"source" : [ "obj-206", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.595259428024292, 0.0, 0.797164142131805, 1.0 ],
					"destination" : [ "obj-77", 1 ],
					"midpoints" : [ 1251.812492000000248, 696.0, 1188.750031000000035, 696.0 ],
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-215", 0 ],
					"midpoints" : [ 977.250031000000035, 378.0, 977.250031000000035, 378.0 ],
					"source" : [ "obj-208", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"midpoints" : [ 816.750031000000035, 468.0, 801.750031000000035, 468.0 ],
					"source" : [ "obj-209", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"midpoints" : [ 1723.062460999999985, 324.0, 1781.062460999999985, 324.0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.631372549019608, 0.156862745098039, 0.831372549019608, 1.0 ],
					"destination" : [ "obj-156", 1 ],
					"midpoints" : [ 381.812492000000248, 537.0, 306.0, 537.0, 306.0, 588.0, 252.762492000000123, 588.0 ],
					"source" : [ "obj-210", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-204", 0 ],
					"midpoints" : [ 366.812492000000248, 509.0, 432.812492000000248, 509.0 ],
					"order" : 0,
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-210", 0 ],
					"order" : 1,
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.595259428024292, 0.0, 0.797164142131805, 1.0 ],
					"destination" : [ "obj-156", 1 ],
					"midpoints" : [ 366.812492000000248, 588.0, 252.762492000000123, 588.0 ],
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 1 ],
					"midpoints" : [ 987.750031000000035, 411.0, 987.750031000000035, 411.0 ],
					"source" : [ "obj-215", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 0 ],
					"midpoints" : [ 977.250031000000035, 411.0, 816.750031000000035, 411.0 ],
					"source" : [ "obj-215", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 2040.5, 333.0, 1980.0, 333.0, 1980.0, 324.0, 1943.062460999999985, 324.0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"midpoints" : [ 801.750031000000035, 504.0, 801.750031000000035, 504.0 ],
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 1 ],
					"midpoints" : [ 972.750031000000035, 474.0, 972.750031000000035, 474.0 ],
					"source" : [ "obj-222", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"midpoints" : [ 962.250031000000035, 474.0, 801.750031000000035, 474.0 ],
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-229", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"midpoints" : [ 2213.250031000000035, 741.0, 2205.0, 741.0, 2205.0, 771.0, 2213.250031000000035, 771.0 ],
					"order" : 1,
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 1 ],
					"midpoints" : [ 2213.250031000000035, 741.0, 2290.250031000000035, 741.0 ],
					"order" : 0,
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 1 ],
					"midpoints" : [ 2284.58336433333352, 741.0, 2417.750031000000035, 741.0 ],
					"order" : 0,
					"source" : [ "obj-229", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-158", 0 ],
					"midpoints" : [ 2284.58336433333352, 741.0, 2320.250031000000035, 741.0 ],
					"order" : 1,
					"source" : [ "obj-229", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"source" : [ "obj-229", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"midpoints" : [ 1146.750031000000035, 771.0, 1146.750031000000035, 771.0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"source" : [ "obj-234", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-148", 1 ],
					"midpoints" : [ 2457.5, 732.0, 2515.5, 732.0 ],
					"order" : 0,
					"source" : [ "obj-234", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 1 ],
					"midpoints" : [ 2505.5, 732.0, 2609.5, 732.0 ],
					"order" : 0,
					"source" : [ "obj-234", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"midpoints" : [ 2505.5, 732.0, 2529.5, 732.0 ],
					"order" : 1,
					"source" : [ "obj-234", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-234", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 2457.5, 732.0, 2457.5, 732.0 ],
					"order" : 1,
					"source" : [ "obj-234", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"midpoints" : [ 1456.812492000000248, 531.0, 1456.812492000000248, 531.0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"midpoints" : [ 1337.812492000000248, 531.0, 1337.812492000000248, 531.0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 1699.062460999999985, 531.0, 1699.062460999999985, 531.0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 1 ],
					"midpoints" : [ 1699.062460999999985, 576.0, 1716.062460999999985, 576.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"midpoints" : [ 1588.062460999999985, 714.5, 1588.062460999999985, 714.5 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 0 ],
					"midpoints" : [ 570.499953000000232, 1146.0, 496.812492000000248, 1146.0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 1 ],
					"midpoints" : [ 1971.062460999999985, 351.0, 2033.062460999999985, 351.0 ],
					"source" : [ "obj-30", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 1943.062460999999985, 366.0, 1952.062460999999985, 366.0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 1943.062460999999985, 324.0, 1943.062460999999985, 324.0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 1 ],
					"midpoints" : [ 1809.062460999999985, 351.0, 1854.562460999999985, 351.0 ],
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 1781.062460999999985, 351.0, 1773.562460999999985, 351.0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 722.062461000000098, 264.0, 722.062461000000098, 264.0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 1 ],
					"midpoints" : [ 722.062461000000098, 309.0, 739.062461000000098, 309.0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"midpoints" : [ 384.062492000000248, 1092.0, 384.062492000000248, 1092.0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"midpoints" : [ 1781.062460999999985, 324.0, 1781.062460999999985, 324.0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 1588.062460999999985, 747.0, 1254.0, 747.0, 1254.0, 738.0, 1200.0, 738.0, 1200.0, 744.0, 1146.750031000000035, 744.0 ],
					"order" : 1,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"midpoints" : [ 1588.062460999999985, 747.0, 1548.0, 747.0, 1548.0, 753.0, 1547.499953000000232, 753.0 ],
					"order" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 165.750031000000035, 774.0, 165.750031000000035, 774.0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"midpoints" : [ 1592.062460999999985, 660.0, 1845.0, 660.0, 1845.0, 771.0, 1959.750031000000035, 771.0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"midpoints" : [ 614.312461000000212, 1035.0, 657.562460999999985, 1035.0 ],
					"order" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 2 ],
					"midpoints" : [ 614.312461000000212, 1053.0, 559.812492000000248, 1053.0 ],
					"order" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ 1785.062460999999985, 537.0, 1785.062460999999985, 537.0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"midpoints" : [ 1785.062460999999985, 570.0, 1592.062460999999985, 570.0 ],
					"order" : 1,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"midpoints" : [ 1785.062460999999985, 570.0, 1785.062460999999985, 570.0 ],
					"order" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 3 ],
					"midpoints" : [ 2033.062460999999985, 507.0, 2028.062460999999985, 507.0 ],
					"source" : [ "obj-43", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 2 ],
					"midpoints" : [ 1952.062460999999985, 507.0, 1947.062460999999985, 507.0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 1 ],
					"midpoints" : [ 331.062492000000134, 921.0, 331.374984500000096, 921.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"midpoints" : [ 1115.750031000000035, 927.0, 1115.750031000000035, 927.0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ 1037.24998450000021, 792.0, 1037.24998450000021, 792.0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"midpoints" : [ 1037.24998450000021, 822.0, 1037.24998450000021, 822.0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"midpoints" : [ 1037.24998450000021, 846.0, 1037.24998450000021, 846.0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"midpoints" : [ 1115.750031000000035, 990.0, 1200.56249200000002, 990.0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"midpoints" : [ 472.5, 981.0, 614.312461000000212, 981.0 ],
					"order" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"midpoints" : [ 472.5, 969.0, 471.937492000000248, 969.0 ],
					"order" : 1,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 1115.750031000000035, 951.0, 1115.750031000000035, 951.0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 1 ],
					"midpoints" : [ 239.406238250000115, 987.0, 244.062492000000134, 987.0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 259.81249200000002, 882.0, 239.406238250000115, 882.0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"midpoints" : [ 1551.499953000000232, 1143.0, 1477.812492000000248, 1143.0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.033413045108318, 0.327191948890686, 0.998327136039734, 1.0 ],
					"destination" : [ "obj-79", 0 ],
					"midpoints" : [ 1381.812492000000248, 618.0, 1209.0, 618.0, 1209.0, 609.0, 1159.750031000000035, 609.0 ],
					"source" : [ "obj-54", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"midpoints" : [ 1753.49995300000046, 1053.0, 1753.49995300000046, 1053.0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"midpoints" : [ 1753.49995300000046, 1008.0, 1753.49995300000046, 1008.0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 0 ],
					"midpoints" : [ 219.562492000000134, 1029.0, 305.999999499999944, 1029.0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 393.312492000000248, 885.0, 331.062492000000134, 885.0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"midpoints" : [ 503.812492000000248, 387.0, 503.812492000000248, 387.0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 1 ],
					"midpoints" : [ 1753.49995300000046, 981.0, 1773.0, 981.0, 1773.0, 1023.0, 1770.99995300000046, 1023.0 ],
					"order" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 1753.49995300000046, 966.0, 1753.49995300000046, 966.0 ],
					"order" : 1,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"midpoints" : [ 1753.49995300000046, 1143.0, 1341.0, 1143.0, 1341.0, 1104.0, 1365.062492000000248, 1104.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 2 ],
					"midpoints" : [ 283.31249200000002, 981.0, 268.562492000000134, 981.0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"midpoints" : [ 574.499953000000232, 738.0, 242.562492000000134, 738.0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"midpoints" : [ 134.750030999999922, 951.0, 134.750030999999922, 951.0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"midpoints" : [ 134.750030999999922, 990.0, 219.562492000000134, 990.0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 1 ],
					"midpoints" : [ 1424.562492000000248, 1143.0, 1513.812492000000248, 1143.0 ],
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"midpoints" : [ 1365.062492000000248, 1143.0, 1477.812492000000248, 1143.0 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 1063.5, 66.0, 1005.0, 66.0, 1005.0, 57.0, 966.062461000000098, 57.0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"midpoints" : [ 746.062460999999985, 57.0, 804.062461000000098, 57.0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 471.937492000000248, 1020.0, 471.937492000000248, 1020.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"midpoints" : [ 290.562492000000134, 102.0, 290.562492000000134, 102.0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"midpoints" : [ 801.750031000000035, 564.0, 801.750031000000035, 564.0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"midpoints" : [ 801.750031000000035, 597.0, 663.0, 597.0, 663.0, 456.0, 615.062461000000098, 456.0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.985929727554321, 0.0, 0.105064779520035, 1.0 ],
					"destination" : [ "obj-75", 0 ],
					"midpoints" : [ 1223.56249200000002, 810.0, 1240.81249200000002, 810.0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"midpoints" : [ 1175.750031000000035, 810.0, 1240.81249200000002, 810.0 ],
					"source" : [ "obj-74", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"midpoints" : [ 1146.750031000000035, 810.0, 1240.81249200000002, 810.0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"midpoints" : [ 1240.81249200000002, 846.0, 1240.81249200000002, 846.0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"midpoints" : [ 1255.81249200000002, 846.0, 1287.0, 846.0, 1287.0, 852.0, 1312.06249200000002, 852.0 ],
					"source" : [ "obj-75", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 56.249984500000096, 795.0, 56.249984500000096, 795.0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 1 ],
					"midpoints" : [ 1159.750031000000035, 735.0, 1159.750031000000035, 735.0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"midpoints" : [ 1159.750031000000035, 702.0, 1159.750031000000035, 702.0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"midpoints" : [ 1159.750031000000035, 645.0, 1159.750031000000035, 645.0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.019607843137255, 0.0, 1.0, 1.0 ],
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 428.812492000000248, 483.0, 248.812492000000134, 483.0 ],
					"order" : 1,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 1 ],
					"midpoints" : [ 428.812492000000248, 483.0, 467.5, 483.0 ],
					"order" : 0,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"midpoints" : [ 615.062461000000098, 513.0, 615.062461000000098, 513.0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 1 ],
					"midpoints" : [ 994.062461000000098, 84.0, 1056.062460999999985, 84.0 ],
					"source" : [ "obj-81", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"midpoints" : [ 966.062461000000098, 99.0, 975.062461000000098, 99.0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 966.062461000000098, 57.0, 966.062461000000098, 57.0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.564705882352941, 0.317647058823529, 0.905882352941176, 1.0 ],
					"destination" : [ "obj-214", 1 ],
					"midpoints" : [ 503.812492000000248, 483.0, 411.0, 483.0, 411.0, 516.0, 402.0, 516.0, 402.0, 549.0, 399.812492000000248, 549.0 ],
					"order" : 2,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"midpoints" : [ 503.812492000000248, 444.0, 576.562492000000248, 444.0 ],
					"order" : 0,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.595259428024292, 0.0, 0.797164142131805, 1.0 ],
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 503.812492000000248, 930.0, 472.5, 930.0 ],
					"order" : 1,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"midpoints" : [ 1547.499953000000232, 780.0, 1254.0, 780.0, 1254.0, 738.0, 1223.56249200000002, 738.0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.682352941176471, 0.247058823529412, 0.964705882352941, 1.0 ],
					"destination" : [ "obj-207", 1 ],
					"midpoints" : [ 1456.812492000000248, 579.0, 1428.0, 579.0, 1428.0, 540.0, 1287.0, 540.0, 1287.0, 573.0, 1284.812492000000248, 573.0 ],
					"order" : 2,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"midpoints" : [ 1456.812492000000248, 588.0, 1529.562492000000248, 588.0 ],
					"order" : 0,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.595259428024292, 0.0, 0.797164142131805, 1.0 ],
					"destination" : [ "obj-90", 0 ],
					"midpoints" : [ 1456.812492000000248, 939.0, 1453.5, 939.0 ],
					"order" : 1,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 1 ],
					"midpoints" : [ 832.062461000000098, 84.0, 877.562461000000098, 84.0 ],
					"source" : [ "obj-86", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"midpoints" : [ 804.062461000000098, 84.0, 796.562461000000098, 84.0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"midpoints" : [ 1337.812492000000248, 579.0, 1337.812492000000248, 579.0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 2 ],
					"midpoints" : [ 1595.312461000000212, 1053.0, 1540.812492000000248, 1053.0 ],
					"order" : 1,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"midpoints" : [ 1595.312461000000212, 1032.0, 1638.562460999999985, 1032.0 ],
					"order" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"midpoints" : [ 804.062461000000098, 57.0, 804.062461000000098, 57.0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"midpoints" : [ 1453.5, 981.0, 1595.312461000000212, 981.0 ],
					"order" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"midpoints" : [ 1453.5, 969.0, 1452.937492000000248, 969.0 ],
					"order" : 1,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"midpoints" : [ 615.062461000000098, 735.0, 165.750031000000035, 735.0 ],
					"order" : 1,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"midpoints" : [ 615.062461000000098, 543.0, 576.0, 543.0, 576.0, 549.0, 574.499953000000232, 549.0 ],
					"order" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"midpoints" : [ 808.062461000000098, 270.0, 808.062461000000098, 270.0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"midpoints" : [ 1452.937492000000248, 1020.0, 1452.937492000000248, 1020.0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 2 ],
					"midpoints" : [ 1264.31249200000002, 981.0, 1249.56249200000002, 981.0 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"midpoints" : [ 1200.56249200000002, 1029.0, 1272.0, 1029.0, 1272.0, 1026.0, 1286.999999499999831, 1026.0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"midpoints" : [ 615.062461000000098, 433.0, 777.0, 433.0, 777.0, 522.0, 893.750031000000035, 522.0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ 808.062461000000098, 303.0, 615.062461000000098, 303.0 ],
					"order" : 1,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"midpoints" : [ 808.062461000000098, 303.0, 808.062461000000098, 303.0 ],
					"order" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 1 ],
					"midpoints" : [ 1452.937492000000248, 1056.0, 1452.937492000000248, 1056.0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-153" : [ "live.tab[3]", "live.tab[3]", 0 ],
			"obj-190" : [ "dial[1]", "dial[1]", 0 ],
			"obj-211" : [ "live.text", "live.text", 0 ],
			"obj-50" : [ "live.tab[2]", "live.tab", 0 ],
			"obj-60" : [ "dial[2]", "dial[1]", 0 ],
			"obj-64" : [ "live.tab", "live.tab", 0 ],
			"parameterbanks" : 			{

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Audiomix",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Luca",
				"default" : 				{
					"selectioncolor" : [ 0.720698, 0.16723, 0.080014, 1.0 ],
					"elementcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
					"textcolor_inverse" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"color2" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"fontname" : [ "Open Sans Semibold" ],
					"bgcolor" : [ 0.904179, 0.895477, 0.842975, 0.56 ],
					"accentcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"color" : [ 0.475135, 0.293895, 0.251069, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "M4L 10 Bold",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.0, 0.0, 0.0, 0.25 ],
					"fontface" : [ 1 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Matt",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontface" : [ 1 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Max 12 Regular",
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Max For Live",
				"default" : 				{
					"patchlinecolor" : [ 0.239216, 0.254902, 0.278431, 0.631373 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Max6",
				"newobj" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.907107, 0.934609, 0.842715, 1.0 ],
					"accentcolor" : [ 0.428344, 0.457097, 0.497329, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 1
			}
, 			{
				"name" : "Organic",
				"default" : 				{
					"elementcolor" : [ 0.498039, 0.462745, 0.376471, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.639216, 0.458824, 0.070588, 1.0 ],
						"color2" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"bgcolor" : [ 0.423529, 0.356863, 0.184314, 1.0 ],
					"accentcolor" : [ 0.45098, 0.635294, 0.298039, 1.0 ],
					"color" : [ 0.584314, 0.764706, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "WTF",
				"default" : 				{
					"elementcolor" : [ 0.461105, 0.492646, 0.591878, 1.0 ],
					"fontsize" : [ 18.0 ],
					"patchlinecolor" : [ 0.231373, 0.121569, 0.305882, 0.9 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"fontname" : [ "HydrogenType" ],
					"bgcolor" : [ 0.163647, 0.174699, 0.17409, 1.0 ],
					"accentcolor" : [ 0.50764, 0.065317, 0.112129, 1.0 ],
					"color" : [ 0.113725, 0.580392, 0.737255, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Yot-Default",
				"default" : 				{
					"fontsize" : [ 10.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "ak.bigger",
				"default" : 				{
					"selectioncolor" : [ 0.532195, 0.84546, 0.169658, 1.0 ],
					"elementcolor" : [ 0.402827, 0.442342, 0.446734, 1.0 ],
					"fontsize" : [ 14.0 ],
					"textcolor_inverse" : [ 0.959262, 0.956712, 0.966038, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 277.842322000000024,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.580992, 0.600466, 0.396627, 1.0 ],
						"color2" : [ 0.326279, 0.337174, 0.223978, 1.0 ],
						"proportion" : 0.484956,
						"pt1" : [ 0.485149, 0.026087 ],
						"pt2" : [ 0.559406, 0.565217 ],
						"type" : "gradient"
					}
,
					"fontname" : [ "Lato" ],
					"color" : [ 0.860949, 0.86278, 0.710083, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "buttonBlue",
				"default" : 				{
					"bgcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "buttonGreen-1",
				"default" : 				{
					"bgcolor" : [ 0.043137, 0.364706, 0.094118, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "buttonPurple",
				"default" : 				{
					"bgcolor" : [ 0.372549, 0.196078, 0.486275, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classic",
				"default" : 				{
					"fontsize" : [ 9.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patchlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"color" : [ 0.839216, 0.839216, 0.839216, 1.0 ],
						"color1" : [ 0.83978, 0.839941, 0.839753, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"fontname" : [ "Geneva" ],
					"bgcolor" : [ 0.83978, 0.839941, 0.839753, 1.0 ],
					"accentcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"color" : [ 0.498039, 0.498039, 0.498039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicButton",
				"default" : 				{
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicDial",
				"default" : 				{
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicGain~",
				"default" : 				{
					"color" : [ 0.380392, 0.380392, 0.380392, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicGswitch",
				"default" : 				{
					"accentcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicGswitch2",
				"default" : 				{
					"accentcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicKslider",
				"default" : 				{
					"selectioncolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicLed",
				"default" : 				{
					"elementcolor" : [ 0.6, 0.0, 0.0, 1.0 ],
					"color" : [ 1.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicMatrixctrl",
				"default" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicMeter~",
				"default" : 				{
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"bgcolor" : [ 0.380392, 0.380392, 0.380392, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicNodes",
				"default" : 				{
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"fontsize" : [ 9.0 ],
					"color" : [ 0.839216, 0.839216, 0.839216, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicNslider",
				"default" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicNumber",
				"default" : 				{
					"selectioncolor" : [ 1.0, 0.890196, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicPictslider",
				"default" : 				{
					"elementcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicPreset",
				"default" : 				{
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicScope~",
				"default" : 				{
					"bgcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"color" : [ 0.462745, 0.933333, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicTab",
				"default" : 				{
					"elementcolor" : [ 0.839216, 0.839216, 0.839216, 1.0 ],
					"color" : [ 0.498039, 0.498039, 0.498039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicTextbutton",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicToggle",
				"default" : 				{
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"color" : [ 0.380392, 0.380392, 0.380392, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicUmenu",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "classicWaveform~",
				"default" : 				{
					"selectioncolor" : [ 0.498039, 0.498039, 0.498039, 0.5 ],
					"color" : [ 0.380392, 0.380392, 0.380392, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "dark grey",
				"default" : 				{
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 0.9 ]
				}
,
				"parentstyle" : "oldskool2",
				"multi" : 0
			}
, 			{
				"name" : "dark-night-patch",
				"default" : 				{
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"patchlinecolor" : [ 0.439216, 0.74902, 0.254902, 0.898039 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "envelope_m4l",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "haeblu",
				"default" : 				{
					"elementcolor" : [ 0.522397, 0.541645, 0.600966, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"bgcolor" : [ 0.34902, 0.403922, 0.454902, 1.0 ],
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "irv",
				"default" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patchlinecolor" : [ 0.0, 0.0, 0.0, 0.9 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"color2" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"fontname" : [ "Inconsolata Regular" ],
					"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"accentcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.941176, 0.690196, 0.196078, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jfc-style",
				"default" : 				{
					"selectioncolor" : [ 0.219607843137255, 0.996078431372549, 0.345098039215686, 1.0 ],
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"locked_bgcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"stripecolor" : [ 0.811764705882353, 0.811764705882353, 0.811764705882353, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0.0,
						"color" : [ 0.737254901960784, 0.737254901960784, 0.737254901960784, 1.0 ],
						"color1" : [ 0.301961, 0.301961, 0.301961, 1.0 ],
						"color2" : [ 0.2, 0.2, 0.2, 1.0 ],
						"proportion" : 0.5,
						"type" : "color"
					}
,
					"bgcolor" : [ 0.901960784313726, 0.901960784313726, 0.901960784313726, 1.0 ],
					"color" : [ 0.317647058823529, 0.305882352941176, 0.996078431372549, 1.0 ],
					"editing_bgcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jfc-style-01",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"accentcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.031373, 0.541176, 0.498039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpatcher001",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.0, 0.0, 0.0, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"bgcolor" : [ 0.163647, 0.174699, 0.17409, 1.0 ],
					"color" : [ 0.614285, 0.654518, 0.758022, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpatcher002",
				"default" : 				{
					"fontsize" : [ 9.5 ],
					"clearcolor" : [ 0.32549, 0.345098, 0.372549, 0.0 ],
					"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.32549, 0.345098, 0.372549, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"fontname" : [ "Ableton Sans Book" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpink",
				"default" : 				{
					"selectioncolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"elementcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"textcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"clearcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
					"patchlinecolor" : [ 0.65, 0.65, 0.65, 1.0 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.619608, 0.0, 0.360784, 1.0 ],
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"accentcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
					"color" : [ 0.619608, 0.0, 0.360784, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "ksliderWhite",
				"default" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "lightbutton",
				"default" : 				{
					"elementcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ],
					"bgcolor" : [ 0.309495, 0.299387, 0.299789, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-1-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-1-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-1-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-2-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-2-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-2-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-2-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-2-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-3-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-3-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-3-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-3-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-3-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-4",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-4-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-4-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"patchlinecolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "mr-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "multisliderBlue&Yellow",
				"default" : 				{
					"bgcolor" : [ 0.317647, 0.654902, 0.976471, 0.79 ],
					"color" : [ 0.960784, 0.867826, 0.084811, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "multisliderred",
				"default" : 				{
					"bgcolor" : [ 0.380952, 0.332597, 0.304988, 1.0 ],
					"accentcolor" : [ 0.997732, 0.890759, 0.021192, 1.0 ],
					"color" : [ 0.665086, 0.106606, 0.136815, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-2",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-3",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBrown-1",
				"default" : 				{
					"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjCyan-1",
				"default" : 				{
					"accentcolor" : [ 0.029546, 0.773327, 0.821113, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-2",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-3",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjMagenta-1",
				"default" : 				{
					"accentcolor" : [ 0.840663, 0.060168, 0.769195, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjRed-1",
				"default" : 				{
					"accentcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-2",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-3",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-1",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "oldskool",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patchlinecolor" : [ 0.0, 0.0, 0.0, 0.9 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "oldskool-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "oldskool-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patchlinecolor" : [ 0.0, 0.0, 0.0, 0.9 ],
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "oldskool2",
				"default" : 				{
					"patchlinecolor" : [ 0.239216, 0.254902, 0.278431, 0.9 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "orange 1",
				"panel" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.870588, 0.415686, 0.062745, 1.0 ],
						"color2" : [ 0.0, 0.0, 0.0, 1.0 ],
						"proportion" : 0.39,
						"type" : "gradient"
					}
,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "panel001",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 90.0,
						"autogradient" : 0,
						"color" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
						"color1" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
						"color2" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}
,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "panelViolet",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.372549, 0.196078, 0.486275, 0.2 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "patcher",
				"default" : 				{
					"accentcolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ]
				}
,
				"parentstyle" : "oldskool",
				"multi" : 0
			}
, 			{
				"name" : "purple",
				"default" : 				{
					"textcolor_inverse" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgcolor" : [ 0.304029, 0.250694, 0.285628, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "receives",
				"default" : 				{
					"accentcolor" : [ 0.870588, 0.415686, 0.062745, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "rsliderGold",
				"default" : 				{
					"bgcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ],
					"color" : [ 0.646639, 0.821777, 0.854593, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-1-4",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-4",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-1-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-2-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-2-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-4",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-1-5",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-2-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-2-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-2-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-2-4",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-4",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-1-6",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-10",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-11",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-12",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-13",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-14",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-4",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-5",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-6",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-6-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-6-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-6-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-6-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-7",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-8",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-8-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-8-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-1-9",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-10",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-11",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-12",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-13",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-14",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-15",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-2-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-2-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-2-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-3-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-4",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-6",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-7",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-7-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-7-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-7-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-7-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-8",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-9",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-1-9-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-1-9-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-10",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-11",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-11-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-11-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-12",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-13",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-14",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-15",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-16",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-17",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-4",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-4-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-4-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-4-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-5-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-6",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-7",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-8",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-9",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-9-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-1-9-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-9-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-1-9-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-10",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-11",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-12",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-12-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-12-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-12-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-12-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-13",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-14",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-14-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-14-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-15",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-16",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-17",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-18",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-19",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-2-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-2-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-20",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-4",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-5",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-5-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-5-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-6",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-6-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-6-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-7",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-8",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-1-8-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-1-9",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-10",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-11",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-12",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-13",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-13-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-13-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-13-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-13-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-14",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-15",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-15-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-15-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-16",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-17",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-18",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-19",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-2-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-20",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-21",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-3",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-4",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-6",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-6-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-6-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-7",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-7-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-7-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-8",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-1-9",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-1-9-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-10",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-10-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-11",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-12",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-13",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-14",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-14-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-14-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-14-1-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-14-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-15",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-16",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-16-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-16-2",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-17",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-18",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-19",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-2",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-2-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-2-1-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-20",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-21",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-22",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-3",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-4",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-5",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-6",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-6-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-7",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-7-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-7-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-8",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-8-1",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"color" : [ 0.541176, 0.815686, 0.913725, 1.0 ]
				}
,
				"newobj" : 				{
					"fontsize" : [ 10.0 ],
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : [ "Arial Bold" ],
					"bgcolor" : [ 0.92813, 1.0, 0.977918, 1.0 ],
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "send/receive-8-1-1",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "send/receive-9",
				"newobj" : 				{
					"accentcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ]
				}
,
				"parentstyle" : "patcher",
				"multi" : 1
			}
, 			{
				"name" : "sends",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "sliderGold-1",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ],
					"color" : [ 0.907107, 0.934609, 0.842715, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "stb001",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial Bold" ],
					"fontface" : [ 1 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tap",
				"default" : 				{
					"fontname" : [ "Lato Light" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tastefulltoggle",
				"default" : 				{
					"bgcolor" : [ 0.185512, 0.263736, 0.260626, 1.0 ],
					"color" : [ 0.941176, 0.690196, 0.196078, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tastefultoggle",
				"default" : 				{
					"elementcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ],
					"bgcolor" : [ 0.287863, 0.333333, 0.329398, 1.0 ],
					"color" : [ 0.941176, 0.690196, 0.196078, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "test",
				"default" : 				{
					"fontsize" : [ 10.0 ],
					"fontface" : [ 1 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "whitey",
				"default" : 				{
					"selectioncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"fontsize" : [ 36.0 ],
					"textcolor_inverse" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"patchlinecolor" : [ 0.199068, 0.062496, 0.060031, 0.9 ],
					"fontname" : [ "Dirty Ego" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "yellow stuff",
				"comment" : 				{
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : [ 10.0 ],
					"fontname" : [ "Arial" ],
					"fontface" : [ 1 ]
				}
,
				"parentstyle" : "",
				"multi" : 1
			}
, 			{
				"name" : "zielony",
				"default" : 				{
					"selectioncolor" : [ 0.528927, 1.0, 0.272898, 1.0 ],
					"elementcolor" : [ 0.03764, 0.288409, 0.132402, 1.0 ],
					"textcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ],
					"textjustification" : [ 0 ],
					"fontsize" : [ 14.0 ],
					"textcolor_inverse" : [ 0.528927, 1.0, 0.272898, 1.0 ],
					"patchlinecolor" : [ 0.439216, 0.74902, 0.254902, 0.9 ],
					"bgfillcolor" : 					{
						"angle" : 268.517702999999983,
						"autogradient" : 0,
						"color" : [ 0.067387, 0.339963, 0.132708, 1.0 ],
						"color1" : [ 0.0, 0.501961, 0.25098, 1.0 ],
						"color2" : [ 0.019608, 0.254902, 0.035294, 1.0 ],
						"proportion" : 0.525821,
						"pt1" : [ 0.490099, 0.478261 ],
						"pt2" : [ 0.475248, 1.052174 ],
						"type" : "color"
					}
,
					"fontname" : [ "Lato Regular" ],
					"bgcolor" : [ 0.178182, 0.194235, 0.179854, 1.0 ],
					"accentcolor" : [ 0.086281, 0.464155, 0.176596, 1.0 ],
					"color" : [ 0.4, 1.0, 0.4, 1.0 ],
					"fontface" : [ 0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
