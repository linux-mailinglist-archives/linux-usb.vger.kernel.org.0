Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54104C8760
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 13:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfJBLcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 07:32:17 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:45332 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfJBLcR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 07:32:17 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92BT2r7134079;
        Wed, 2 Oct 2019 11:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=q2zT9aaJliTvzY8CrdgIC6qeI9HB8lpTAR3TaRbk2S0=;
 b=nprZ3gxtmXDyVb/MBZ7UGrLCyyOxNM6zE+wjxPoB5ZMPgrpUr4BwZfCCi5O22Qcdxq0v
 IAf5RWdI9kisGw5rXaWMV3uusTXEJoJxH4d6YNLHhJpfCYSn8IOjr5oxHuDIaxVttBwJ
 xrMohU0N2S3tAXsSXFbKd6zPS/bUs4OuAd3BdY1X2sj+YIQvEknBWSFEF8+4qViCEQ0g
 UO8sNbw33KpQZpaplHL++B/84skJzqqzf6hZNPo37+uPEXl/g8pzA3MXZpK+JSm3u6Jq
 /7jaskGLIljbAwPhjcLL2C45rIKNo8kZddNPXdhP53t+bICktuLb7cPM7FJNuvJ6NaFR LA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2va05rv8g3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Oct 2019 11:32:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92BSvvD016874;
        Wed, 2 Oct 2019 11:30:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2vckynsmfv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Oct 2019 11:30:05 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x92BU2kJ016995;
        Wed, 2 Oct 2019 11:30:03 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Oct 2019 04:30:02 -0700
Date:   Wed, 2 Oct 2019 14:29:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jun.li@nxp.com
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>, linux-usb@vger.kernel.org
Subject: [bug report] usb: chipidea: imx: enable vbus and id wakeup only for
 OTG events
Message-ID: <20191002112954.GA1890@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=283
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910020109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=366 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910020109
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Li Jun,

The patch 15b80f7c3a7f: "usb: chipidea: imx: enable vbus and id
wakeup only for OTG events" from Sep 9, 2019, leads to the following
static checker warning:

	drivers/usb/chipidea/ci_hdrc_imx.c:438 ci_hdrc_imx_probe()
	warn: 'data->usbmisc_data' can also be NULL

