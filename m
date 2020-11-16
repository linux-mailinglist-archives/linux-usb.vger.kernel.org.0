Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D018D2B54FD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 00:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbgKPXaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 18:30:21 -0500
Received: from mx0a-000eb902.pphosted.com ([205.220.165.212]:34004 "EHLO
        mx0a-000eb902.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726227AbgKPXaV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 18:30:21 -0500
X-Greylist: delayed 1135 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Nov 2020 18:30:20 EST
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
        by mx0a-000eb902.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AGN71s1009278
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 17:11:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps1;
 bh=9xEksCHy21BtTQ/W8xry07jyrj5xCiiH0jsUzwlVVMo=;
 b=NweEiqXEmxpxENgxVbaNKUYS/TpWezsJ9B6vqJleqrKs/WlaLvn1x/adzt1UANWs5j3A
 emhf9r+XFGKe/Ih8tavuOfdCxm7QHFmuOYR7FWFe1rJ6Vo+CoTkQeUZgSzAsVF/DEZeb
 +QGJ4BpYF7bQ+QU96FHVTvuTsG8JF0T6ewWuLtP7W/0neI3wSXzZ1Ji1AY0QcpLPZtA8
 rjbp8dgFa56dezjdTRHVqF2iDCmnplOPxthI22w5KVrfcgjwHv7peWSzt4ZvoB9lN/yu
 aedb6pSETnkSrEuzgdUvPw7qnm5hatG0ktI+QRKqk6EJb9KTiH/vKSIZ9q8iCJecpeIY aA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by mx0a-000eb902.pphosted.com with ESMTP id 34tbr52ydw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 17:11:24 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UijkwOav8Nn8tVbT2zSfYXZEyWKzBor95cxBA/d9y9QdMVlG1MLIXRJ3lYKRWEaHJDhA2+FKUKZT2RkeVlf/AbObBd3efOxeu23IruBIrELvgLic9omJoQ56/8391Hm3jthMIzJVQ0lRsrX6F2QbB4SAeETXCTZqF0lVLaMCw6CVFCIUwn1WO55HobLtf4duMlkQ/Wkfvp23PJX9ninwU8/emIMWgJQ21auVKIZ2BYEh4jpdIxxFma0rRUIPgjr2YJx1KkGmWTE6AI4QOXaGtNQwFDCaOjrkc+w2/xFFQNn3nLXOfc4s0ru0XJQwTRyoEpnzo9Z3xU7sV3RvOOmL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xEksCHy21BtTQ/W8xry07jyrj5xCiiH0jsUzwlVVMo=;
 b=Z47Zg//W3KGO4DF9scxidIXqO9XbXkqiaLFvjm8P8GtznMll4Y5KXJnfOXIp+GiT6kRbUjR+5l4NMaV2dJScKip5c142w6x/YCU5E3QuY8vS7PEUNv/ivMoQ9enLPrSQXfS20y0vAojCsEphP0l7Rxj1nRFefqu+FscWa9JorZJdN7dcSs5sDFHawU40iTLTmfk4y1X6LqQV+mSqDYc3dThSUSeeo6n50RIVGmeeucOxOd3lvoV9HNFk+xtxBDxnRF48enz6CfpRLKTTyARuAbC6wVxMG9mcpVKQitVgCQfoKhNC7wx/Or30AwM435s9QbBIyRnKZ5rK+WjDpspBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xEksCHy21BtTQ/W8xry07jyrj5xCiiH0jsUzwlVVMo=;
 b=xpx2/ITsMxnOKZ0S9phHB5GqUqOgbnkW+EEx35/zIFnuWAhhqcBPPwDt9ANKK+PE+FFlU5gKPQ32212dAWKLewRwY8tCHNbr8BSM34osxWUkVVMpeBMGcGTqxfZBsFXQqwGDbr0peuoydQjPyP+xCZXS0lBooNsW3PZGCUOhfhXm62f+e+wQAtPNnztQ4aoVvx84ZN02tkHNR3WgstRRi5/40Ek9vfxIYFhjvQOhZZoFprVt1e+hLOpn4Ug+dvHWJomlRyPMhYgeA9rvC9hsm95XgSFH2gqYNaFupJ3n7DdZuVyeSENutrxk7sfWURc6OTN3HpX1Ljy6cw0URdMrfw==
Received: from BN7PR06CA0063.namprd06.prod.outlook.com (2603:10b6:408:34::40)
 by DM5PR04MB1180.namprd04.prod.outlook.com (2603:10b6:3:a8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Mon, 16 Nov 2020 23:11:22 +0000
Received: from BN7NAM10FT008.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::66) by BN7PR06CA0063.outlook.office365.com
 (2603:10b6:408:34::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 23:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN7NAM10FT008.mail.protection.outlook.com (10.13.157.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.22 via Frontend Transport; Mon, 16 Nov 2020 23:11:21 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
 olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Mon, 16 Nov 2020 17:11:20 -0600
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 16 Nov 2020 17:11:20 -0600
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2106.004; Mon, 16 Nov 2020 17:11:21 -0600
From:   "Neuenschwander, Bowe" <Bowe.Neuenschwander@garmin.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: USB Gadget EEM Suspend/Resume
Thread-Topic: USB Gadget EEM Suspend/Resume
Thread-Index: AQHWvG1JL2Kd5y1bZE+t7tgpTs7zZQ==
Date:   Mon, 16 Nov 2020 23:11:20 +0000
Message-ID: <09f87aed186f4c8cb56aee1d2409ae65@garmin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.7]
Content-Type: multipart/mixed;
        boundary="_002_09f87aed186f4c8cb56aee1d2409ae65garmincom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a7bf9b9-7d13-48db-9439-08d88a84eed2
X-MS-TrafficTypeDiagnostic: DM5PR04MB1180:
X-Microsoft-Antispam-PRVS: <DM5PR04MB118044FB1DF0978CD08D1D399CE30@DM5PR04MB1180.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QcwncsLXqvaDABNw8DqI0q6QqrKDUCW5pclZ08730Ae8Ws+eKZeuClnc4VP91ZoxMmNdH+nEQ9bR4rhA7D4LSYFtu47kUYOivq6mYmPJPEF9SMh3ICsTEhfqiKP2BJ8xEPa+Bj7zvQmDVc7E5zfJ4v7ko8M9f+5/grfWvAxfGJqi3pTOdDQD/QI6c+UrtpXapUWSforp1yG+qXQaD23z2B44XHBNY5ujVSMTRJqZr2fyt3JHvzzCMM0mzhR/+lZJrv63lpI+GGJMkfrnD5LlaI8WgQkZiYl8GtCKjF69suoUIcRlzGqjAQ9fnlDK4KjusdLIDP49Kp8uXrz9xHCAevI/TlwHPk93fpmalggLcR+0PK/1FAYQwNfH37hdhE+qhAVaClafL//pQud2tKZXqQ==
X-Forefront-Antispam-Report: CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(346002)(39860400002)(136003)(396003)(376002)(46966005)(7696005)(82740400003)(24736004)(426003)(186003)(36756003)(82310400003)(108616005)(336012)(316002)(2616005)(26005)(356005)(83380400001)(7636003)(99936003)(15650500001)(8676002)(47076004)(235185007)(5660300002)(478600001)(6916009)(66616009)(8936002)(86362001)(70586007)(70206006)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 23:11:21.8949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7bf9b9-7d13-48db-9439-08d88a84eed2
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT008.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1180
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-16_13:2020-11-13,2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160139
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--_002_09f87aed186f4c8cb56aee1d2409ae65garmincom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I was hoping for some input  on how USB Ethernet Gadget drivers should hand=
le USB suspend/resume  events.=A0 We have a case where the USB suspend hook=
 is being called for  an EEM Gadget; but since that hook is currently unimp=
lemented, the interface remains in an active/enabled state. =A0I have  atta=
ched a patch that seems to fix this issue for EEM devices by  calling gethe=
r_disconnect() on suspend and gether_connect() on resume;  but I do not if =
this is actually correct behavior, so I was looking for some advice on that=
.=A0 It seems that since the gadget driver cannot send data until the USB h=
ost resumes the USB link,  that the interface should be considered disconne=
cted.

Thanks,
-Bowe
    =

--_002_09f87aed186f4c8cb56aee1d2409ae65garmincom_
Content-Type: text/x-patch;
	name="0001-usb-gadget-eem-Add-suspend-resume-handling.patch"
Content-Description: 0001-usb-gadget-eem-Add-suspend-resume-handling.patch
Content-Disposition: attachment;
	filename="0001-usb-gadget-eem-Add-suspend-resume-handling.patch"; size=2023;
	creation-date="Mon, 16 Nov 2020 23:08:22 GMT";
	modification-date="Mon, 16 Nov 2020 23:08:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3Y2RjMWNlYmU0MDkyMzkzZTFkZTMzZjU5ZmQyZjFjZDQzNTVkNDk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCb3dlIE5ldWVuc2Nod2FuZGVyIDxib3dlLm5ldWVuc2Nod2Fu
ZGVyQGdhcm1pbi5jb20+CkRhdGU6IFR1ZSwgMTAgTm92IDIwMjAgMTU6NTU6NTEgLTA2MDAKU3Vi
amVjdDogW1BBVENIIDEvMl0gdXNiOiBnYWRnZXQ6IGVlbTogQWRkIHN1c3BlbmQvcmVzdW1lIGhh
bmRsaW5nCgpBZGQgc3VzcGVuZC9yZXN1bWUgaGFuZGxpbmcgdG8gdGhlIFVTQiBHYWRnZXQgRUVN
IGRyaXZlci4gIE9uIHN1c3BlbmQsCmRpc2Nvbm5lY3QgdGhlIGludGVyZmFjZTsgb24gcmVzdW1l
LCBhdHRlbXB0IHRvIHJlY29ubmVjdCB0aGUgaW50ZXJmYWNlLgoKQ2hhbmdlLUlkOiBJMWM3YTJi
YjFkNjhhOTljNzc0YTQxNWIxM2Y2Y2RhYmI1MDdhZGE5MgotLS0KIGRyaXZlcnMvdXNiL2dhZGdl
dC9mdW5jdGlvbi9mX2VlbS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
Z2FkZ2V0L2Z1bmN0aW9uL2ZfZWVtLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9l
ZW0uYwppbmRleCBjYWQzNWE1MDJkM2YuLjRmYmRiYjhlZTI5NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWVtLmMKKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1
bmN0aW9uL2ZfZWVtLmMKQEAgLTIzOCw2ICsyMzgsMzMgQEAgc3RhdGljIHZvaWQgZWVtX2Rpc2Fi
bGUoc3RydWN0IHVzYl9mdW5jdGlvbiAqZikKIAkJZ2V0aGVyX2Rpc2Nvbm5lY3QoJmVlbS0+cG9y
dCk7CiB9CiAKK3N0YXRpYyB2b2lkIGVlbV9zdXNwZW5kKHN0cnVjdCB1c2JfZnVuY3Rpb24gKmYp
Cit7CisJc3RydWN0IGZfZWVtCQkqZWVtID0gZnVuY190b19lZW0oZik7CisJc3RydWN0IHVzYl9j
b21wb3NpdGVfZGV2ICpjZGV2ID0gZi0+Y29uZmlnLT5jZGV2OworCisJREJHKGNkZXYsICJlZW0g
c3VzcGVuZGVkXG4iKTsKKworCWlmIChlZW0tPnBvcnQuaW5fZXAtPmVuYWJsZWQpCisJCWdldGhl
cl9kaXNjb25uZWN0KCZlZW0tPnBvcnQpOworfQorCitzdGF0aWMgdm9pZCBlZW1fcmVzdW1lKHN0
cnVjdCB1c2JfZnVuY3Rpb24gKmYpCit7CisJc3RydWN0IGZfZWVtCQkqZWVtID0gZnVuY190b19l
ZW0oZik7CisJc3RydWN0IHVzYl9jb21wb3NpdGVfZGV2ICpjZGV2ID0gZi0+Y29uZmlnLT5jZGV2
OworCXN0cnVjdCBuZXRfZGV2aWNlCSpuZXQ7CisKKwlEQkcoY2RldiwgImVlbSByZXN1bWVkXG4i
KTsKKworCWlmICghZWVtLT5wb3J0LmluX2VwLT5lbmFibGVkKSB7CisJCW5ldCA9IGdldGhlcl9j
b25uZWN0KCZlZW0tPnBvcnQpOworCQlpZiAoSVNfRVJSKG5ldCkpCisJCQlFUlJPUihjZGV2LCAi
JXM6IGVlbSByZXN1bWUgZmFpbGVkLCBlcnIgJWRcbiIsCisJCQkgICAgICBmLT5uYW1lLCBQVFJf
RVJSKG5ldCkpOworCX0KK30KKwogLyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8KIAogLyogRUVNIGZ1bmN0
aW9uIGRyaXZlciBzZXR1cC9iaW5kaW5nICovCkBAIC02MzYsNiArNjYzLDggQEAgc3RhdGljIHN0
cnVjdCB1c2JfZnVuY3Rpb24gKmVlbV9hbGxvYyhzdHJ1Y3QgdXNiX2Z1bmN0aW9uX2luc3RhbmNl
ICpmaSkKIAllZW0tPnBvcnQuZnVuYy5zZXRfYWx0ID0gZWVtX3NldF9hbHQ7CiAJZWVtLT5wb3J0
LmZ1bmMuc2V0dXAgPSBlZW1fc2V0dXA7CiAJZWVtLT5wb3J0LmZ1bmMuZGlzYWJsZSA9IGVlbV9k
aXNhYmxlOworCWVlbS0+cG9ydC5mdW5jLnN1c3BlbmQgPSBlZW1fc3VzcGVuZDsKKwllZW0tPnBv
cnQuZnVuYy5yZXN1bWUgPSBlZW1fcmVzdW1lOwogCWVlbS0+cG9ydC5mdW5jLmZyZWVfZnVuYyA9
IGVlbV9mcmVlOwogCWVlbS0+cG9ydC53cmFwID0gZWVtX3dyYXA7CiAJZWVtLT5wb3J0LnVud3Jh
cCA9IGVlbV91bndyYXA7Ci0tIAoyLjI5LjIKCg==

--_002_09f87aed186f4c8cb56aee1d2409ae65garmincom_--
