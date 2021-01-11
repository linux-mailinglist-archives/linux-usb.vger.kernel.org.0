Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E05E2F0D01
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 07:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbhAKGt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 01:49:58 -0500
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:2082 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbhAKGt6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 01:49:58 -0500
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10B6lFVU015694;
        Sun, 10 Jan 2021 22:49:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Vn4zYJWdRtBxyhaeXUDqgq8mlCaY5TYtFfa77H9iyHU=;
 b=GXkE7SRVQid69rsE1WzMC8mt7V0qoAOgfDXSYe4eQG83G7Dyf6lzp0SfIvXUKZpFothA
 Jz+EVI1GTtNdHdy04ntFtT0VhmI6jQaVX3JeAJ+/XFxLa9uVqt2u1PAYfHldgTbZ1CPu
 RfGzwX1JbFzalgYSAznnDSfZbub8oi3XquY7U/PXBrqwgHUCKb/udfV32Dd7YHivuVbv
 3PJwWOs3bfOcLcyklPQBnRDR160h/bA/xrFkB0THmnflu0aNpZvvS7d92gy8ZRhXWCeT
 hmnuF7wvFBUT3m2UawixWQTccDrYCJu/viVjUF6Go3/zU3QUIaTP3dMC7yq3qyWG8Mpn xg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by mx0a-0014ca01.pphosted.com with ESMTP id 35y9x0bxas-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 10 Jan 2021 22:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+pd7s76oHECvY+MDC5Wo4ELMe5Fzn3OIa0pCVcAlfLNT8mkJHiV1OU5AbWZJ1QFRRawrjEh8BM12hpfAMzvBq+pg6AZ3Q/Ch0f44ZXsR/icMytsQJXShCI7geKerpDbTpMtj4EpRh1jkUwZ0E1D34JEdH4HS4/yDiG+AN1/exp35u3lnu9DWz822Bl/qW/SXZStS/HOXSDh9pSfo21wIO361Of2X0FfIBV/HMY7E/CUoevkb5jkp8ujJyL/56nCRqKjlj4IeegxPWUXIzJ8IvKkprzxvkKYjwOWMxQxKLNKJ3aibcfS61XdsohU82vtSenOmXzhQPCaPQ+yv0UhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn4zYJWdRtBxyhaeXUDqgq8mlCaY5TYtFfa77H9iyHU=;
 b=V3EfDEgiGgflJwsZ9UnHeh9fIMb8q/xoCPZR8ab0vqw/z4dlTAMkpThhvYvPMYuh4SdRaXGDg9Ww3WvE3Ixy4TEa9ExFhqbKXMS3a1khs45BHxgF3408AnFsdWK+bZ5PHh1PkfzbHxzu26GEVHkmO+65XkqsOkLGMN+yR94GMfMGCs3JSldd92I1Y4MxMuKddeevVw2KAuTu5QhYjQbFT4e1Z7gLfwnsnpdKqtXNDriO/HXYZNdhY0KwUGNtZoQjWkQ18C9TSPD6OXu0DQldE2As6cePhQj6xAKfrpfKCQ/C5Bj8HhpH7OC09GK0cgIeDZHBliq/+GEUwcpkgUcq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn4zYJWdRtBxyhaeXUDqgq8mlCaY5TYtFfa77H9iyHU=;
 b=CWs3DkH3dapYSyU5WwOIktVgXfmVlr4GVcX2llem3M+6jQIbEKcFfyldbzLIQ809LMFmgPEZ/C7j0q/qoJ1A/3cZNhGHXlFzRDXF5iRmhHBhxIEV1ZN2qNj13saUIvAaK4ixtocVlJ5uhcPhOQGGPyvrCwh+ky78PVuFpjn2awA=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BY5PR07MB7029.namprd07.prod.outlook.com (2603:10b6:a03:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:49:04 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::34a2:314c:e80b:3be3]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::34a2:314c:e80b:3be3%7]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:49:04 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "peter.chen@nxp.com" <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: RE: [PATCH] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Topic: [PATCH] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Index: AQHWz6MqonmWhH9tw0+7K9rlUYp7+qoMsGUAgBV5xVA=
Date:   Mon, 11 Jan 2021 06:49:04 +0000
Message-ID: <BYAPR07MB5381DFA8CE2E68A0DD86161CDDAB0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20201211095053.1948-1-pawell@cadence.com>
 <X+nvHj8gXnji8SuP@kroah.com>