drivers/usb/chipidea/ci_hdrc_imx.c
   317          data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
   318          if (!data)
   319                  return -ENOMEM;
   320  
   321          data->plat_data = imx_platform_flag;
   322          pdata.flags |= imx_platform_flag->flags;
   323          platform_set_drvdata(pdev, data);
   324          data->usbmisc_data = usbmisc_get_init_data(dev);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This can return NULL or error pointer.

   325          if (IS_ERR(data->usbmisc_data))
   326                  return PTR_ERR(data->usbmisc_data);
   327  
   328          if ((of_usb_get_phy_mode(dev->of_node) == USBPHY_INTERFACE_MODE_HSIC)
   329                  && data->usbmisc_data) {
                           ^^^^^^^^^^^^^^^^^^
This code checks for NULL.

   330                  pdata.flags |= CI_HDRC_IMX_IS_HSIC;
   331                  data->usbmisc_data->hsic = 1;
   332                  data->pinctrl = devm_pinctrl_get(dev);
   333                  if (IS_ERR(data->pinctrl)) {
   334                          dev_err(dev, "pinctrl get failed, err=%ld\n",
   335                                          PTR_ERR(data->pinctrl));
   336                          return PTR_ERR(data->pinctrl);
   337                  }
   338  
   339                  pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
   340                  if (IS_ERR(pinctrl_hsic_idle)) {
   341                          dev_err(dev,
   342                                  "pinctrl_hsic_idle lookup failed, err=%ld\n",
   343                                          PTR_ERR(pinctrl_hsic_idle));
   344                          return PTR_ERR(pinctrl_hsic_idle);
   345                  }
   346  
   347                  ret = pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
   348                  if (ret) {
   349                          dev_err(dev, "hsic_idle select failed, err=%d\n", ret);
   350                          return ret;
   351                  }
   352  
   353                  data->pinctrl_hsic_active = pinctrl_lookup_state(data->pinctrl,
   354                                                                  "active");
   355                  if (IS_ERR(data->pinctrl_hsic_active)) {
   356                          dev_err(dev,
   357                                  "pinctrl_hsic_active lookup failed, err=%ld\n",
   358                                          PTR_ERR(data->pinctrl_hsic_active));
   359                          return PTR_ERR(data->pinctrl_hsic_active);
   360                  }
   361  
   362                  data->hsic_pad_regulator = devm_regulator_get(dev, "hsic");
   363                  if (PTR_ERR(data->hsic_pad_regulator) == -EPROBE_DEFER) {
   364                          return -EPROBE_DEFER;
   365                  } else if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {
   366                          /* no pad regualator is needed */
   367                          data->hsic_pad_regulator = NULL;
   368                  } else if (IS_ERR(data->hsic_pad_regulator)) {
   369                          dev_err(dev, "Get HSIC pad regulator error: %ld\n",
   370                                          PTR_ERR(data->hsic_pad_regulator));
   371                          return PTR_ERR(data->hsic_pad_regulator);
   372                  }
   373  
   374                  if (data->hsic_pad_regulator) {
   375                          ret = regulator_enable(data->hsic_pad_regulator);
   376                          if (ret) {
   377                                  dev_err(dev,
   378                                          "Failed to enable HSIC pad regulator\n");
   379                                  return ret;
   380                          }
   381                  }
   382          }
   383  
   384          if (pdata.flags & CI_HDRC_PMQOS)
   385                  pm_qos_add_request(&data->pm_qos_req,
   386                          PM_QOS_CPU_DMA_LATENCY, 0);
   387  
   388          ret = imx_get_clks(dev);
   389          if (ret)
   390                  goto disable_hsic_regulator;
   391  
   392          ret = imx_prepare_enable_clks(dev);
   393          if (ret)
   394                  goto disable_hsic_regulator;
   395  
   396          data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
   397          if (IS_ERR(data->phy)) {
   398                  ret = PTR_ERR(data->phy);
   399                  /* Return -EINVAL if no usbphy is available */
   400                  if (ret == -ENODEV)
   401                          data->phy = NULL;
   402                  else
   403                          goto err_clk;
   404          }
   405  
   406          pdata.usb_phy = data->phy;
   407  
   408          if ((of_device_is_compatible(np, "fsl,imx53-usb") ||
   409               of_device_is_compatible(np, "fsl,imx51-usb")) && pdata.usb_phy &&
   410              of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI) {
   411                  pdata.flags |= CI_HDRC_OVERRIDE_PHY_CONTROL;
   412                  data->override_phy_control = true;
   413                  usb_phy_init(pdata.usb_phy);
   414          }
   415  
   416          if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
   417                  data->supports_runtime_pm = true;
   418  
   419          ret = imx_usbmisc_init(data->usbmisc_data);
   420          if (ret) {
   421                  dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
   422                  goto err_clk;
   423          }
   424  
   425          data->ci_pdev = ci_hdrc_add_device(dev,
   426                                  pdev->resource, pdev->num_resources,
   427                                  &pdata);
   428          if (IS_ERR(data->ci_pdev)) {
   429                  ret = PTR_ERR(data->ci_pdev);
   430                  if (ret != -EPROBE_DEFER)
   431                          dev_err(dev, "ci_hdrc_add_device failed, err=%d\n",
   432                                          ret);
   433                  goto err_clk;
   434          }
   435  
   436          if (!IS_ERR(pdata.id_extcon.edev) ||
   437              of_property_read_bool(np, "usb-role-switch"))
   438                  data->usbmisc_data->ext_id = 1;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   439  
   440          if (!IS_ERR(pdata.vbus_extcon.edev) ||
   441              of_property_read_bool(np, "usb-role-switch"))
   442                  data->usbmisc_data->ext_vbus = 1;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
These should probably check for NULL?  This driver seems to check pretty
consistently.

   443  
   444          ret = imx_usbmisc_init_post(data->usbmisc_data);

regards,
dan carpenter
