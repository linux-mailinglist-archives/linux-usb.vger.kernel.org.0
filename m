Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B61634DFC6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 05:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhC3D5s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 23:57:48 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:60914 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231475AbhC3D5W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 23:57:22 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12U3g4aF000912;
        Mon, 29 Mar 2021 20:57:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=1Mvxj+3bUqpXd3H2Uufi4bTn3zPSRXcrNlxrlNoAOfE=;
 b=JYLQagiyIZTzKUEntLw0lM1reHCDId7P+flOEqcXDM7ylQNplaeBcu9eC1Wf3api0pe2
 n9N5nqU/HQCUu1Mce3v6YL08fZOFQZR2dC39eOuZOcHdnNBty3YjwGcLVW3TYEE3yNAp
 6IAleZa5iXwLH5Y/CFCQzzqr3JLBBIiHnCsxtw12cnpvWjUWXg2ABrhsnrg2OAeooO0W
 lzblJPZIWADIA7ta2OChunsZAZ5nhXFTKnPVHdGbyCilU6GfKjcXGylrN4IlN6PQAZLH
 z6iwyaIpu03AwIL6d2p8ITsrMtH+Y7h8NCBvu9kvHnMzYCdCzEcysN3jZd3lXpcCMat8 7Q== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        by mx0a-0014ca01.pphosted.com with ESMTP id 37khww1r0y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Mar 2021 20:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+bsifR6M53Abmn1Vt9lPEYQHPIkyz0I25b9Cjn5rvTMVTpzfqnRkC1GtZ+itz3SZG+F/O7b39MxcDEiYlhCzSU5QkqnyK9TD5dpeBHCUbFG8hiu7sCOAZmCG9qsfQMK3QU6RqQ692IYu0ftO6sZ3xGA0Tb2A3N8h8N/sbX9ujG18AXpzRX2S4COxTSsPXvdvWVrBHUWyQvRW4+OgOn2OrzGcXjzuh4+y5P8Ml1bo8ws6kQqYYAORo8dyi6vMiEm7FoWapYw5ohXWh2GqKHWzfpEYt9gre02y/tgsJTRa+4NVoism+D9GVwCL92lDA0ODzUTalRSDJHmuCtEA4TIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Mvxj+3bUqpXd3H2Uufi4bTn3zPSRXcrNlxrlNoAOfE=;
 b=iP0BISVtqDcvyCNOVCFlxc4cJV6/C4r5yvbc1o3h9OVICAW6ojyabF/Zo5PudhDLHr4/MvKojGkNjxupZFUgrT23DvYid/FS6FpdZDpXCQ+VC1jIP2a3FBr/FANGYXwWHq3DlIP80Fh48Q/49MGPVEU54qOUBX47EA4n4ylzRi6OI4O7aziBqAy+dmS+0mnN+xoIDQH1i3KiJtmUhaj1KGjDty4TDptArxtWikeethGKwGW8DmDyerufdv5unqd1OOFYnuJDnI8XdRSUlsJOcHrp0Bk3sw4zBQV4fnWTJtomSUjA/i1Hh0kiC0A/Jo2ieHE9ajhWcXuOzfnx6lLcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Mvxj+3bUqpXd3H2Uufi4bTn3zPSRXcrNlxrlNoAOfE=;
 b=wq2TOGZfYfqpQvwOYxF448rsuPuIx+580hUonql7+SeN8yzLMq3SpL4UHgXydwHf9hYLZ+hZ4i5qPQrq3CyheP+T+ccuMPzaWAWOG2wXbKa1GP6qKlg+tbUE7XZ0X/vFF0FA6CZAxXnwSKYwHlWliDB0J4uqAQ99epA3cLzltLc=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BYAPR07MB5480.namprd07.prod.outlook.com (2603:10b6:a03:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 03:57:16 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0%7]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 03:57:16 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: About use case of cdns3-pci-wrap.c