In-Reply-To: <X+nvHj8gXnji8SuP@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMTYwNThiZWUtNTNkOS0xMWViLTg3NzYtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDE2MDU4YmVmLTUzZDktMTFlYi04Nzc2LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMTIyNiIgdD0iMTMyNTQ4MjEzNDE4MzMwMjAyIiBoPSJ4UXNpWmU2aG5lOWxveDFxcStFUFZqdnZOZlU9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3eefb8b-3bf5-4cd3-a7bb-08d8b5fcfc89
x-ms-traffictypediagnostic: BY5PR07MB7029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR07MB702936F3060A55C58DF4B7FBDDAB0@BY5PR07MB7029.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hNDK5iFmaByyg7Hx6TGP5dOa/H4FWiBSz1U1F5VuaVykhcsAJcCmL0xJKHKxfKlJr1HYKwnrWMu7iW3Zka2ehdfbhiFHU/MxPRKsMuH/s+HEcThjsVwfIIHi4457Oz7VtgS8bY+MAB/rZpHoODIH1/9XWukNmXcDisnLF9bsSpMyQN/9VHJB/H7T7fE9OhqOcseWYV8jQMCDLJqjy/yDnLlbaI49ogbtyW8JjUe/XEXAwpyCd9beX2InoCGMr3pSHYDgC7tnca44Wd64zzL11NYpcI9oclzv/gBqdhqDUgS3igJJ8VS3HqlutzhV9qzGk2F6EjHry4Xh5Z3Uyq+e15lXGd12+c2d4nGYra+8tAZzjXmieX5pWcVL39Hce68X2MJT5xxYSWPOfRqCWuVZ+yy/r6L5BPEFYCAYcyago6imxdrxEG+vXILI3NQm6ewd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(36092001)(5660300002)(83380400001)(6506007)(4744005)(86362001)(6916009)(26005)(76116006)(8936002)(186003)(7696005)(478600001)(52536014)(71200400001)(54906003)(55016002)(8676002)(316002)(66946007)(4326008)(33656002)(66476007)(2906002)(64756008)(66556008)(66446008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BEbe2ZASyG9BRz0k553eCS2it0Cc0/6S+0VVzekUXDq5hgcHf5aldihoPNe2?=
 =?us-ascii?Q?CnF8xpZBkAWmJTgDSl5t2n6t7HIs+xYeRl+J2Hq6Fe7a6YfDCFMG1Opcjd9v?=
 =?us-ascii?Q?IikrpVacbS7nLJhW8SpmAtpWy8QNn59QOIZr+rpb7tKRkaxYosk1Oudt8ks2?=
 =?us-ascii?Q?Re3dLnIEkUeklBisuRlaTc7urEMD/WD6J8AS5r/bga9dTRy5XqgXk4zdm40k?=
 =?us-ascii?Q?fKMzpY7JaP7z2Z2w7NbZsoQAMd+ZFfcNBoYJUoHHl+63HofxEQi3tuNY+gK3?=
 =?us-ascii?Q?IX4CaoQpwolezr6unoJE/J3I0eUxTUChQu+Jltb8In9rD3pIdfBXI/U+qaci?=
 =?us-ascii?Q?spXkCmqWQEloapHg0IlAVWneR+kdoeJtuizxgLUQ+/X1wfOhgbfoWGoor5IB?=
 =?us-ascii?Q?5VAtxx6DkJNvhgoLs1hFRVJmmMSK61EKB9yc1gIzOjLWNGehvva9wTWZ+Av3?=
 =?us-ascii?Q?phmd7tyG1cCE1fn8n4knl/fBL1zBNOWjVNHCBij/5hy3O4rEAlH8n+Pxstmg?=
 =?us-ascii?Q?OloMotQXjzqC+Y5OalbULOoJiR3FiJhZw4UlQWmxs6IoM4XCQwTFRpf+J8Vt?=
 =?us-ascii?Q?7OcjvPHPPpzgb0XOfZdPXMLo6v4Tz5ax3LcQleWzyR6dW0JNthtX86bIqcOX?=
 =?us-ascii?Q?D6G7SPE9T3HuqzUF77+jX/LD7c0Fy48GjRTrYRgy5mfJ6SejpF9OkfJ1VTDX?=
 =?us-ascii?Q?LQKYQ9nOl3vzHCdGV/VdQXsgpgg4hljnEHs9N0o6eKGeFabVlKApVN5JwlUB?=
 =?us-ascii?Q?o8wbB/Cre24B7jRPpu75BKJmrcWgT/rZOaQee+x98V1Mnp3z0W1jhPTCS94i?=
 =?us-ascii?Q?Rzq32sNGy5PeZ9xW9ROoUVWRIFvuLvWXtSohADJl6yFBd6cgIWv8yWRSoEpQ?=
 =?us-ascii?Q?iKzGzEbvGCK+C49BRuY7iM0rKkSuvX0EX9oHuI+2URuhywgo63eYaZ+GgArN?=
 =?us-ascii?Q?BsDgNknAv9Ay13BpBCl12oLr/Ndso6Mg0Wkt/HkhbtI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3eefb8b-3bf5-4cd3-a7bb-08d8b5fcfc89
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 06:49:04.4961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18xfCwTxkalWSzAZFOjjRAqlcKECrElFXbzeXk7mmzMJvSNDI6WNSyNsi9SgURs7IAOnitnUT5h1X21SHkBfiVWpxKIipgiIdeVB0fHq+UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB7029
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-09_13:2021-01-07,2021-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 adultscore=0
 mlxlogscore=939 priorityscore=1501 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101110039
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>On Fri, Dec 11, 2020 at 10:50:53AM +0100, Pawel Laszczak wrote:
>> This function uses "One Function Cleans up Everything" style and that's
>> basically impossible to do correctly. It's cleaner to write it with
>> "clean up the most recent allocation".
>>
>> Patch fixes two isues:
>> 1. If pdev->dcbaa =3D dma_alloc_coherent() fails then that leads to a NU=
LL
>>    dereference inside the cdnsp_free_priv_device() function.
>> 2. if cdnsp_alloc_priv_device() fails that leads to a double free becaus=
e
>>    we free pdev->out_ctx.bytes in several places.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Tested-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/cdns3/cdnsp-mem.c | 36 +++++++++++++++++++++++------------
>>  1 file changed, 24 insertions(+), 12 deletions(-)
>
>This file isn't in 5.11-rc1 :(

Hi Greg,

Sorry for the long delay. I had holiday.

All CDNS3 and CDNSP patches should be added to Peter Chan tree,
so I based on his tree.

Regards,
Pawel
