Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB36245BA7
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 06:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgHQEkE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 00:40:04 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:15414 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725983AbgHQEkD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Aug 2020 00:40:03 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07H4Yfe4001264;
        Sun, 16 Aug 2020 21:39:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Hd2Wd+OpuDO4t55NedOAuHNMA4BnlTP0m/MDWA7bqRo=;
 b=KzX6Gr5UmN0d4nQn2bIOgh+wkpPp90wjkBmR+BtX8pPr/F4t/a9dtSbIybZmLnAnvdGu
 M6lWKd/joX1vpwUK3Q3Vg44HHzb4Of2K7EX+VXpt0R7Rrr9R8+MtD/C21nfJXa05tnMK
 /tcgCxN0MfaK8nsyFqKIM7IELrIBLTPbo+K70SNHUPWB7rQWjEPqz8kHQLQ3Y3FO2FdQ
 MSmWs5mqJ1RV1ySNxfCPJtzOaMRhnqB8s+uoonlGb9uQX39BkSX/Mz4oOOPin0XXxM3b
 5CyGX6ARWx/0/+ERQF7aeO/r4JGDdnYIwrE9dHOwSp7fH8iwe3zny4fthuwu5Mws028d 6A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by mx0b-0014ca01.pphosted.com with ESMTP id 32xba0d0nm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 21:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXiH4ns5Rd2xC7EqouIgxjASIYLy/kQ/z1smoiVOphtE+OPA9C1wbA1BnkqLESqcU197r0HAMjDH/NFRmMS21SHVhU+HcjkMUTcZ8PdSNBLG4Wzq+icPq41TNPW4mmx8zFjqC13edqGyV+WjPCiMkun9zBV/LnLSlRixzco44gN+13XdZ1hvA5Tksd8vTKvrmnrgG1FbXSoIjXsIY+/Ra7TT7zcrbbTZDeWMg9K6ps18jpgW4e8YeMdFozZqxZ+0ujKNXJQUqjgEOD5MLX4mUH7xloY0z34XreC7L77l1xnkc1J440ZM5RoED3hviTL5u51y88kXAZ3ZwAvcjOQw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd2Wd+OpuDO4t55NedOAuHNMA4BnlTP0m/MDWA7bqRo=;
 b=brKx3dodkh/smFH45Y5E6nkpqsLm7f7a1sL3xV5wFG92x6FOeoJfommk1PiSme3SY0RnrlReLIr4177iYUkgJsOixBSKN0TI6FmDLif5P98Q5SalYrslvKHWqIu2qz3uSX/8OUemmVj945JEGqk8DzOgW6zWIA5JrW2XyT5Kd6SwDwtaYbtv18yX8IYPQ3KXZ6+pInKDY/whbKGBbJ9eCRwmzNMNXogDtc4Ex0G616I6S3bdykkm07QhO6Wn3Jez4dYdAVpA3GEPUkNASVqwzTl4m8ep0POtxiZ7I4GoFuV740zw1eEFHjQVnX0ApmWIkGPK/ysnaTE3b0yDAMm+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd2Wd+OpuDO4t55NedOAuHNMA4BnlTP0m/MDWA7bqRo=;
 b=CKZZYUn+RZwKwYxKD9piLbyByMGyzVQXmMyd4q43HB1lM2RL7tV2M4OCYZiY91ymv2Ih91QTp2Rcwq/x+bo8EsR8VBVBlf8T6SKI5VlJBkG3fePglc4pbjmwVBJKkdT9TQKSJ2RmUdmlgL29h+u2752o/V49Y5gXhjLqblKTm04=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB7098.namprd07.prod.outlook.com (2603:10b6:5:158::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.18; Mon, 17 Aug 2020 04:39:54 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::35cf:ffb3:3776:8362%4]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 04:39:53 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH v5 8/9] usb: cdns3: host: add .suspend_quirk for
 xhci-plat.c
Thread-Topic: [PATCH v5 8/9] usb: cdns3: host: add .suspend_quirk for
 xhci-plat.c