Thread-Topic: About use case of cdns3-pci-wrap.c
Thread-Index: AQHXIsS2R2UvrumKxE6wApuUfmUcuaqb6D6g
Date:   Tue, 30 Mar 2021 03:57:16 +0000
Message-ID: <BYAPR07MB5381B6A27EAC38E4015E6184DD7D9@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210327045016.GD28870@b29397-desktop>
In-Reply-To: <20210327045016.GD28870@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMDIwN2QyZGQtOTEwYy0xMWViLTg3ODctMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDAyMDdkMmRlLTkxMGMtMTFlYi04Nzg3LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMTA0OCIgdD0iMTMyNjE1NTAyMzM1MDYxMDI0IiBoPSJBUUt4S3RFblorSzd4NTNKMDVXb09GbGt5dFk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f48af8d-8e7b-40be-6cc6-08d8f32fe8b5
x-ms-traffictypediagnostic: BYAPR07MB5480:
x-microsoft-antispam-prvs: <BYAPR07MB548021A3A437F172284DDD38DD7D9@BYAPR07MB5480.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zlbEzL+4UYyfsmh+cVio81wI0T5sicezVViklmPCGKkiQ2Amnbq4UHwbaJbiNScTxbyvjtIpVVg6yJhF8/uVdorxIH/GwcFybsv1t1ulyjLAFxUR41Xs6bN+m31vHv/xevTaqoTOQvP9O38FbTXL5O6UZH3G7aJL3NVAvx88lZHYDcmqafNmIfnCEgTB7pJ6B1Xq3Zx+U0s+7pHY0tqjKfK1YuAQbRQfbtLAOY/kBxRU3+TB+5+UMLa2V9nDcKLaek4f59cq8o3pYvw/wnvn+nN72HqRQ/T69HEaL7dJeUSs7zqixL8LWnFmB4A9c3JKREVjIedUVmo+6tuvXtf3Rp+/A4BI1bCF7AKrReA6Ig9bWV8FGat9zxUiaBvzroWtd1Sj/YzgokXqpbdyPjuJbhWYnzdB8WC6Y9eFarRmVwXLlmZez5RusMY+bYD6uw/qgvrPLKmp4cQpPQDyXqhAonV5YLfHwf36yNFYszei/ix235i8/QmQr/pBhdvnKZtwyRxSy1l/pFzcm3Wzp2zBfeRU8dmKeC5NEKpaB6FbYOd2J6evqrZ01Ljg3uAWX7+/fKWWpKNeWrdhYff7opmuJGXOAAjYQgCK8MtxHUZw5SUHt/p8Y42GBFMq9EFxxeFsvTIOAvFIfOQATzWquEDI+8tev2CaqXxqht+1Ut8dtJdNVMQvQbiWZouOuf5O+Aed
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(36092001)(186003)(6916009)(9686003)(5660300002)(38100700001)(4744005)(76116006)(2906002)(83380400001)(55016002)(71200400001)(7696005)(316002)(64756008)(66476007)(8676002)(8936002)(33656002)(66556008)(66446008)(66946007)(52536014)(86362001)(6506007)(26005)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?N4Iwi9S+8kK1mToNiqQWZyLxob+t30PK3/2geeueLMtg21UFOueUp4Yme4wj?=
 =?us-ascii?Q?q+c7mVZ1y0Pwnr8izUaLJeR6nwnHVb0OcDZ0pvLiALalkHu0R2OgagcCdjtx?=
 =?us-ascii?Q?bp9X/I1zBkkD7UMGEfK3jy12gAHysOTpg97kYEeHZ4+6Nc82jmQpx7rS+qRv?=
 =?us-ascii?Q?4mSbcglaME0A0Fh1SD2ctQZCpzhVtNMVLy7q/Q7uWH9xYPkqmS6GA9ifEFf6?=
 =?us-ascii?Q?FxESQBnCXvlOs2wBMXGbc2SQdrjRAhR8244t8Dqv1zVf4/23LiXSSYleWM9e?=
 =?us-ascii?Q?u19dCgBTAlMkxJ5LZHS4uqAkv3Xmn3EAPo9oDVr0K6pGNBnPJjkQGXchYHYf?=
 =?us-ascii?Q?R2BGxec6GQZx/FyRSLwD4fqlxAtziEinbOOw/5UUlTdWm9FZ5Nybgy+HCSkr?=
 =?us-ascii?Q?oLz/Benfr91ohT0PfYT5NvUEmGgGPC82yrM7Odn/lhUbwnbttjsR91oDWeGt?=
 =?us-ascii?Q?1oc9n1omngw8Y1+D503WYuNnCNmpFtQQLnuVeLjWJuUQusXrPE+YeJh0I7IQ?=
 =?us-ascii?Q?7o/SJ0sN7SxqQdunpgmrIkqp7F7DYWyaLx7X2x5Y6RXdjpYbiyEr5VcU9Jw8?=
 =?us-ascii?Q?D0izcfkWmM8rAbWOBdRE09LsQedrAUkY7F/wznw7Sb8dLJS0cRNj7uhtu3Iq?=
 =?us-ascii?Q?HvChDVNP0dm6H6cNWtmC+e/ggN3+nejah/IBwyTbnM+BzQl7IdvHDI9rJ3Vu?=
 =?us-ascii?Q?+mf6a7hIqFHj8fUiT6Kp8T9ac9XuY+5rnabJf9T6x4YQTw7mLM4jzTuWLtP4?=
 =?us-ascii?Q?TwjWGlFJXVm09Wdp5ByrfL+nuhTypx7yFIfQ25o1Vhv8fHyNPP0+wGo1YGel?=
 =?us-ascii?Q?b97g3CgW0AepXyuDPzXUz1dZ7zNoCJag2uyoFXXfYM4zzAicBkQfzAjSS36z?=
 =?us-ascii?Q?StHVYUlQ3JsSZWX1qxZ4NLYXl+v8CZxo7FRxkd5I1o95nK3r/ZSGu4dqbxAc?=
 =?us-ascii?Q?Zpe9+nWl5L1lN4MF33mEkZ9PaNWAx8HdKsHceIy8fd8sHmpPJIKHJTdJSd71?=
 =?us-ascii?Q?dsMdAhzXKllhb1QZLpVpruX69am+chYRF6npymOWZnfDaKf9TFw7oSiyfw6E?=
 =?us-ascii?Q?gM24/Os0tku6XJgpdNbODLPHLjKZPBpFKbIGPIL5D+vZwRIElj/RwjDI0k3K?=
 =?us-ascii?Q?VpTfmgtdeL8EUIQjZQeUCbVBftJNx9E/3s6dmO7VBbMk5Lnk7Ug0HGy4YhMR?=
 =?us-ascii?Q?NXW79MbmAdhn6/l8/lZrFfmvchhI7J70j3tJHEpeUdUh6uHlY5v33r8wpom+?=
 =?us-ascii?Q?C852meCP87evCSbUgcqxMmCIDMtq0degqKcIwoAr34UO919xGU0SlvrMKl9s?=
 =?us-ascii?Q?BVIHa2NAfZVhfNEShrvdwBsK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f48af8d-8e7b-40be-6cc6-08d8f32fe8b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 03:57:16.5358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ii9A9va+BoEMGGsyAKOoEQO/D0mGu6S14kI4ltla2iw5HPta5lfET0pHVqoJTU84BS/8bfMDc6GYor++ABvT5zdha14Paef3MPQ4aP/pNOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5480
X-Proofpoint-ORIG-GUID: w4xVb8inVXNZeY36mUMVvdYS8lSBwl5W
X-Proofpoint-GUID: w4xVb8inVXNZeY36mUMVvdYS8lSBwl5W
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-30_01:2021-03-26,2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1031
 mlxlogscore=594 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300023
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

>
>Hi Pawel,
>
>From the code of this file, it seems the controller driver is running at
>PC side, but the hardware controller is at verification board, the two sid=
es
>are connected by PCIe. Am I right?
>
>If I am right, the memory (eg, the TRB ring address and data buffer) the h=
ardware
>try to visit is at PC side, but how controller visits PC memory since the =
TRB ring
>address is allocated dynamically by controller device driver running at
>PC? How the local bus arbiter knows it is PCIe address at verification boa=
rd?
>Besides, could the upstream code run this IP verification solution through=
 PCIe
>without changing any code?

Yes, the two sides, verification board and PC are connected by PCIe cable c=
onnected by using special PCIe
adapters.
The PC sees FPGA board as the part of PC hardware. It's work in the same wa=
y as standard XHCI controller
based on PCIe.

>
>Thanks.
>
>--
>
>Thanks,
>Peter Chen

Regards,
Pawel Laszczak

