Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C16C4CCBBF
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 03:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236875AbiCDC1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 21:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbiCDC1Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 21:27:24 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB6C5BE59
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 18:26:38 -0800 (PST)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CAFBD40815;
        Fri,  4 Mar 2022 02:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646360798; bh=KBjBaB0pHtPrWhp3Mop60waguZsGLXPMFdo17vGch8M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=l0oFuc4kZVNnuz3dbJua1uKzTK+gK2WsjhrZsE6coHZsfb1qFALBmv1TfX3wfcEci
         JC/iE8JUdB47UYKHu8sUQw/+Sl8PUWrcDgkZs7O9H18D4K880EZPLzSq+uVH+0ZBYP
         RwwEoxFREtBrn1jYSiMpgJI2THb5ZdcZgpUf3odiKn13Lmw65ULSGcI8pJt4T7SZmo
         Rjzw/igegi000roE1lMT9MPs5c6jHMaT4yDGu/5NRhPqhXRljbHuaV+ek13b8zVQT0
         fPXznMXUiOrWX4LEBKrrPd5rtLlGj+YO+F/oiPzMMFc9LECpW+fXV/7nlit/0mzE2B
         y9k2+cEbaG+tQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7E6D1A0080;
        Fri,  4 Mar 2022 02:26:36 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 07588801D6;
        Fri,  4 Mar 2022 02:26:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GOM7O7gJ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVY0sDe71ezR2f6qo9Axv8aBzlGhKK14dHf7E8fI9jb7Lyvx4ddxVyiD75iO19YlwV9VUIEAqNE8WPNz8m4EmYMeNV0Jhg71e7b3vY+83K3wxQ6jIJsZp19qOzr//n6JE3f0nzt9nlLahgGYdqYkeWDDn5pnkhZ7JsCQJXiN0AxvG3kZ7TaebAlWwB734bUDAOAjUke5ZSBxVe8b4MSqDY01hKjCdqYCKNrAUcmq+rDUiglofp685ciTf45Dm0czYXxMbpgODY1MXFjRWRMlhSKolG0jteH7h3weFcjqNUmUauWkJef7PSxk+5OzVxdJA4foqa8iwFGKjbxg0jO+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBjBaB0pHtPrWhp3Mop60waguZsGLXPMFdo17vGch8M=;
 b=na0v2CGIenViVUhSU1802uGRi39JIthiMvztPxyD2M5M/m9qxP40zpYbsf0SBBOuHiBVGzlcOp9ha3U4SqSmc631mTy8YrlTgWlboiq5W+AUFYTE0nUKQnx0LeCZ1P8beP/8WkA31th+GQM+RwNS6GNi8UvJV7krnp0nxvmmdzEaDnYD5xEzA76ZVa6P2ON27uLaMg/EDhdGEJbBPWmS50EGT2ONnaNz78No78ILDLV5GiVxRPT+Yj2Mui8T+9bhvN7s0HGwQorRgZ4J5exNrUAK3IPRnk89v6RoK9c/Pg2VBIeeOiaaK9RzjlxuEMzf5fZRLoRzYtZbuvQ33IWf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBjBaB0pHtPrWhp3Mop60waguZsGLXPMFdo17vGch8M=;
 b=GOM7O7gJN2sVztpP0hsN/D2lS0aTe4kdnlAA6lpoEBcuMXOks2sH1MnC1mGfFu3x8eU43Zify6/MlrBghtZYzX6ljbswcc+VEo5VGg8qrbQLx1meMEb3ImBdH5O80EfjOmkkRVFFAfsbry6+YeQO6oqhpLYbNrppyyNwdrMVwCs=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by DM5PR12MB2566.namprd12.prod.outlook.com (2603:10b6:4:b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 02:26:25 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::19df:84b5:e723:ac84]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::19df:84b5:e723:ac84%7]) with mapi id 15.20.5038.014; Fri, 4 Mar 2022
 02:26:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2] usb: dwc3: gadget: move cmd_endtransfer to extra
 function
Thread-Topic: [PATCH v2] usb: dwc3: gadget: move cmd_endtransfer to extra
 function