Thread-Index: AQHWVDNA3fwh7qzs2kihaCVwI7kblqk79myg
Date:   Mon, 17 Aug 2020 04:39:53 +0000
Message-ID: <DM6PR07MB55294EE55EBBCB5EDC45F759DD5F0@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
 <20200707074941.28078-9-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-9-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYWY4MGYwZDEtZTA0My0xMWVhLTg3NjgtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGFmODBmMGQzLWUwNDMtMTFlYS04NzY4LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMzExMyIgdD0iMTMyNDIxMTI3OTEwMjU0NzkyIiBoPSI3TFR1U0hmT2FUK0hRZ2pqRk0vWkxkcE9hQm89IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 345bd28f-1f5a-4753-beaa-08d842679611
x-ms-traffictypediagnostic: DM6PR07MB7098:
x-microsoft-antispam-prvs: <DM6PR07MB7098DDA96AD5DAE3263DF72DDD5F0@DM6PR07MB7098.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UgGkWgB8NZvO2dPhsPT4Kw/XXoZFxJxTp/8CDqqUy9oKeI2pUpGSjN7NzOOvMrTKZthwE8wehc69FsEE6Tews8v6ECLg9kBNtagwQ+cD45BKU57Z2zmKZOiqMmPWBrTkUMR07Xhb8iLamhEBMi6Vtk/w9vCFLI3SrfdxZ0c3Rti73VfW2rs61qMA1CVlc9whAxam6TsVUfXCK4Y7Z/8IpZGG48AjODNXrjwfcG00lgIU1bAUU0kYxuN9XLFzP7QkFKqBtztXAs3YAsszj3QkVbamqnY65pKJ1eOxBJUKeyL8bZjxhU12WLFkp4Ssi2huJYQsnOfM8Axoae3ULRbF52vGmf1X+kAlhb+ZGvMQiq5/NoqVxcwAvj/F65aNUiHqUczOXaN5BEJtdrOTa6hqmw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(36092001)(52536014)(5660300002)(110136005)(316002)(8676002)(54906003)(66446008)(55016002)(66946007)(76116006)(66476007)(66556008)(64756008)(71200400001)(33656002)(83380400001)(86362001)(2906002)(9686003)(4326008)(26005)(6506007)(478600001)(15650500001)(7696005)(8936002)(186003)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ylgSEekfVysS0yiNVrx9xMMEeNwIdzjeLerITpKGU4d9HeCCevbQtEju5RtG0bfkdw/0Ppn/tbtCMyc4Jk205CZTA6pnsav2H2g9YSeYvOcLQ5XZ6QRnqvNEljwK6y+zjU/fqSkQyONfY29Xz038fmpe3UwlVshWZGs63wjgQy5ragjOViFe+ZI7mPgkXMYaMTpGsCwbkds0rHKNi3jMMWpX14ukPsUibjiFoSi8v93V2Q+hHfbgDxCeVQ/uoFsZQxjWFuw09oPH85bBnkntQyJb6SSChndvY2RYEmfRcCRAsz8gwvqnMCuBq6pdNgyEaxPfr2VtdjttKnT/BHjWxJZ8DIDZ8LXa/8eahqFUeWWJw6VHcVGfN1aJevN8FlDf2sDQeHmYb1LfXpMppw2TpE4B3s0gGXkyXXrIJ3MF3DOuQOAQs5I8JAjmlfQPwtAIYvJZVl43WSXZe3s7S8sAUDjcJyKpgs9516zXLsen5lNK4LmN9giQvqO3e108b47XJ77PJD3iUdmskVWlxRN/0MPHNTjAGYSP94p86HZBkXGpQwrMDViAg8EQwavTtu1u2JavD0QHtzDUkRzf8lQVsxYFez31WBOmtaJ9e+Do116fV5AKcJ6Nq8OkSfD0Z4zKyU71XGT/96RUetTMDeGnwg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5529.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345bd28f-1f5a-4753-beaa-08d842679611
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 04:39:53.8725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfOnkk3vii3fQgRUZLeDIRuDAMQWqyXujxtY+3OBcl2IHyAExEokL7KAcZQpmE04W/vEMpSdOtQdQCreZq1qVrGm+Qrvh0BB1mSM6HMrLv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7098
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-17_01:2020-08-14,2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170036
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>cdns3 has some special PM sequence between xhci_bus_suspend and
>xhci_suspend, add quirk to implement it.
>
>Signed-off-by: Peter Chen <peter.chen@nxp.com>
>---
> drivers/usb/cdns3/host-export.h |  6 +++++
> drivers/usb/cdns3/host.c        | 40 +++++++++++++++++++++++++++++++++
> 2 files changed, 46 insertions(+)
>
>diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-expo=
rt.h
>index ae11810f8826..26041718a086 100644
>--- a/drivers/usb/cdns3/host-export.h
>+++ b/drivers/usb/cdns3/host-export.h
>@@ -9,9 +9,11 @@
> #ifndef __LINUX_CDNS3_HOST_EXPORT
> #define __LINUX_CDNS3_HOST_EXPORT
>
>+struct usb_hcd;
> #ifdef CONFIG_USB_CDNS3_HOST
>
> int cdns3_host_init(struct cdns3 *cdns);
>+int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
>
> #else
>
>@@ -21,6 +23,10 @@ static inline int cdns3_host_init(struct cdns3 *cdns)
> }
>
> static inline void cdns3_host_exit(struct cdns3 *cdns) { }
>+static inline int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
>+{
>+	return 0;
>+}
>
> #endif /* CONFIG_USB_CDNS3_HOST */
>
>diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
>index b579ef15f4e0..030d6421abd3 100644
>--- a/drivers/usb/cdns3/host.c
>+++ b/drivers/usb/cdns3/host.c
>@@ -14,6 +14,18 @@
> #include "drd.h"
> #include "host-export.h"
> #include <linux/usb/hcd.h>
>+#include "../host/xhci.h"
>+#include "../host/xhci-plat.h"
>+
>+#define XECP_PORT_CAP_REG	0x8000
>+#define XECP_AUX_CTRL_REG1	0x8120
>+
>+#define CFG_RXDET_P3_EN		(1 << 15)
>+#define LPM_2_STB_SWITCH_EN	(1 << 25)
>+

