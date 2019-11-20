Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE5E103743
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 11:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbfKTKON convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 20 Nov 2019 05:14:13 -0500
Received: from usflmia-meg1.delphi.com ([69.195.251.241]:8771 "EHLO
        usflmia-meg1.delphi.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfKTKON (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 05:14:13 -0500
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 05:14:11 EST
Received: from 10492-US-DLP003.delphiauto.net (unknown [10.201.250.15]) by usflmia-meg1.delphi.com with smtp
         id 3857_c923_ebbbdaaa_f122_4463_bcbf_898ceb733673;
        Wed, 20 Nov 2019 05:03:51 -0500
Received: from usflmia-gw2.delphi.com ([10.192.117.25])
        by 10492-US-DLP003.delphiauto.net (8.13.8/8.13.8) with ESMTP id xAKA3pWD023563;
        Wed, 20 Nov 2019 05:03:51 -0500
Received: from mx0a-00275a01.pphosted.com (mx0a-00275a01.pphosted.com [148.163.157.133]) by usflmia-gw2.delphi.com with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 59c1_d27e_87a26f55_9d0d_4ce2_a7ed_4c6646fb2041;
        Wed, 20 Nov 2019 05:03:50 -0500
Received: from pps.filterd (m0121501.ppops.net [127.0.0.1])
        by mx0a-00275a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAKA0hVm018888;
        Wed, 20 Nov 2019 05:03:50 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com (mail-dm3nam03lp2051.outbound.protection.outlook.com [104.47.41.51])
        by mx0a-00275a01.pphosted.com with ESMTP id 2wd35vg1be-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Nov 2019 05:03:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7pcPx/vzcmVLsEyui0Ll+IWMbNyC95Z/E8G4EWlSxTrgi/6PVfksCJNSEAZltWxP5RgvHN3A1EUjz7GXPGTJWnNCrDlxuTw5jVbcZG9SwP/t0IpKGNlivv8tIeJ4gUMkl+p3o4+D3KsUaaAUlR7nfKs2BhgRdI++p7pbPeQfFSTNiXGciCSQYJvcqOovJPpavWITsrwFFPCZuJRtCzeYN32sk2kGnRqIcsmnrUZWCEJQewGR/DHmsb86q0KoeSFXpxFBq0B3CmwrIQ5fxT6vqbZyOhp47HYBfoVIBQh6c9PFU2M286V2Sy6OsOKc/zxiGeF0qvUjsp1zghgAEHdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB1+bhtj9785U5FtT+RPUHylbVp6TDM3ulLtU+LB+Ho=;
 b=YEnJjXv2To6X6qH/5nh/bI9vyBWDfs9BLXZb84wYA907lFVm1vU3nLL01cuA1PkratKnJmpEN5Of8/xzO4md6fBZKK2e3Oxct++neSs2DVXvVIXREmghH1bdFFbfMG6H/XiiPz5wxnBMZpdGtfET8IW7WZoUjUX8t2R8YOFD4XuDEE4/cxWARwA8IAVumgRaY+T9qb0ycuItGlf6xkpcruW2Zg7Yl9Ra/uNWuNbLWgKxq0HmTHJqZ1HijMqAWcPPPkv1zAWiFwK0ftlrrripeg9H1dIGFPSzPm8Pu/ut9pcs5SnJPfezMPP2LZFNawOTwzAhh8c3SooC7tQnfW6uGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aptiv.com; dmarc=pass action=none header.from=aptiv.com;
 dkim=pass header.d=aptiv.com; arc=none
Received: from DM5P197MB0060.NAMP197.PROD.OUTLOOK.COM (129.75.103.155) by
 DM5P197MB0011.NAMP197.PROD.OUTLOOK.COM (52.135.28.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Wed, 20 Nov 2019 10:03:48 +0000
Received: from DM5P197MB0060.NAMP197.PROD.OUTLOOK.COM
 ([fe80::1020:6c63:1fd5:4f3d]) by DM5P197MB0060.NAMP197.PROD.OUTLOOK.COM
 ([fe80::1020:6c63:1fd5:4f3d%2]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 10:03:48 +0000
From:   "Kieronski, Milosz" <milosz.kieronski@aptiv.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Ignacyk, Slawek" <slawek.ignacyk@aptiv.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_ncm: Prevent use-after-free of notify_req
Thread-Topic: [PATCH] usb: gadget: f_ncm: Prevent use-after-free of notify_req
Thread-Index: AQHVn4nNPFmyufidxUKspxqyOgKAXg==
Date:   Wed, 20 Nov 2019 10:03:48 +0000
Message-ID: <20191120100327.GA11036@aptiv-dev>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO1P197CA0004.NAMP197.PROD.OUTLOOK.COM
 (2603:10b6:110:74::18) To DM5P197MB0060.NAMP197.PROD.OUTLOOK.COM
 (2603:10b6:23:14::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [62.148.91.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 720d2b0c-f672-42c5-5452-08d76da0f01f
x-ms-traffictypediagnostic: DM5P197MB0011:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5P197MB001182FC6A45A263C4AC772D8A4F0@DM5P197MB0011.NAMP197.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(396003)(366004)(376002)(39860400002)(136003)(189003)(199004)(26005)(186003)(6116002)(3846002)(14444005)(256004)(486006)(2906002)(7736002)(66066001)(86362001)(6512007)(9686003)(99286004)(476003)(6436002)(6486002)(305945005)(52116002)(316002)(25786009)(54906003)(71190400001)(8676002)(102836004)(33716001)(81166006)(71200400001)(66556008)(81156014)(66946007)(8936002)(6916009)(66476007)(33656002)(64756008)(66446008)(5660300002)(386003)(6506007)(14454004)(1076003)(478600001)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5P197MB0011;H:DM5P197MB0060.NAMP197.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aptiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7uyBLdPwou7iAicLRV/1H3efjPWQ4X7CC3JKNk7KuxOMnyKtrP7iysbQ0vrcUkWmKycTPNyFewJK33VlPYWAN/lhZptPGzL9VL1Puk4TpSSpCBGpCx9mazv9DKjuQRGmebdCsq3P/wlgTrJktwCyfbAm2MVZtXu3h2RJ6MCkgCCMw7rZ85Uc2sQNzMRJuE5JEA7+uZU/g5lhDCoeL9DJCTlbAFiT4IWw7WDb9+YtUmE3YwGVbqguKXh9maFlWhzQY5wXIqPDtkiKRwk3PZOLkkZkhSRPaRbxL5dMsdcaw4oPq4TuwmwxzG3Iv4p/Tn1eIyIELDccOMX5NUXnGEPmQlPYhg5LESoMMlDYnFsIKdctC+rsWaOlll6eykxtSGocQhPDOJp0uvUPWgKttCi5XLpy00q8nU4MPZ+tqzUkHegHfl/bycx6LPviiGkYazvv
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21B412DE536FCB46ADAF902BD87124C7@NAMP197.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: aptiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720d2b0c-f672-42c5-5452-08d76da0f01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 10:03:48.8933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6b1311e5-123f-49db-acdf-8847c2d00bed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwwklLG54ux7yebm/+0uJ5JtO4Z6sEzILaJqdD3XCrHHevzgyqpKw6A3GMx+hBlh2m2Mvsoe0g2MsdCGHY1VcqGOkK3sGoJpqOF93spgiUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5P197MB0011
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_02:2019-11-15,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=447 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911200092
X-RCIS-Action: ALLOW
X-MEG-POLICY: ALLOW
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When ncm_ubind() executes first then ncm->notify_req is freed before
usb_ep_free_request(). This produces use-after-free bug in ncm_close()
while we write to ncm->notify_req->buf despite the "if (!req)".

To make this sanity check working, we set ncm->notify_req to NULL
after each free.

Signed-off-by: Milosz Kieronski <milosz.kieronski@aptiv.com>
Co-developed-by: Slawek Ignacyk <slawek.ignacyk@aptiv.com>
Signed-off-by: Slawek Ignacyk <slawek.ignacyk@aptiv.com>
---
 drivers/usb/gadget/function/f_ncm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 2d6e76e4cffa..a1a521a69187 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1526,10 +1526,13 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	kfree(f->os_desc_table);
 	f->os_desc_n = 0;
 
+	spin_lock(&ncm->lock);
 	if (ncm->notify_req) {
 		kfree(ncm->notify_req->buf);
 		usb_ep_free_request(ncm->notify, ncm->notify_req);
+		ncm->notify_req = NULL;
 	}
+	spin_unlock(&ncm->lock);
 
 	ERROR(cdev, "%s: can't bind, err %d\n", f->name, status);
 
@@ -1649,8 +1652,11 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	ncm_string_defs[0].id = 0;
 	usb_free_all_descriptors(f);
 
+	spin_lock(&ncm->lock);
 	kfree(ncm->notify_req->buf);
 	usb_ep_free_request(ncm->notify, ncm->notify_req);
+	ncm->notify_req = NULL;
+	spin_unlock(&ncm->lock);
 }
 
 static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
-- 
2.17.1

