Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2460CBEC86
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 09:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbfIZH2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 03:28:31 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:52122 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726521AbfIZH2a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 03:28:30 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8Q7EE5J018726;
        Thu, 26 Sep 2019 00:28:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=D7BC7p1ogjuneSW8WgpfZLs9hmmqKrh6kL1HQul0ESA=;
 b=OAcYmC7FDBiXfQdyjxAtu4WZwFS+E6BbGxzH2c0VHKUhopG/w9mSFyx3OyFdNd4+nDFc
 x1q4JHixzRfChCRlsmfGJpiTGbuAEuib8NtrRl1ouzINEzTHG7tuAoalDhMfPXL2hTar
 hddFHj2w/C1T8NvRIy5Pp+JCzbYyX/+cOvopLXCEXUKHDUIvuuSEC6ht2gSemkjb+t8/
 NThHF98jYFuEd8QdGKbV258TI4RTeLCv4jlvFlJ8s4Gaqol6AeSjg5mUEgFAtiBuY8u3
 AIZWlSabanvWc4abXLdq7A0Wjs0nAWa+X2UlU78afEM8KbRyog/kVnx/3SYaFajeYli/ 1Q== 
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2056.outbound.protection.outlook.com [104.47.40.56])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2v5fewv1sa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Sep 2019 00:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhKrNLDSVQUvgcBXL5qThBIiLMmMvaF7WdKMma1DPOuvEAaXkNqyMZ9FsA53xUSNXQrI6DBhKUmIoNilhX41TCHdFz4A0DueFG4qr7ptcud6PZ2eSi0geHPIzG/4ISGin9uxGG2FMPblecXuOXeIIJGvGbNZrZHMzkhVOOokKgUIUQjfqV+y4HPHnEMLecW7Cg0QLIWswyrCihusDXTUqHMWvrcW8TmGMy0ESq1a+v8gbnj4O4HPcEFyLtLoo7JPdr2+OReK5abeuCaN/cdoiRsWTtYGEvQLs+AFl0lNqVkdFY5obeGL2rNy1ADp7kxwqlO+aJghPP74ofQWD+nHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7BC7p1ogjuneSW8WgpfZLs9hmmqKrh6kL1HQul0ESA=;
 b=aPDvfPifs5rYR6IhLJbeLEEd+v7dCQ2Mn8nA7f1NOvWME9rbryUWFZQGh6eK2DbQ8Vet5thbk6tH8GXqOGRCdhKT35LyyoQCDeJAwmxyy8uDguMTuuKPGj08mhqEyQScethFlfepOtOtH/1W1nWkFI58bNORt3qj1pA5tgdK2ZIZnUn0/XoJXMvDRMAaWnuHZmqS1vJSkMBOelaDlPgCTWdESfZh5gOmqxf4WAOjjiMW/VQ3+gNEggCSHcp9Dwj74DL0l4obVy13hjt554YdBpe6KsbwKfs9X0JWFbP7tYLY/ZqSBa6Dbhf2z/fxw8/2rNZjQmJakraq1f2ZBy36jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7BC7p1ogjuneSW8WgpfZLs9hmmqKrh6kL1HQul0ESA=;
 b=k3Bh8tFdQbertwl9CPbqQH1F0rG/T4svvXN+mX/YYjjjYbubIPVlr5fWqV6CAv1Tc8Je2s1oNe0resKA4fCBoCCHuZYWmMFtEOHpIOHKk2Bm71DA3z21j66K3KUz70cvkizU3ceYoiL26DE4BXddpBrjJztYhUKpbAP4UHpIyBI=