Please use BIT(15) and BIT(25)
Reviewed-by: Pawel Laszczak <pawell@cadence.com>

Regards
Pawel

>+static const struct xhci_plat_priv xhci_plat_cdns3_xhci =3D {
>+	.suspend_quirk =3D xhci_cdns3_suspend_quirk,
>+};
>
> static int __cdns3_host_init(struct cdns3 *cdns)
> {
>@@ -39,6 +51,11 @@ static int __cdns3_host_init(struct cdns3 *cdns)
> 		goto err1;
> 	}
>
>+	ret =3D platform_device_add_data(xhci, &xhci_plat_cdns3_xhci,
>+			sizeof(struct xhci_plat_priv));
>+	if (ret)
>+		goto err1;
>+
> 	ret =3D platform_device_add(xhci);
> 	if (ret) {
> 		dev_err(cdns->dev, "failed to register xHCI device\n");
>@@ -56,6 +73,29 @@ static int __cdns3_host_init(struct cdns3 *cdns)
> 	return ret;
> }
>
>+int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
>+{
>+	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
>+	u32 value;
>+
>+	/* set usbcmd.EU3S */
>+	value =3D readl(&xhci->op_regs->command);
>+	value |=3D CMD_PM_INDEX;
>+	writel(value, &xhci->op_regs->command);
>+
>+	if (hcd->regs) {
>+		value =3D readl(hcd->regs + XECP_AUX_CTRL_REG1);
>+		value |=3D CFG_RXDET_P3_EN;
>+		writel(value, hcd->regs + XECP_AUX_CTRL_REG1);
>+
>+		value =3D readl(hcd->regs + XECP_PORT_CAP_REG);
>+		value |=3D LPM_2_STB_SWITCH_EN;
>+		writel(value, hcd->regs + XECP_PORT_CAP_REG);
>+	}
>+
>+	return 0;
>+}
>+
> static void cdns3_host_exit(struct cdns3 *cdns)
> {
> 	platform_device_unregister(cdns->host_dev);
>--
>2.17.1

