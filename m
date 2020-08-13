Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE97C243A8F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 15:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHMNKX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 09:10:23 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:37654 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726142AbgHMNKU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 09:10:20 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07DD8KMc008038;
        Thu, 13 Aug 2020 06:10:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=t7du4gIBdUjjPatKfn/wJ7xaSITHA0oFPKLtotQXYHo=;
 b=SVGLuhhMNCdR9JG1SXEClAw2ozn148f6kUqDKw+Su3xepN+4t9XxYgKBHKyv4pKOQHq9
 Oj0X87+WbyXc3o7Pbrj/d6KfB2+fyumGn/b2K9JvDnbJNFPnaGgNThZuJTZOIXPyaqov
 Ik1XTKULPyKyyMLfah1YcxlJrwd/3VCE8dJ+wE9om2VApsY9QMGPMhm4+fiQZ2h24eys
 8Qm08jgXBn1UFvqrGCoObYBO/sFz8ra2lkkWXOohqryNVxJcWtUDy0oUHrMHx5K/CiC8
 4G9NOCITT04XxthVlMlSSOFpEGmvp1V7QztQOEu5BWRadJJW16RaTqzQqthQCLFIFBrv jw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by mx0a-0014ca01.pphosted.com with ESMTP id 32srkw9c52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Aug 2020 06:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVqQEhku20XY+HZbWhISFkrnIaphPKZb0091zTeTdGwFiiZ3xsd+cNSmChm5Txp5/Z7KEqq5MFZv7TKVbyf7YJRw6ZqtR7QhBgwhjCXQuEDSXrtVLktchTBciDJNk0kRe1EoWQf3GT09m7SwSqhcgjSb5qESi1CxZCeswqNF/i3F4O9FxFwybrqcXhVqGDzh/crt6w3ykMFSDR/tURTPVQv3YHVNRahmt5FaDvKemk7QsCZNRUHiEw3V5c+DO/0cQGbKge9xwSoG0GQ9hlASPsFJVel4kDUtAfHtXK5kxKGqiiI7ELauStwaW324YITkX34XoRdqV9wUeq3AJDnrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7du4gIBdUjjPatKfn/wJ7xaSITHA0oFPKLtotQXYHo=;
 b=b5IfelQGXYlzWvon4A+nTrZFEoYIcx1UZlt55FAqwfEn7fr64e4qrPkb84gOx+w3+JEv7GSAtflbfvcDjGeCyjCkdz1ZRwdW/mKEfh1WhVAJbNsTHehINE7rSKxuA2B7GW1lRSQ9+zdjFgaRrVBQ1cX0K2yuH+hvZi/XckYfv5dtJFgMTlxv98qi7MlXdhU1wtoC89DX5z0UdwO1iONHOpjM9F29HlS2h6pUvJJfCUjZWITtGyQyLFnn9YgCWYf880CgvLuD7CVGHTiqdbIUJDIinLLleAYNlOGCq5DykrI1GJASQAuKvN+pFXuuxrzIdqRisvY3BWSOLkvu1t3z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7du4gIBdUjjPatKfn/wJ7xaSITHA0oFPKLtotQXYHo=;
 b=esTxMIb1wjKzOuO5yuALkmymvMOiNOQlYkXLMgkiqvWWyrFrfP57v5F/uzWxm6042sRPA/yuRC3Pf6UH7zbv2HOYmVtbLXqMdsIAZFIj2EnA9xgktkPGYSf0MhTY5dWyASGjrBbxuVmzDDHjiOUf3ulsaWlcsd9uQ9qjIrjobJc=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM5PR07MB4134.namprd07.prod.outlook.com (2603:10b6:4:ba::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Thu, 13 Aug 2020 13:10:05 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362%4]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 13:10:05 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH v5 2/9] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v5 2/9] usb: cdns3: add runtime PM support
Thread-Index: AQHWVDM0GHzdyhNZDkqVIh/2mJWREKk2LRFw
Date:   Thu, 13 Aug 2020 13:10:04 +0000
Message-ID: <DM6PR07MB55299393626CAA865318CEBBDD430@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
 <20200707074941.28078-3-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-3-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNGMwYWFlNTEtZGQ2Ni0xMWVhLTg3NjgtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDRjMGFhZTUyLWRkNjYtMTFlYS04NzY4LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMTE1MjciIHQ9IjEzMjQxNzk3ODAzMDg1MjU5NCIgaD0iK21KVnY2NzdndDRiajh4WWhMN3BpeXZaemxzPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54fbab1a-08f2-4d17-70cf-08d83f8a3207
