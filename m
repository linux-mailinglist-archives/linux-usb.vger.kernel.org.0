Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963BA4CA105
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 10:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238595AbiCBJni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 04:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbiCBJnh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 04:43:37 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9F13E0DB
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 01:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646214173; x=1677750173;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=65Ie3MJD5XZ2TfeYPPzg97lgs7XwJKgLkZgbIlbFNeQ=;
  b=SMIQ/iz9bTt+5oIUkOVMKifMf0eJX1/mQc+y4V6TOGu91//zx79FsusL
   jQyth9h+yMId24nFXiuJ2Dx1fvedsEwnmq43EKiDP+2cWcWl+eSy/Hhdm
   9ZqY24gmxhY4ZIHai6obpksJ6zo7oHWk22/1tTvS8aekO9CNNwDS1f4m/
   0hdvIkCyL0i1thHuBT+MTLsAojVmk6hB6bWqzW4tXGXSAHtKJERA6Kyak
   Dys+RfT8s40DPSPOiJTeY/5hQQbVyac2LZ2TeO6edicyEC3Ny+mA0gEcO
   WBTGOh394YhwqX24DenvN9cbaOyNzLvndcHM5fxs4glDZua8cmrN5Cjh5
   A==;
X-IronPort-AV: E=Sophos;i="5.90,148,1643670000"; 
   d="scan'208";a="22401814"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Mar 2022 10:42:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 02 Mar 2022 10:42:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 02 Mar 2022 10:42:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646214171; x=1677750171;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=65Ie3MJD5XZ2TfeYPPzg97lgs7XwJKgLkZgbIlbFNeQ=;
  b=Qv6NEsk9CspOSCE7zeJx13x6/fkawT6tad6L/lKz9hdUvraykuqA0q1O
   2QENynztrpYAQLfBjL53h2cx5IGYyhAFiDGUHWVxBSqD7MVrinMrbVTI6
   nHrlaZW5/1ZxZqg2sxltjIqWO8vobOICHMbWrITl0EQZUH+KqmnOubi0b
   PhxB3alMjkZ2bDj394ly3zLROEvXn5R+01HUYtuIZy8187+gDXP1j63AT
   oIh4bSO9B6K7I3hPIgE1H3zy1Ug8qB0yd+/eh+l/xXB+GQFnr3DHboIxB
   dYIRookJEUDe4ZGmDG1v7h4JtWb/xG+HWJDOQYGnttdfDRGX5ExElZ4SH
   A==;
X-IronPort-AV: E=Sophos;i="5.90,148,1643670000"; 
   d="scan'208";a="22401812"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Mar 2022 10:42:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BC4DB280074;
        Wed,  2 Mar 2022 10:42:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime pm for HSIC interface
Date:   Wed,  2 Mar 2022 10:42:39 +0100
Message-Id: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the add of power-domain support in commit 02f8eb40ef7b ("ARM: dts:
imx7s: Add power domain for imx7d HSIC") runtime suspend will disable
the power-domain. This prevents IRQs to occur when a new device is attached
on a downstream hub.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to mounted USB HUB on
usbh device. Cold plugging an USB mass storage device is working fine. But
once the last non-HUB device is disconnected the ci_hdrc device goes into
runtime suspend. This will eventually also disable the 'pgc_hsic_phy' power
domain. Results is that no more updates from USB hub is handled, neither HUB
on HSIC link or HUB on that's downstream link. USB tree looks like this:

/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
            |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 2: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 480M

I noticed once the power domain is disabled, no IRQs appear if I attach a new
mass storage, essentially preventing any runtime resume.
I do not know if this is specific to i.MX7 only or if this is a general USB
HSIC problem, so this diff might be too much.

BTW: An udev rule with the same effect is:
ACTION=="add", SUBSYSTEMS=="platform", DRIVER=="ci_hdrc",
KERNELS=="30b30000.usb", TEST=="power/control", ATTR{power/control}="on"

But I would like to get this fixed on driver level.

Regards
Alexander

 drivers/usb/chipidea/ci_hdrc_imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 097142ffb184..e5c22b70431c 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -344,6 +344,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if ((of_usb_get_phy_mode(dev->of_node) == USBPHY_INTERFACE_MODE_HSIC)
 		&& data->usbmisc_data) {
 		pdata.flags |= CI_HDRC_IMX_IS_HSIC;
+		/* Runtime suspend is not supported for HSIC interface */
+		pdata.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
 		data->usbmisc_data->hsic = 1;
 		data->pinctrl = devm_pinctrl_get(dev);
 		if (PTR_ERR(data->pinctrl) == -ENODEV)
-- 
2.25.1