Thread-Index: AQHYLwA28eHF5jmI/0SbaKJ6zKUGAqyugHwA
Date:   Fri, 4 Mar 2022 02:26:24 +0000
Message-ID: <d2cba6f5-6de8-f5f6-f639-9f4a384d1f77@synopsys.com>
References: <85e85927-82cc-fa8f-86a1-d9a5205bb7cc@synopsys.com>
 <20220303131121.3557729-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20220303131121.3557729-1-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d600b9c3-4503-40a9-814c-08d9fd86617b
x-ms-traffictypediagnostic: DM5PR12MB2566:EE_
x-microsoft-antispam-prvs: <DM5PR12MB2566404AA939C0F04EA75FA6AA059@DM5PR12MB2566.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HZcrCXjISQEV0P38ff0Yixv2EkUvARynIWQ1HpA9Q2afsoVbZFhzdIaEQcIVCmqSR/Ww1PSw7HNXpUqCA1I/MYz2KLHt6iDc25f9buRpQGKykTuY1f5A899e8hqEEO66DYd/ar1UF7HGHG7cYO4wJZHK+98LkRVmICvaPVdGy8IJ5QZGS4HLNW6/fUDbmKCD6onS3ZbftMPVZ+gO6kysv2IhU2Nd2GHKALMASkW6pKt0wnBIG7ulhwopsduJ1U0ge4vJxKzFnFAImssbDVVi0qjy6NugK3JMBRM9z4rhITMOutnOEUAt2vlRq6bPb6SSPItjfUljUaaSyB8xUX+OxXSUGzWlg5Nq3hH6Bx21JXSmYLLsUiEokwscbNexauXvzXhwIZ6WyAKuY8kt3BkcY84RDGVgu3RFNpefc6c0ubrGJUYJb7OJSYayKKaUUX+50tK1RPpxa1MB+Ws21rw/vqSmwc1AXr74lp4dyy2/shHOObde1XNUjW3UwD+oQDaanfMMFUDsK+FQgWiPe4Ic6ESLPsEZPxQhhPB19r2X+aaBtkIUFim7KF4es6XXS4cPUVeT/JACkxYER5AHRoUQZViPzkjk0hst6gZ1SnIjQ7BVJQFMMg+zlzYig/jL6fj6+DAdtjQGQcLJPr8x+Yg2mktBjK6+RXkNRiXSIVVYz7eiV8MLbNVkLPw/5QbJrin44LhOj7oH9Bq2TJzJ9cRZEaxAzQ37o9bPGUg7Wr96kjK6Yq0RsBrNqRqWdPwdrNoaIO1XyxOrwR71/SFt6FCh/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(2906002)(31696002)(8936002)(38070700005)(122000001)(5660300002)(38100700002)(26005)(186003)(2616005)(6512007)(110136005)(54906003)(6506007)(508600001)(71200400001)(6486002)(36756003)(91956017)(66946007)(66476007)(66556008)(76116006)(4326008)(8676002)(66446008)(64756008)(83380400001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZENsbG5SMm85MEdvbXpRQmNydnF3QzFvZk9rUklXRlpXRy9pMXJOamRISkEz?=
 =?utf-8?B?TGE5cXJuTzFsK2V6TTFxbEw1OEkrT2R3bmJzZkpCRkJKSUdqanNZUXhQOCt2?=
 =?utf-8?B?V1V5NDI0VndocG9kdzNmbkFMODJjNW5JQVRjdWtYeUxybWhnSkNHUFZDYnVY?=
 =?utf-8?B?QjF1OWIrOGFZcmRDNm9pOFBXc3d5cmJNUVh5S2M2SitrcHg5VGdrblYrS3JN?=
 =?utf-8?B?dFp6ZFNQQVNKWnE4ZnFublhlZjdyNm1yMjJXaVlDOW15VE9LMXg1djRsWFFn?=
 =?utf-8?B?K05YaXIvajl5QlcxNWlnY1NYbTNoTG5aRzdLUGtmWjJ1TzdJUGNQL1hJZFpN?=
 =?utf-8?B?d2xWQWdaSXVWVDdWRjljYUtSQ3lIYU1adE1ZY0h4alJiS0lUWGlMRnY4OGdm?=
 =?utf-8?B?d1FLSjBjYnBvM1dVYzhNeWpCWjhZTHZOUG5DUEdSTE94dndJVXM5NTBGRnNE?=
 =?utf-8?B?OVNaT2lDQnhkVVJSVTlrY0xzc1Ird3IxQmJWeEZBMkZYMjZQK3NMUXB2em5s?=
 =?utf-8?B?OVBXWkhYRkZySzhFVldFdCttL0xGa2lMWTdHZjV3cCtVYU9UWVM0VGU3ekhB?=
 =?utf-8?B?b2tnSVRlejVYU2FQWGRPNll3SlFjSmlDSTZhL0UyN01sS2tiYmtJRVdnVFFr?=
 =?utf-8?B?MkFrZGs5M0RvSm1lY1dLaEE1ejIwU2FyV20yR1dmNHVxbXBlalRGOW8yQ0ZX?=
 =?utf-8?B?RkcyK3F4aS95ZUpHUzArTkhtTDNHMlBwZDVHVTNOaGs3L2VvZDdobE1kZVRX?=
 =?utf-8?B?QXAraWs0VmVxRWFOWVdockNjODM1dXd2d0lsNUlCazgzcWxQL3RrNmc0c2RC?=
 =?utf-8?B?NGtHK3ZBeDBTNFFURW5mMGN3UEM4dUtENFJSUnZuTlJpMUdXUHhIU2xDcnc3?=
 =?utf-8?B?WnByb1VrK05JRnEzVHhNbDVqSzltZFd0S1JJOFV4UTE5d011eDZBUnN2a2tI?=
 =?utf-8?B?bEpvWCtyT2Y1WjJBbnJTUmduZ2tBaSs3QXdReWNweWJVK1NPUjd1KzFxRGlU?=
 =?utf-8?B?RHZuY2JiVHRPeDB3QXRyNGplVTJnWHNtSmUyb1g0Nm5hSFJkWU01QXVnTlMz?=
 =?utf-8?B?ZnFSSlNvZ2FkY2VUaUFSZjJqaDJsYmtKbmFaVk9YUWQvVjlzNFNibzFTdS84?=
 =?utf-8?B?Q0ZxMVY5SnR6SjNGQjBrTGpuaWUvZTE1L1Ayamo1cmdMSGlkRVlhNStXdW84?=
 =?utf-8?B?V0s4TFdMNnh2STM1WnFla1ZGc2ViY21HMEYzK0U3VFNNM2JwMmRGS0I1a0E4?=
 =?utf-8?B?SE5OMitQYmdGcVlyc1ZCZHN1MVVYN0xISFF1Q1pTVTFhZmxzZVNDcW5QMkJO?=
 =?utf-8?B?cU5ZVnF3Q2RqNWdtUVl4ejR0RDFwVzV3aTNBS3pySXhPdWNDMzZ1eC9ka1ln?=
 =?utf-8?B?c3N2ZFYraXZySG5CSkxIVm5UODR5VWVSZHJZNkR3MVVDbjhKY1MvaFhWejA1?=
 =?utf-8?B?STdzazhKTFY0Q0NEMXlLY1hhd0t0Y29iWDhqbGQ3cVYwZG9IZVZYc1dFNGxC?=
 =?utf-8?B?ZGlBc25ZaS9xYVFtMEoyQ1hCN282ckpzaEJzdjlGSWZvZ0s1MlN3QVdaKy8z?=
 =?utf-8?B?WFNybmJDWmhMOGlUVG5IUS9ndlhBZkdLdXV3WEZheWNhdWM3c05JRnNXSHZ3?=
 =?utf-8?B?WENxVXNhR2NRUE85K01NVWFrZ1J5QXhJcnZsK044aTRMRW5tY0d0Q0tlbzVu?=
 =?utf-8?B?WmxHVDNvZzJWS0k3aXVNOHhZYkdPR2cycUZHM21ydm9aQWRTOE42Kyt1c2dh?=
 =?utf-8?B?SU5Nd25XbTJVUDFnQmhMbFMzTE5LVEVKRE5YSGlvZDZNMm5tV0JTRmlTL2VG?=
 =?utf-8?B?VVdEdEthNXZoVFBEVW8yTVY2Um40aTVoeHJjYllJSngzVWowZDBCNE1MU2R0?=
 =?utf-8?B?MFVDTnZhTGtSY3k0eGtSWmR5ejIwSjJPNER6dnNDQ2NBSDd1eGM5NkE1d1BP?=
 =?utf-8?B?ZHpzTGNTRU04dlJ0QW9jQkRXMjN1ei96WEMxZzBTRmxidXM5WlQrRVNScytX?=
 =?utf-8?B?aThLOW4zN1lEQXh0T3BGQUdvWmhrMTVPRFBXaE4vS3lEOVBlRUhYZERZRXNC?=
 =?utf-8?B?THhxcENaR0M3REZMVDFPdlFPV2RSajZVMnNUNEpZbDlUZDZLT013ZDFxRHNY?=
 =?utf-8?B?K3J2WXo3MTBjMVNZZ3JSZjU2TGFhazVzUzhBd2VSSjEwL1BSb0pTUHJZTFpW?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F769C592A78CD947B1A5689B9B94BAE4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d600b9c3-4503-40a9-814c-08d9fd86617b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 02:26:24.5690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2/Ao/aCdBrtIvFWIT3pksY11E6S+MY9vZ/RuysTdmliS9nIq+DIi1CJM1AzRdODmX2+zhovNKayRLv/W9Fc7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2566
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGFkZHMgdGhlIGV4
dHJhIGZ1bmN0aW9uIF9fZHdjM19zdG9wX2FjdGl2ZV90cmFuc2ZlciB0bw0KPiBjb25zb2xpZGF0
ZSB0aGUgc2FtZSBjb2RlcGF0aC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgR3J6ZXNj
aGlrIDxtLmdyemVzY2hpa0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQoNCkFkZCBhIGNvbW1lbnQg
aGVyZSBvbiB3aGF0J3MgY2hhbmdlZCBzaW5jZSBwcmV2aW91cyB2ZXJzaW9uLg0KDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgNjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggMzdkYmY2MTMyNzMxYjcuLmJhZGRmNjE5
NmNlZWUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTE2NzMsNiArMTY3MywzOSBAQCBzdGF0
aWMgaW50IF9fZHdjM19nYWRnZXRfZ2V0X2ZyYW1lKHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJcmV0
dXJuIERXQzNfRFNUU19TT0ZGTihyZWcpOw0KPiAgfQ0KPiAgDQo+ICsvKioNCj4gKyAqIF9fZHdj
M19zdG9wX2FjdGl2ZV90cmFuc2ZlciAtIHN0b3AgdGhlIGN1cnJlbnQgYWN0aXZlIHRyYW5zZmVy
DQo+ICsgKiBAZGVwOiBpc29jIGVuZHBvaW50DQo+ICsgKiBAZm9yY2U6IHNldCBmb3JjZXJtIGJp
dCBpbiB0aGUgY29tbWFuZA0KPiArICogQGludGVycnVwdDogY29tbWFuZCBjb21wbGV0ZSBpbnRl
cnJ1cHQgYWZ0ZXIgRW5kIFRyYW5zZmVyIGNvbW1hbmQNCj4gKyAqDQo+ICsgKiBXaGVuIHNldHRp
bmcgZm9yY2UsIHRoZSBGb3JjZVJNIGJpdCB3aWxsIGJlIHNldC4gSW4gdGhhdCBjYXNlDQo+ICsg
KiB0aGUgY29udHJvbGxlciB3b24ndCB1cGRhdGUgdGhlIFRSQiBwcm9ncmVzcyBvbiBjb21tYW5k
DQo+ICsgKiBjb21wbGV0aW9uLiBJdCBhbHNvIHdvbid0IGNsZWFyIHRoZSBIV08gYml0IGluIHRo
ZSBUUkIuDQo+ICsgKiBUaGUgY29tbWFuZCB3aWxsIGFsc28gbm90IGNvbXBsZXRlIGltbWVkaWF0
bHkgaW4gdGhhdCBjYXNlLg0KDQoiaW1tZWRpYXRlbHkiDQoNCj4gKyAqLw0KDQpSZW1vdmUgYmxh
bmsgbGluZQ0KDQo+ICsNCj4gK3N0YXRpYyB2b2lkIF9fZHdjM19zdG9wX2FjdGl2ZV90cmFuc2Zl
cihzdHJ1Y3QgZHdjM19lcCAqZGVwLCBib29sIGZvcmNlLCBib29sIGludGVycnVwdCkNCg0KQ2Fu
IHdlIG1ha2UgdGhpcyByZXR1cm4gImludCI/DQoNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19nYWRn
ZXRfZXBfY21kX3BhcmFtcyBwYXJhbXM7DQo+ICsJdTMyIGNtZDsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJY21kID0gRFdDM19ERVBDTURfRU5EVFJBTlNGRVI7DQo+ICsJY21kIHw9IGZvcmNlID8g
RFdDM19ERVBDTURfSElQUklfRk9SQ0VSTSA6IDA7DQo+ICsJY21kIHw9IGludGVycnVwdCA/IERX
QzNfREVQQ01EX0NNRElPQyA6IDA7DQo+ICsJY21kIHw9IERXQzNfREVQQ01EX1BBUkFNKGRlcC0+
cmVzb3VyY2VfaW5kZXgpOw0KPiArCW1lbXNldCgmcGFyYW1zLCAwLCBzaXplb2YocGFyYW1zKSk7
DQo+ICsJcmV0ID0gZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoZGVwLCBjbWQsICZwYXJhbXMpOw0K
PiArCVdBUk5fT05fT05DRShyZXQpOw0KPiArCWRlcC0+cmVzb3VyY2VfaW5kZXggPSAwOw0KPiAr
DQo+ICsJaWYgKCFpbnRlcnJ1cHQpDQo+ICsJCWRlcC0+ZmxhZ3MgJj0gfkRXQzNfRVBfVFJBTlNG
RVJfU1RBUlRFRDsNCj4gKwllbHNlIGlmICghcmV0KQ0KPiArCQlkZXAtPmZsYWdzIHw9IERXQzNf
RVBfRU5EX1RSQU5TRkVSX1BFTkRJTkc7DQoNClNvIHdlIGNhbiByZXR1cm4gcmV0IGhlcmUuDQoN
Cj4gK30NCj4gKw0KPiAgLyoqDQo+ICAgKiBkd2MzX2dhZGdldF9zdGFydF9pc29jX3F1aXJrIC0g
d29ya2Fyb3VuZCBpbnZhbGlkIGZyYW1lIG51bWJlcg0KPiAgICogQGRlcDogaXNvYyBlbmRwb2lu
dA0KPiBAQCAtMTg0MiwyMSArMTg3NSw4IEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9zdGFy
dF9pc29jKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+ICAJICogc3RhdHVzLCBpc3N1ZSBFTkRfVFJB
TlNGRVIgY29tbWFuZCBhbmQgcmV0cnkgb24gdGhlIG5leHQgWGZlck5vdFJlYWR5DQo+ICAJICog
ZXZlbnQuDQo+ICAJICovDQo+IC0JaWYgKHJldCA9PSAtRUFHQUlOKSB7DQo+IC0JCXN0cnVjdCBk
d2MzX2dhZGdldF9lcF9jbWRfcGFyYW1zIHBhcmFtczsNCj4gLQkJdTMyIGNtZDsNCj4gLQ0KPiAt
CQljbWQgPSBEV0MzX0RFUENNRF9FTkRUUkFOU0ZFUiB8DQo+IC0JCQlEV0MzX0RFUENNRF9DTURJ
T0MgfA0KPiAtCQkJRFdDM19ERVBDTURfUEFSQU0oZGVwLT5yZXNvdXJjZV9pbmRleCk7DQo+IC0N
Cj4gLQkJZGVwLT5yZXNvdXJjZV9pbmRleCA9IDA7DQo+IC0JCW1lbXNldCgmcGFyYW1zLCAwLCBz
aXplb2YocGFyYW1zKSk7DQo+IC0NCj4gLQkJcmV0ID0gZHdjM19zZW5kX2dhZGdldF9lcF9jbWQo
ZGVwLCBjbWQsICZwYXJhbXMpOw0KPiAtCQlpZiAoIXJldCkNCj4gLQkJCWRlcC0+ZmxhZ3MgfD0g
RFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORzsNCj4gLQl9DQo+ICsJaWYgKHJldCA9PSAtRUFH
QUlOKQ0KPiArCQlfX2R3YzNfc3RvcF9hY3RpdmVfdHJhbnNmZXIoZGVwLCBmYWxzZSwgdHJ1ZSk7
DQoNCmlmIChyZXQgPT0gLUVBR0FJTikNCglyZXQgPSBfX2R3YzNfc3RvcF9hY3RpdmVfdHJhbnNm
ZXIoZGVwLCBmYWxzZSwgdHJ1ZSk7DQoNCj4gIA0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IEBA
IC0zNTk3LDEwICszNjE3LDYgQEAgc3RhdGljIHZvaWQgZHdjM19yZXNldF9nYWRnZXQoc3RydWN0
IGR3YzMgKmR3YykNCj4gIHN0YXRpYyB2b2lkIGR3YzNfc3RvcF9hY3RpdmVfdHJhbnNmZXIoc3Ry
dWN0IGR3YzNfZXAgKmRlcCwgYm9vbCBmb3JjZSwNCj4gIAlib29sIGludGVycnVwdCkNCj4gIHsN
Cj4gLQlzdHJ1Y3QgZHdjM19nYWRnZXRfZXBfY21kX3BhcmFtcyBwYXJhbXM7DQo+IC0JdTMyIGNt
ZDsNCj4gLQlpbnQgcmV0Ow0KPiAtDQo+ICAJaWYgKCEoZGVwLT5mbGFncyAmIERXQzNfRVBfVFJB
TlNGRVJfU1RBUlRFRCkgfHwNCj4gIAkgICAgKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX0VORF9UUkFO
U0ZFUl9QRU5ESU5HKSkNCj4gIAkJcmV0dXJuOw0KPiBAQCAtMzYzMiwxOSArMzY0OCw3IEBAIHN0
YXRpYyB2b2lkIGR3YzNfc3RvcF9hY3RpdmVfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAgKmRlcCwg
Ym9vbCBmb3JjZSwNCj4gIAkgKiBUaGlzIG1vZGUgaXMgTk9UIGF2YWlsYWJsZSBvbiB0aGUgRFdD
X3VzYjMxIElQLg0KPiAgCSAqLw0KPiAgDQo+IC0JY21kID0gRFdDM19ERVBDTURfRU5EVFJBTlNG
RVI7DQo+IC0JY21kIHw9IGZvcmNlID8gRFdDM19ERVBDTURfSElQUklfRk9SQ0VSTSA6IDA7DQo+
IC0JY21kIHw9IGludGVycnVwdCA/IERXQzNfREVQQ01EX0NNRElPQyA6IDA7DQo+IC0JY21kIHw9
IERXQzNfREVQQ01EX1BBUkFNKGRlcC0+cmVzb3VyY2VfaW5kZXgpOw0KPiAtCW1lbXNldCgmcGFy
YW1zLCAwLCBzaXplb2YocGFyYW1zKSk7DQo+IC0JcmV0ID0gZHdjM19zZW5kX2dhZGdldF9lcF9j
bWQoZGVwLCBjbWQsICZwYXJhbXMpOw0KPiAtCVdBUk5fT05fT05DRShyZXQpOw0KPiAtCWRlcC0+
cmVzb3VyY2VfaW5kZXggPSAwOw0KPiAtDQo+IC0JaWYgKCFpbnRlcnJ1cHQpDQo+IC0JCWRlcC0+
ZmxhZ3MgJj0gfkRXQzNfRVBfVFJBTlNGRVJfU1RBUlRFRDsNCj4gLQllbHNlDQo+IC0JCWRlcC0+
ZmxhZ3MgfD0gRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORzsNCj4gKwlfX2R3YzNfc3RvcF9h
Y3RpdmVfdHJhbnNmZXIoZGVwLCBmb3JjZSwgaW50ZXJydXB0KTsNCj4gIH0NCj4gIA0KPiAgc3Rh
dGljIHZvaWQgZHdjM19jbGVhcl9zdGFsbF9hbGxfZXAoc3RydWN0IGR3YzMgKmR3YykNCg0KVGhh
bmtzLA0KVGhpbmgNCg==
