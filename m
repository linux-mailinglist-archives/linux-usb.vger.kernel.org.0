Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F924963A9
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 18:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240892AbiAURS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 12:18:26 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:36846 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231512AbiAURSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 12:18:25 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LBjcfG029931;
        Fri, 21 Jan 2022 12:18:19 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dqjeurf06-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 12:18:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnshBIAKFoqeyGnJBFROUCA5uNK+EJg6ubbVbhPHeFtEK+gMgQQe7ORfia/wF9bpp6gZJbTHfMuR7L/Aqsmz71BVy+f6LaEwD1e3yYP2C7kgNNX8IYfK56sWfaqQH4pHxDfxEZu6IxZV5rnXzS7W2g2lsEaiShi/Rr+LGAC8VG3NuE3W39TUt92U2lzuTp1k9WKSfZ1lk/vL6qVoTnFcDQgc1ABwblynYJD7I94aCo03UxbguWkJ2dapILq0VEPCAgYEFjswUqmICnAYbXseoj7iDSEIAiSWSVNHS21G151lYSAY+YIkVUwgfFu8QYOAv960t+n9fv615EcwCrQiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3wcwUkZo05oKBxZD5omCSx4N6vH631uPV1r7cCp82g=;
 b=kKVFFOap+YZdRNw50LkjCXj7IsJuGI2x5vKQWGQMC+T5buvV0Ue2k7df8JhsW4zeM1mln6HoWrnDxqL7PBGuAmMI17VjrqVdXPmgH48DdGtIenWbYKaHL6EsOdEVKJ/udttL0GqgvN6faYDuXd6AzMxvgW72p5/PFpPHkytXvrLF/5nZkMgGDqj8TAQYSRdgb3Z2usc0POugHZ7cECfS7WSUXDs9Cnp/JYKEGyo1GFLBnX1BABdiTt82h/6x4tUofFsn7lygl918orIxNb1SlYP6mmJAgraeBevWOG967rcF4wZVG4shh9nX7aFTIQ8fphnqmmMVcS2PTgQZ/7LmzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3wcwUkZo05oKBxZD5omCSx4N6vH631uPV1r7cCp82g=;
 b=ZSg/J38T7t68CfBTSZLM2dSI42g/I6XXZycdX4F48kgmFbCYpY6I6NXRPYpHy9rbfCfWJrxvPdCtphur39hc+4WKhBOwiVqNonSs79V9DopnqFDbl3f3/GlQKYOPvgtak+U67ycI4Wmt5XK6Hlww80z5BPrCJqX15EFkxQ57LXQ=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB5626.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:60::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 17:18:17 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 17:18:17 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH v5 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Topic: [PATCH v5 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Index: AQHYDiBc2nQHs7iPP0uBNyWhFkHlHKxtG7iAgACdyAA=
Date:   Fri, 21 Jan 2022 17:18:17 +0000
Message-ID: <f7750dff636e2048fbbfd57ef7b6030421ea92af.camel@calian.com>
References: <20220120170818.1311306-1-robert.hancock@calian.com>
         <20220120170818.1311306-2-robert.hancock@calian.com>
         <849bca28-b52a-9cdd-034d-75fcc47da32a@xilinx.com>
In-Reply-To: <849bca28-b52a-9cdd-034d-75fcc47da32a@xilinx.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f21f0a0-f5e6-4c28-aaf9-08d9dd0203d3
x-ms-traffictypediagnostic: YT3PR01MB5626:EE_
x-microsoft-antispam-prvs: <YT3PR01MB562681CA7C267F9C476F14FEEC5B9@YT3PR01MB5626.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmS5DqnlIfTS5AV1xlkzmXAUQNq5tUisRMwPKVphIMwq+DeRD6RIUPBFFjDEj2qJmpgfFVsJ6ZY1pTlrCGJJxxJBmFKPwJNvD4iFY85xf4JXexOgRv7FNTzw+6oOSBYEhTILefXe72PEyC/NwZBOZqAAHK0l/+fQBtD3uBMDPJ/9LfqktPbdcvTMNo7zTPdbjYvVQuBsKiFjjWxhYtNQIN9XexQPRJWppgRbZ/DlZb1sFrjlJolYi1DGCxJWkoO7oLEHzLsfRA8Jvp/68Hmh4Wz8n46os920TDc+NT1i1jWG4Hi39mLMrxcSrZhitjIcZXLe/DOP/Bhl61zyvDJQyj9aXOjKOuG+/PWbJqpdwHI4yqgiXY+PHp+b+Vusy9YJqfSmnlfJsuckVFCF7aDFJbIOMQZuijuinL7DNw7dMp1rHgjS+hoRQYMbroug3kcibMbObnbYGzIcxCc8N3qkI9c4E8eXwI/dXgOZTtCFnWgG+g8dXqZW0eVLMrKDnhy32qYlJPNQyWBOQLrssBKaO73rSJn7/dy1CXXLVdULBffCiBx9AoE+1gsFnKXhSccg8qS8D+cTVANG2sdEL/FHVGwIjqz18wvQbO48hGNs+X9UpFczgl6rsIGJ58t3125hLLxXRcEtxyxhnBY4GlW39VKV7uhI3p7eLpGcTUwQDofpUFEgDreRemftcK9l6+QGVUjuYR5zymfq3YQXkKg6nKQ1TnDRRJpDcYImbp5fG4wCA9GXf7Cqe31svCCJx3Ve7rcl6nFlNIwExLFggkXfa2MYP4NjgVzZYJmNsPfgW5sS8a2lVKdmrwlw4xpaSNOKDjSFPjyaHpGKAkLCWP46Ekmsmw4ffqVKdhjxY4NSS3o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(110136005)(66446008)(6486002)(15974865002)(6506007)(54906003)(508600001)(2616005)(36756003)(2906002)(26005)(53546011)(4326008)(6512007)(122000001)(38100700002)(86362001)(8936002)(44832011)(76116006)(71200400001)(66946007)(83380400001)(38070700005)(64756008)(186003)(66556008)(316002)(5660300002)(66476007)(8676002)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjczajJwK0tYbldnSzJLMVJBdnU1bDZrN3RBT0Jjd2p0Y2NlbVBWTXc5bEJm?=
 =?utf-8?B?VWZhbjExQ2pNdlNWNml4R1BEcjVUQkpmOE43dDdBR3Nva0NBUTIxMU4zQklB?=
 =?utf-8?B?MHNRdlk2OUIvQVVzaU96dHVDTE0zdGVrUlFtOHZhVTNtN3VkcmJVWmdBY3BH?=
 =?utf-8?B?M25UQlRKa2Q1elJwVDZEQU5lWEQ1ZXI5MjgvNEdVWDRoa2ZrZUVIQWpBQVhU?=
 =?utf-8?B?c1gzL05iY1ZubTBYNW9xR1FXc3hSUndwa3NZSE9VclhITVJhcVZhcVlueFBP?=
 =?utf-8?B?MEd0b0tqWGVjRUxta2xLelhka1F3c3BqMWtsUFNZN0d5NFQ0TXhMNUowVnox?=
 =?utf-8?B?TGJuWWVZbE9GaVd0VUlIWDhXNkt0QWZ4aTRKS1Q5OHZZSktWb3JTRUd5NWZO?=
 =?utf-8?B?ak16bDZNM09JT0VWNGFUbnJ6T2N2WTU3aGFlbHBmWXpzVTZ3cUdNMmRRVXUx?=
 =?utf-8?B?Zi9oTzEwQmxRZnBodEVwWktNQnZxSGJ3eUtpUzVmZlNzSExBSjNLam1XWVRa?=
 =?utf-8?B?Y2dZNkJTZllLaE0wUEtJYWNpQWtCRExmKzF1RDhKYWQ2c1draWdFL0NTRjBX?=
 =?utf-8?B?WUd6THV6RlRINGFuQXdEaWF4Vm9ZUDcrb2Y0c09IdXduRnNIU28xWlhOK0cr?=
 =?utf-8?B?V1g3Tkl5RGhRSGpNK2ZvRWpMejRvSjlaQ3VHSkdwcUN4aWlrTm51Q3NUU2JQ?=
 =?utf-8?B?SjFCQll4N0pVc21CN0dkTUhNaW83bUVrbXlOcEc4a0s3ZEZNeXhhOWtLclNB?=
 =?utf-8?B?Y3Q2RzRiVWxTRkkzMHNxTTNDZHFkSXgxV095Q2M5ZWQ2TUkzSmcvdlZZUnY1?=
 =?utf-8?B?L2I5eisvOFh5dXlUdVhpT1ZFOUZJZkhjZ2hiejdGcmtraXFNRVVINkRwYW0r?=
 =?utf-8?B?WWp5TFpaWmt4YjFyQnVsNjRpd0s3T2ZwdExMMnRuUDJsa2ZOSEoxOW5rVnBt?=
 =?utf-8?B?WXpRMnlvOEdySU9xbnQ5T0s1VnZXQzl6TmVaZm5lTGNWOEh4SkY4T3c4K2do?=
 =?utf-8?B?elV0ZEJMZnFvSUp2M2ZXYVFBWHN2Y3B6dEYzVVdvMjVJUFd4Q2lYVFRnbGdD?=
 =?utf-8?B?Uzc2TngzS0F5T0dCT1U0c092UUt3TXpZaU15RFdGUGQrUzUyUnRJamgzcFRJ?=
 =?utf-8?B?QWhjQUhLRUwzUkNrVkJZcFh1Nm8rdUtSV2FGMnkvWVpkS1hGdjMwM09hRDE3?=
 =?utf-8?B?cnZpM3Y4TWJOcm1HeGQzM1ZYbEk5YW0ya2Ixa09vd1l4ektVZmozL0FrWWh4?=
 =?utf-8?B?cTNaMkdEMnFQWXlKTGhqS1lNMEZnUkxVV0t6SHp4Q3hheTRKenBXUWZmSVBQ?=
 =?utf-8?B?bVREaXBSRGpkN1ZJUkRHa3B5ekRzZjU2YW5DM0UxQmRINW94L1FxTThhZVRn?=
 =?utf-8?B?Vkp5c1pSMDgyS2lPZUFEQy93cnF5UU1hV0tOcFVENDZmVUt4TzV0ak9Lc3Rp?=
 =?utf-8?B?UzF0ZndnYjNYaXh3WSt1QXdJSnVFRWdNZlJiZlJEbjFnZnFjRmJlVW5XbGxa?=
 =?utf-8?B?RTBLVDQ2b0J0ZkozS0JiZ0Nsb1ZMamhobDNUY2FVLzYrUkozYmUrYTRGTUVP?=
 =?utf-8?B?SVhtOEdiWGMzOXRaVnFoNmxJVUhIdjczNjFzRElJWUs5YW1oSkE2dTlMRTQx?=
 =?utf-8?B?YmhDUjg4RElhV1BRWVd5Nmh0QUdSU0s1TnZKZWlCQ2NMbTk5TWxhclJzb2NX?=
 =?utf-8?B?RDVNR3FPa3gvTzV2UWVjOGZTZDZMQU5IbDJlbmd6Q0t0UFpCcjZnQUpIWHMw?=
 =?utf-8?B?YVF0SXNJN1kyenJWRDFvQ0ordEhONHBQL0g3S1pjYkVJaFVmc0xocUh4azdH?=
 =?utf-8?B?ZlV1VmV6SUs3MFpIc3c5djhvbzZhQ1h5Qlo0NE5TMEJQRFR3aUQxcmZMVjBy?=
 =?utf-8?B?dDJOZ1pVK1l1VzJoamZlYkVuRXJMWmxFWVdyZXFWLzFvTzR1RXlING5UOWxn?=
 =?utf-8?B?cmp5Y2VHaWJmQjhzaHpLSFRhMnRDa2ZjRWI4eTlKazN1L3RvUTNUUk9ockpj?=
 =?utf-8?B?RXlkQlY5aENSRlJWNHVuMzV2MFNIQjduQXBoRGlQMnI5dEJPczNZNHpYSWNs?=
 =?utf-8?B?ZGlLVnVNMjlmeUFEeVU3cmdQY0hmTFIvdngzTFdFZHRYTFBEL0ZlclltM0Qx?=
 =?utf-8?B?UmkyZlcvSVV3eVBWMGhKUlBjcUFhTVhaWkZ3dkJEa0dQWXhSYS9lKzg1bDdi?=
 =?utf-8?B?Nkk3QWorWFVZejdwazZWbmsxN2MxelZoTjZXRlFweWloSk9lekxXNk9KM2th?=
 =?utf-8?Q?KqKVROMh0cOpBaVwUtWtPmwFj3kCbWch4lJpkkhTMQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ACE55A9A4C74547B0851694EC0D86B7@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f21f0a0-f5e6-4c28-aaf9-08d9dd0203d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 17:18:17.2731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o27C/Oz+iJk1QA5lavWol3m9hMiMv/kjKcWeFke2XZ5P6wpESw5mZM4Y0uHimEj9BEOB35l4OvJQeTdrnjMpBC016R9tBASGCH3ZfBzHp+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB5626
X-Proofpoint-GUID: at7w0JToUmXD7Jz5cIZBiEEaYSxFuAjk
X-Proofpoint-ORIG-GUID: at7w0JToUmXD7Jz5cIZBiEEaYSxFuAjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210113
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIyLTAxLTIxIGF0IDA4OjUzICswMTAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6DQo+
IA0KPiBPbiAxLzIwLzIyIDE4OjA4LCBSb2JlcnQgSGFuY29jayB3cm90ZToNCj4gPiBJdCBhcHBl
YXJzIHRoYXQgdGhlIFBJUEUgY2xvY2sgc2hvdWxkIG5vdCBiZSBzZWxlY3RlZCB3aGVuIG9ubHkg
VVNCIDIuMA0KPiA+IGlzIGJlaW5nIHVzZWQgaW4gdGhlIGRlc2lnbiBhbmQgbm8gVVNCIDMuMCBy
ZWZlcmVuY2UgY2xvY2sgaXMgdXNlZC4gRml4DQo+ID4gdG8gc2V0IHRoZSBjb3JyZWN0IHZhbHVl
IGRlcGVuZGluZyBvbiB3aGV0aGVyIGEgVVNCMyBQSFkgaXMgcHJlc2VudC4NCj4gPiANCj4gPiBG
aXhlczogODQ3NzBmMDI4ZmFiICgidXNiOiBkd2MzOiBBZGQgZHJpdmVyIGZvciBYaWxpbnggcGxh
dGZvcm1zIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNv
Y2tAY2FsaWFuLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxp
bnguYyB8IDcgKysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXhpbGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLQ0KPiA+IHhpbGlueC5jDQo+ID4g
aW5kZXggOWNjM2FkNzAxYTI5Li4zYmMwMzUzNzYzOTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LXhpbGlueC5jDQo+ID4gQEAgLTE2Nyw4ICsxNjcsMTEgQEAgc3RhdGljIGludCBkd2MzX3hsbnhf
aW5pdF96eW5xbXAoc3RydWN0IGR3YzNfeGxueA0KPiA+ICpwcml2X2RhdGEpDQo+ID4gICAJLyog
U2V0IFBJUEUgUG93ZXIgUHJlc2VudCBzaWduYWwgaW4gRlBEIFBvd2VyIFByZXNlbnQgUmVnaXN0
ZXIqLw0KPiA+ICAgCXdyaXRlbChGUERfUE9XRVJfUFJTTlRfT1BUSU9OLCBwcml2X2RhdGEtPnJl
Z3MgKw0KPiA+IFhMTlhfVVNCX0ZQRF9QT1dFUl9QUlNOVCk7DQo+ID4gICANCj4gPiAtCS8qIFNl
dCB0aGUgUElQRSBDbG9jayBTZWxlY3QgYml0IGluIEZQRCBQSVBFIENsb2NrIHJlZ2lzdGVyICov
DQo+ID4gLQl3cml0ZWwoUElQRV9DTEtfU0VMRUNULCBwcml2X2RhdGEtPnJlZ3MgKyBYTE5YX1VT
Ql9GUERfUElQRV9DTEspOw0KPiA+ICsJLyogU2V0IHRoZSBQSVBFIENsb2NrIFNlbGVjdCBiaXQg
aW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgaWYgYSBVU0IzDQo+IA0KPiBuaXQ6IHRoaXMgaXMg
bGlrZWx5IGNvbW1lbnQgZm9yIG5ldCBub3QgZm9yIHRoZSByZXN0Lg0KPiBZb3Ugc2hvdWxkIHVz
ZSBtdWx0aWxpbmUgY29tbWVudCBpbiB0aGlzIGZvcm1hdC4NCj4gLyoNCj4gICAqIFNldC4uLg0K
PiANCj4gTQ0KDQpZdXAsIHdpbGwgY2hhbmdlLg0KDQotLSANClJvYmVydCBIYW5jb2NrDQpTZW5p
b3IgSGFyZHdhcmUgRGVzaWduZXIsIENhbGlhbiBBZHZhbmNlZCBUZWNobm9sb2dpZXMNCnd3dy5j
YWxpYW4uY29tDQo=