Received: from BYAPR07MB4709.namprd07.prod.outlook.com (52.135.204.159) by
 BYAPR07MB5560.namprd07.prod.outlook.com (20.177.231.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 07:28:18 +0000
Received: from BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::e0f2:de8b:4b8d:e296]) by BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::e0f2:de8b:4b8d:e296%7]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 07:28:18 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: RE: [PATCH -next] usb: cdns3: Fix sheduling with locks held.
Thread-Topic: [PATCH -next] usb: cdns3: Fix sheduling with locks held.
Thread-Index: AQHVdDgdnM+ZRyeqOUmkCZmj+QBAUKc9jhYAgAAAasA=
Date:   Thu, 26 Sep 2019 07:28:18 +0000
Message-ID: <BYAPR07MB4709EFB87B48CBD5FB2E3463DD860@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1569481230-14120-1-git-send-email-pawell@cadence.com>
 <20190926072316.GA1581871@kroah.com>
In-Reply-To: <20190926072316.GA1581871@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 363eda10-dcb1-4f9d-2708-08d742531a64
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR07MB5560;
x-ms-traffictypediagnostic: BYAPR07MB5560:
x-microsoft-antispam-prvs: <BYAPR07MB556023F7806208BF6EF1A908DD860@BYAPR07MB5560.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(36092001)(199004)(189003)(4744005)(99286004)(71190400001)(81156014)(25786009)(76176011)(7696005)(14444005)(71200400001)(8676002)(305945005)(81166006)(14454004)(6506007)(102836004)(6246003)(4326008)(8936002)(3846002)(229853002)(256004)(66476007)(64756008)(186003)(66446008)(5660300002)(2906002)(55016002)(9686003)(66946007)(316002)(6436002)(76116006)(26005)(486006)(6116002)(446003)(476003)(33656002)(11346002)(54906003)(52536014)(66556008)(7736002)(86362001)(74316002)(66066001)(6916009)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB5560;H:BYAPR07MB4709.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WOurCad/PFRqW2zlRGOFQSRqsjPaLM14nvypVE/Ke3rBF1/MvHSPhxVQJyX6Ze3iT/7eflZRZuvTY4m7QzAHLCWPZUgKzNijPwe1dI/bCHTcWNIPOpGiLjS2JcaPl9Y7O+qXxxTx2fJrtFlD8ChO/Vl47mjWIwdqzQYliZUvUbBswqgBDGpUNQwvU7ycTf9IZdzNcR8DzKbq1XUWaOEm6QnNGQrz9tOm3ZkLFKILqszlKoqNlJ2jpqVSUqz6HfTGKkkWIjVU2DCkwxPsHWNlLZBhMFyEmcIUxMgE4CC07K+sF28jr51JygR1f3Lasqn2AF4aXnWzDMcSpdg70Rgs6BIaL8Qay8Eyi2wO92o5Ugvxf0z+w0xT6z2UJjyLBYkOhJsE1awM+8ZwTBdtMbz6aUL7JV/wpih2MLJSBqJEsAU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363eda10-dcb1-4f9d-2708-08d742531a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 07:28:18.6835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGhEO6Doqnqc+JtL7d/VdUG6ZVh3lLmG3LgEBHNFD7SIUT4LqGt4FrZ0q+hx4vQIVzdQsrE1bbE7zcvP95OpRYUT7ublnCutMv3UvWTkIfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5560
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_02:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=711 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909260072
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=20
>
>
>On Thu, Sep 26, 2019 at 08:00:30AM +0100, Pawel Laszczak wrote:
>> Patch fix issue in cdns3_ep0_feature_handle_device function.
>>
>> The function usleep_range can't be used there because this function is
>> called with locks held and IRQs disabled in
>> cdns3_device_thread_irq_handler().
>>
>> To resolve this issue patch replaces usleep_range with mdelay.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
>> ---
>>  drivers/usb/cdns3/ep0.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>Is this v2 of the patch?

Really. It's the same patch as  previous one. I added only=20
Reported-by and Fixes.=20

Ok I will prepare the next one :(.=20

>If so, it needs to be said so in the subject line, and below the ---
>line describe what changed from the previous one.
>
>That should all be described in the kernel documentation, right?
>
>v3 please?
>
>thanks,
>
>greg k-h

Thenks,
Pawell
