Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B61623092A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 13:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgG1LwV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 07:52:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33536 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgG1LwV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 07:52:21 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06SBh9KY163452;
        Tue, 28 Jul 2020 11:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=cqyB84Yg9vnvWQzL4ynV1Wo/dL93LyFsMcSQ/zk+ETQ=;
 b=CQbFIRlBd/GMho1aI9nHmDRoSVrG2XZ+gvkyWT+qfkFL0hpI0L9VXodC4lpdFq7e8Vxe
 yYPlrctRTfQViGB7weibBepWQask0U7TdfGAEbk2ilSAxKl3LR+aPCK+Vsk18vGBsfju
 8s47tpIbw73UCuMD7VEY0dubtEcFYO//i8zoDolxeNnEgVXQrXLqJPdW1++HsR5HaMZq
 CuKFYky1u7idVlirpmuhuSj6VNT/LD+Neq+NhEDxIM6QdfeRvApYLe2kWgJhisJNMilo
 Q5FUSIReGJIxcdtjg3dcpVVesrRdprvAvs9Sro8RxEcAADUD25dv2/ZsAFNK2Nvd/1RY 8w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 32hu1j6yg6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Jul 2020 11:52:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06SBgYJn047040;
        Tue, 28 Jul 2020 11:52:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 32hu5srghk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jul 2020 11:52:19 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06SBpt3S029391;
        Tue, 28 Jul 2020 11:51:59 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 Jul 2020 04:51:53 -0700
Date:   Tue, 28 Jul 2020 14:51:48 +0300
From:   <dan.carpenter@oracle.com>
To:     zhouyanjie@wanyeetech.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] USB: PHY: JZ4770: Add support for new Ingenic SoCs.
Message-ID: <20200728115148.GA425911@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9695 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=3 spamscore=0 mlxlogscore=869 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9695 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=3 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=881 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280089
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello 周琰杰 (Zhou Yanjie),

The patch 2a6c0b82e651: "USB: PHY: JZ4770: Add support for new
Ingenic SoCs." from Jul 23, 2020, leads to the following static
checker warning:

	drivers/usb/phy/phy-jz4770.c:179 ingenic_usb_phy_init()
	error: uninitialized symbol 'reg'.

drivers/usb/phy/phy-jz4770.c
   157  static int ingenic_usb_phy_init(struct usb_phy *phy)
   158  {
   159          struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
   160          int err;
   161          u32 reg;
                    ^^^
   162  
   163          err = regulator_enable(priv->vcc_supply);
   164          if (err) {
   165                  dev_err(priv->dev, "Unable to enable VCC: %d\n", err);
   166                  return err;
   167          }
   168  
   169          err = clk_prepare_enable(priv->clk);
   170          if (err) {
   171                  dev_err(priv->dev, "Unable to start clock: %d\n", err);
   172                  return err;
   173          }
   174  
   175          priv->soc_info->usb_phy_init(phy);
   176  
   177          /* Wait for PHY to reset */
   178          usleep_range(30, 300);
   179          writel(reg & ~USBPCR_POR, priv->base + REG_USBPCR_OFFSET);
                       ^^^
Not initialized any more.

   180          usleep_range(300, 1000);
   181  
   182          return 0;
   183  }

regards,
dan carpenter