x-ms-traffictypediagnostic: DM5PR07MB4134:
x-microsoft-antispam-prvs: <DM5PR07MB4134447ED6C098CBC301D18EDD430@DM5PR07MB4134.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V514crENFZh8gDCKVTKyM6/fHLkw/JKPgTmU3sWF9e0WqMDsmwqrivqaJrm+m9XzIcgre3xWswEU7BbR+lwv4GtvMvIq9WqokF3uJ9VaL21OmMmJRIdGEGXCWPH9fDrOAKEwbxZgFnAsqN1s1zP+F2p8ROl8eGbrTt+xeCTvEzxvcDsnq+4YekSP7T7uk11S4SqSfXnWWKuVHcvbZ06bPTrmIiYjzm5dgiaSf+sugb6aDguBRncKfpEYj58IKnbO/llduZ5fgtdG47b/Vz/Kdn3XGbt/CDQIb8oNxrUU1VT6N+bFQX1WT4n5FxqBLMBm11KfT3JLZ/z8GyQZgOfrHDZEFBXE5rJ5poPGQPmEC0orW45qfHOeRQ7f46YxsnkL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(36092001)(7696005)(83380400001)(64756008)(66556008)(66476007)(66446008)(54906003)(26005)(9686003)(55016002)(4326008)(52536014)(316002)(2906002)(33656002)(30864003)(66946007)(8936002)(478600001)(86362001)(71200400001)(76116006)(6506007)(8676002)(5660300002)(110136005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BO8+rx5sRO6JJEA8w1UbKZYVW9zr93jD3JuTgLaPraMfHFz6NV+q/QOLaGCPMlOK3gX3zgVu9junC5zTK/PBiKFpJhcSFGIWvGb0rkQeXUYmfVHL9T2oHAQ9PrOJp+TA1vcSjogu8t1VgWdRu3Ax5suLwJP2tPTcsTLAgeUrq0qHC8BeqEdaFPoXJvpR22vUdI4L9zR5Bh3aytQWU2n1gYNK+XfQcMYRq5tuX/6mQ8er7Ic4cSv65uTI2O9KhiyQMCNKJsVG5Zuj5Wn3R56XVrbsYtWz+Wk5xl5zeQGS17DYjV0Yqvc4Q27tpBXEyBWNUQMo8cs8/2hMlTuIpEVoBAGv5sbtbl9tIk/5vw2pm5VLUqRBIHaenSfryohmp5+XjWwDdk0CS3YAiYw4wVnC0ZDaX4z0bJN/v1/HSJXSAomk8GPzYtIFwPxvaa8wDqVVRxEF0iYDRJODnuGkpdkk9tlINwYpGbw+10qtJRs3tOJtirWM09NDCxpIqhNNvHXiUs485WD5DIHGnCbu/EjucOxk7OkFGEefYN+6SZTNju0XDLCb+35ESW+YYCCLB8CUq64xWND+MgWnGzSTbP4sr8S6p66VaBzUKOGbEzBjR5g6NaIE9vi3cnuEeoU8n16f1Hm/6Plbzs8J3ROE0axlFw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5529.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fbab1a-08f2-4d17-70cf-08d83f8a3207
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 13:10:04.8631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkEMUvHiSyP3AyolMmi2miBd/rRG7kmLZ2zx/X5v+HfNjQS4oJHO04L/oIt7Py/kjflDOLssJxOwPE4W5nIggsUTTuC06JH6Z9Lh6asGsLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB4134
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-13_10:2020-08-13,2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130099
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>
>Introduce runtime PM and wakeup interrupt handler for cdns3,
>the runtime PM is default off since other cdns3 may not
>implement glue layer support for runtime PM.
>
>One typical wakeup event use case is xHCI runtime suspend will clear
>USBCMD.RS bit, after that the xHCI will not trigger any interrupts,
>so its parent (cdns core device) needs to resume xHCI device when
>any (wakeup) events occurs at host port.
>
>When the controller is in low power mode, the lpm flag will be set.
>The interrupt triggered later than lpm flag is set considers as
>wakeup interrupt and handled at cdns_wakeup_irq. Once the wakeup
>occurs, it first disables interrupt to avoid later interrupt
>occurrence since the controller is in low power mode at that
>time, and access registers may be invalid at that time. At wakeup
>handler, it will call pm_request_resume to wakeup xHCI device, and
>at runtime resume handler, it will enable interrupt again.
>
>The API platform_suspend is introduced for glue layer to implement
>platform specific PM sequence.
>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>

Reviewed-by: Pawel Laszczak <pawell@cadence.com>

>---
> drivers/usb/cdns3/core.c   | 153 ++++++++++++++++++++++++++++++++-----
> drivers/usb/cdns3/core.h   |  16 ++++
> drivers/usb/cdns3/drd.c    |   3 +
> drivers/usb/cdns3/gadget.c |   4 +
> drivers/usb/cdns3/host.c   |   7 ++
> 5 files changed, 166 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>index 8818935d157b..f98c3c1a6b26 100644
>--- a/drivers/usb/cdns3/core.c
>+++ b/drivers/usb/cdns3/core.c
>@@ -405,6 +405,30 @@ static void set_phy_power_off(struct cdns3 *cdns)
> 	phy_power_off(cdns->usb2_phy);
> }
>
>+/**
>+ * cdns3_wakeup_irq - interrupt handler for wakeup events
>+ *
>+ * @irq: irq number for cdns3 core device
>+ * @data: structure of cdns3
>+ *
>+ * Returns IRQ_HANDLED or IRQ_NONE
>+ */
>+static irqreturn_t cdns3_wakeup_irq(int irq, void *data)
>+{
>+	struct cdns3 *cdns =3D data;
>+
>+	if (cdns->in_lpm) {
>+		disable_irq_nosync(irq);
>+		cdns->wakeup_pending =3D true;
>+		if ((cdns->role =3D=3D USB_ROLE_HOST) && cdns->host_dev)
>+			pm_request_resume(&cdns->host_dev->dev);
>+
>+		return IRQ_HANDLED;
>+	}
>+
>+	return IRQ_NONE;
>+}
>+
> /**
>  * cdns3_probe - probe for cdns3 core device
>  * @pdev: Pointer to cdns3 core platform device
>@@ -431,6 +455,7 @@ static int cdns3_probe(struct platform_device *pdev)
> 		return -ENOMEM;
>
> 	cdns->dev =3D dev;
>+	cdns->pdata =3D dev_get_platdata(dev);
>
> 	platform_set_drvdata(pdev, cdns);
>
>@@ -480,6 +505,15 @@ static int cdns3_probe(struct platform_device *pdev)
>
> 	cdns->otg_res =3D *res;
>
>+	cdns->wakeup_irq =3D platform_get_irq_byname_optional(pdev, "wakeup");
>+	if (cdns->wakeup_irq =3D=3D -EPROBE_DEFER)
>+		return cdns->wakeup_irq;
>+
>+	if (cdns->wakeup_irq < 0) {
>+		dev_dbg(dev, "couldn't get wakeup irq\n");
>+		cdns->wakeup_irq =3D 0x0;
>+	}
>+
> 	mutex_init(&cdns->mutex);
>
> 	cdns->usb2_phy =3D devm_phy_optional_get(dev, "cdns3,usb2-phy");
>@@ -516,6 +550,19 @@ static int cdns3_probe(struct platform_device *pdev)
> 		goto err3;
> 	}
>
>+	if (cdns->wakeup_irq) {
>+		ret =3D devm_request_threaded_irq(cdns->dev, cdns->wakeup_irq,
>+						cdns3_wakeup_irq,
>+						NULL,
>+						IRQF_SHARED,
>+						dev_name(cdns->dev), cdns);
>+
>+		if (ret) {
>+			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
>+			goto err3;
>+		}
>+	}
>+
> 	ret =3D cdns3_drd_init(cdns);
> 	if (ret)
> 		goto err4;
>@@ -524,9 +571,11 @@ static int cdns3_probe(struct platform_device *pdev)
> 	if (ret)
> 		goto err4;
>
>+	spin_lock_init(&cdns->lock);
> 	device_set_wakeup_capable(dev, true);
> 	pm_runtime_set_active(dev);
> 	pm_runtime_enable(dev);
>+	pm_runtime_forbid(dev);
>
> 	/*
> 	 * The controller needs less time between bus and controller suspend,
>@@ -573,52 +622,122 @@ static int cdns3_remove(struct platform_device *pde=
v)
> 	return 0;
> }
>
>-#ifdef CONFIG_PM_SLEEP
>+#ifdef CONFIG_PM
>
>-static int cdns3_suspend(struct device *dev)
>+static int cdns3_set_platform_suspend(struct device *dev,
>+		bool suspend, bool wakeup)
>+{
>+	struct cdns3 *cdns =3D dev_get_drvdata(dev);
>+	int ret =3D 0;
>+
>+	if (cdns->pdata && cdns->pdata->platform_suspend)
>+		ret =3D cdns->pdata->platform_suspend(dev, suspend, wakeup);
>+
>+	return ret;
>+}
>+
>+static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
> {
> 	struct cdns3 *cdns =3D dev_get_drvdata(dev);
>+	bool wakeup;
> 	unsigned long flags;
>
>-	if (cdns->role =3D=3D USB_ROLE_HOST)
>+	if (cdns->in_lpm)
> 		return 0;
>
>-	if (pm_runtime_status_suspended(dev))
>-		pm_runtime_resume(dev);
>+	if (PMSG_IS_AUTO(msg))
>+		wakeup =3D true;
>+	else
>+		wakeup =3D device_may_wakeup(dev);
>
>-	if (cdns->roles[cdns->role]->suspend) {
>-		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
>-		cdns->roles[cdns->role]->suspend(cdns, false);
>-		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
>-	}
>+	cdns3_set_platform_suspend(cdns->dev, true, wakeup);
>+	set_phy_power_off(cdns);
>+	spin_lock_irqsave(&cdns->lock, flags);
>+	cdns->in_lpm =3D true;
>+	spin_unlock_irqrestore(&cdns->lock, flags);
>+	dev_dbg(cdns->dev, "%s ends\n", __func__);
>
> 	return 0;
> }
>
>-static int cdns3_resume(struct device *dev)
>+static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
> {
> 	struct cdns3 *cdns =3D dev_get_drvdata(dev);
>+	int ret;
> 	unsigned long flags;
>
>-	if (cdns->role =3D=3D USB_ROLE_HOST)
>+	if (!cdns->in_lpm)
> 		return 0;
>
>-	if (cdns->roles[cdns->role]->resume) {
>-		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
>+	ret =3D set_phy_power_on(cdns);
>+	if (ret)
>+		return ret;
>+
>+	cdns3_set_platform_suspend(cdns->dev, false, false);
>+
>+	spin_lock_irqsave(&cdns->lock, flags);
>+	if (cdns->roles[cdns->role]->resume && !PMSG_IS_AUTO(msg))
> 		cdns->roles[cdns->role]->resume(cdns, false);
>-		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
>+
>+	cdns->in_lpm =3D false;
>+	spin_unlock_irqrestore(&cdns->lock, flags);
>+	if (cdns->wakeup_pending) {
>+		cdns->wakeup_pending =3D false;
>+		enable_irq(cdns->wakeup_irq);
>+	}
>+	dev_dbg(cdns->dev, "%s ends\n", __func__);
>+
>+	return ret;
>+}
>+
>+static int cdns3_runtime_suspend(struct device *dev)
>+{
>+	return cdns3_controller_suspend(dev, PMSG_AUTO_SUSPEND);
>+}
>+
>+static int cdns3_runtime_resume(struct device *dev)
>+{
>+	return cdns3_controller_resume(dev, PMSG_AUTO_RESUME);
>+}
>+#ifdef CONFIG_PM_SLEEP
>+
>+static int cdns3_suspend(struct device *dev)
>+{
>+	struct cdns3 *cdns =3D dev_get_drvdata(dev);
>+	unsigned long flags;
>+
>+	if (pm_runtime_status_suspended(dev))
>+		pm_runtime_resume(dev);
>+
>+	if (cdns->roles[cdns->role]->suspend) {
>+		spin_lock_irqsave(&cdns->lock, flags);
>+		cdns->roles[cdns->role]->suspend(cdns, false);
>+		spin_unlock_irqrestore(&cdns->lock, flags);
> 	}
>
>+	return cdns3_controller_suspend(dev, PMSG_SUSPEND);
>+}
>+
>+static int cdns3_resume(struct device *dev)
>+{
>+	int ret;
>+
>+	ret =3D cdns3_controller_resume(dev, PMSG_RESUME);
>+	if (ret)
>+		return ret;
>+
> 	pm_runtime_disable(dev);
> 	pm_runtime_set_active(dev);
> 	pm_runtime_enable(dev);
>
>-	return 0;
>+	return ret;
> }
>-#endif
>+#endif /* CONFIG_PM_SLEEP */
>+#endif /* CONFIG_PM */
>
> static const struct dev_pm_ops cdns3_pm_ops =3D {
> 	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
>+	SET_RUNTIME_PM_OPS(cdns3_runtime_suspend, cdns3_runtime_resume, NULL)
> };
>
> #ifdef CONFIG_OF
>diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
>index 1ad1f1fe61e9..1b1707796db2 100644
>--- a/drivers/usb/cdns3/core.h
>+++ b/drivers/usb/cdns3/core.h
>@@ -38,6 +38,12 @@ struct cdns3_role_driver {
> };
>
> #define CDNS3_XHCI_RESOURCES_NUM	2
>+
>+struct cdns3_platform_data {
>+	int (*platform_suspend)(struct device *dev,
>+			bool suspend, bool wakeup);
>+};
>+
> /**
>  * struct cdns3 - Representation of Cadence USB3 DRD controller.
>  * @dev: pointer to Cadence device struct
>@@ -50,6 +56,7 @@ struct cdns3_role_driver {
>  * @otg_regs: pointer to base of otg registers
>  * @otg_irq: irq number for otg controller
>  * @dev_irq: irq number for device controller
>+ * @wakeup_irq: irq number for wakeup event, it is optional
>  * @roles: array of supported roles for this controller
>  * @role: current role
>  * @host_dev: the child host device pointer for cdns3 core
>@@ -62,6 +69,10 @@ struct cdns3_role_driver {
>  *           This field based on firmware setting, kernel configuration
>  *           and hardware configuration.
>  * @role_sw: pointer to role switch object.
>+ * @in_lpm: indicate the controller is in low power mode
>+ * @wakeup_pending: wakeup interrupt pending
>+ * @pdata: platform data from glue layer
>+ * @lock: spinlock structure
>  */
> struct cdns3 {
> 	struct device			*dev;
>@@ -79,6 +90,7 @@ struct cdns3 {
>
> 	int				otg_irq;
> 	int				dev_irq;
>+	int				wakeup_irq;
> 	struct cdns3_role_driver	*roles[USB_ROLE_DEVICE + 1];
> 	enum usb_role			role;
> 	struct platform_device		*host_dev;
>@@ -89,6 +101,10 @@ struct cdns3 {
> 	struct mutex			mutex;
> 	enum usb_dr_mode		dr_mode;
> 	struct usb_role_switch		*role_sw;
>+	bool				in_lpm;
>+	bool				wakeup_pending;
>+	struct cdns3_platform_data	*pdata;
>+	spinlock_t			lock;
> };
>
> int cdns3_hw_role_switch(struct cdns3 *cdns);
>diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
>index 58089841ed52..ac90a484e63c 100644
>--- a/drivers/usb/cdns3/drd.c
>+++ b/drivers/usb/cdns3/drd.c
>@@ -281,6 +281,9 @@ static irqreturn_t cdns3_drd_irq(int irq, void *data)
> 	if (cdns->dr_mode !=3D USB_DR_MODE_OTG)
> 		return ret;
>
>+	if (cdns->in_lpm)
>+		return ret;
>+
> 	reg =3D readl(&cdns->otg_regs->ivect);
>
> 	if (!reg)
>diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>index 7c2913bc8bd7..0111fba95797 100644
>--- a/drivers/usb/cdns3/gadget.c
>+++ b/drivers/usb/cdns3/gadget.c
>@@ -1766,9 +1766,13 @@ static void cdns3_check_usb_interrupt_proceed(struc=
t cdns3_device *priv_dev,
> static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
> {
> 	struct cdns3_device *priv_dev =3D data;
>+	struct cdns3 *cdns =3D dev_get_drvdata(priv_dev->dev);
> 	irqreturn_t ret =3D IRQ_NONE;
> 	u32 reg;
>
>+	if (cdns->in_lpm)
>+		return ret;
>+
> 	/* check USB device interrupt */
> 	reg =3D readl(&priv_dev->regs->usb_ists);
> 	if (reg) {
>diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
>index ad788bf3fe4f..b579ef15f4e0 100644
>--- a/drivers/usb/cdns3/host.c
>+++ b/drivers/usb/cdns3/host.c
>@@ -13,11 +13,13 @@
> #include "core.h"
> #include "drd.h"
> #include "host-export.h"
>+#include <linux/usb/hcd.h>
>
> static int __cdns3_host_init(struct cdns3 *cdns)
> {
> 	struct platform_device *xhci;
> 	int ret;
>+	struct usb_hcd *hcd;
>
> 	cdns3_drd_switch_host(cdns, 1);
>
>@@ -43,6 +45,11 @@ static int __cdns3_host_init(struct cdns3 *cdns)
> 		goto err1;
> 	}
>
>+	/* Glue needs to access xHCI region register for Power management */
>+	hcd =3D platform_get_drvdata(xhci);
>+	if (hcd)
>+		cdns->xhci_regs =3D hcd->regs;
>+
> 	return 0;
> err1:
> 	platform_device_put(xhci);
>--
>2.17.1

Regards,
Pawel
