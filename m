Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 761E34F1001
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 09:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358569AbiDDHca (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 03:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376377AbiDDHc2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 03:32:28 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DA437A00
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 00:30:32 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7419CC00A1;
        Mon,  4 Apr 2022 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1649057432; bh=VLaE/Np+wn7u68TLmZuQdF9/gM/N7jNNNmsuzfgXINM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Oq3vB9C1F2+zSAUqdIehJhVZz0YcQOgBUJi/eRJ4GeTqqAq+BiE7V4u37MJhZ9E6B
         jgh5i/EnRI6MlkBwj1p02Zo2TizNxB/JczUz5xjzS71xxAHZv6kmVgZtyGseh+O+X2
         wfBUbCgUKTF5/OQRlK7vNYyi42QjkTvTE4ZvqyjgLBlho/X3jUHfoy5H52mWsDH+tU
         MRbnNcwkCu7yrCet9FuYY+CX56gHEXQCbMZk44VlE4w8PkK/RJtDyKdNO78NHRFkwS
         xaXFBD3pKczt3PH6acVKyXGlHhXzNoUaOylchD1Z542CjjmnKfvgWl4DbgK/FrTe0Y
         WiE/WtVUAJf9g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5EA95A0087;
        Mon,  4 Apr 2022 07:30:30 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 52CBC80079;
        Mon,  4 Apr 2022 07:30:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="dTp3xS26";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOz09gGQ9CxQXjidL+oNdRXNtBpKEYcg3kBbzkhMYNCA6haAFOLR7qCtUilynlqXCRkppaUwg/LCJ4k9WQQr0DchfEf2bv4hpDxtnPk0yWUJWd01kYweW2TE4jurSnBtUdDQsLvkZsiI52xW/O0vB6j8FA+htMIR5DWElXuzXYOSxx4JsKSn9j5YszH35jcLScmhsOnLZF2jbTIw9nWIZ0J68QtkPqGVX6y6Kjvp8COCHSJamvTPj7lnnEz79Cgq7hNLivMY5lbKuamRAuqZtYC9beyic2HjzrmHKtxkhkuBsGqOFzQkEFYBwQXFUKj2OtCCcRWB0DvjU7XcPXkU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLaE/Np+wn7u68TLmZuQdF9/gM/N7jNNNmsuzfgXINM=;
 b=TVVCOFafetxef8ORQrioJtU6q7HZO1klf04YooGk27x0TdMZ034thovF2R9P6+Orwi/NJEvTHeyZeko5Qd2RQxBlRIg+OmT2I6nltfbsYDR+Nr5zN+52ij/hvhNvuq9hsC+ZrD2Ncvz5kEM8pMpdKYR9Z3JwVJV6978DbsiLLn3TGr43U1qXb81AH6t7HVA2zLmqjPRP3VsoTm1ZnRx+7PK78cv/LyViKUhc20BGkMTH0/vyBRnYBWBZ5Zf7WcuCbU6pqnw85nzTGC/7lQnn0HIfc/WfZaTe4ZTw+GYTINQQYqHNptrW3omgJeh9jApxg4vqJw74dARx/UcQCSWQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLaE/Np+wn7u68TLmZuQdF9/gM/N7jNNNmsuzfgXINM=;
 b=dTp3xS26TehQjRArzO0XtnmWRph8OauayQgLDRKGhx+JOtVSypaADltNU6cJOloKLTuKQnSB5p7hI53VuzJgE8LKGUZqPaSIF+YmNNsIHjgtV6KOWna+U9KIQQHrY0p3ZjVBg/yTQM6MoGE/pvcecPpYoRH3EUX/M3xSomvCHL0=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 07:30:27 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::b813:914b:3d43:1467]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::b813:914b:3d43:1467%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 07:30:26 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Maxim Devaev <mdevaev@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: usb: dwc2: Problem with remote wakeup implementation
Thread-Topic: usb: dwc2: Problem with remote wakeup implementation
Thread-Index: AQHYPwTPlFPhT+w1MkKiIxCJ0PKr3azfbamA
Date:   Mon, 4 Apr 2022 07:30:25 +0000
Message-ID: <04a5b3ac-8d38-d033-89be-371716873b4c@synopsys.com>
References: <20220324012439.65ef4823@reki>
In-Reply-To: <20220324012439.65ef4823@reki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe6320bb-7f68-42a1-dc18-08da160cfcf2
x-ms-traffictypediagnostic: DM5PR12MB1593:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1593D1DA96C7A1A413481CC1A7E59@DM5PR12MB1593.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hdMGKnL6//PFr8VZ9DPQWOvCegaReZ7ci7V1YKrrbgfIDpr3elmfnLD7T+EHk3DfM4xvtCz3ktgMW5Ug9hE1c6hakO4MWHuH1QNN4Gcq8OuyCPoSxWYU5eqsR2m3la9aujR2KPtKbxXrSWQ3E5dKnOmYyRPsflgyzFB9cxXAjXCLQhgNFSfkOGHv4FtPvxrOlyEmZtAxjdfFF3arT2NnEfyea8Qw6aGRIs/X5+DJK93Bj1IYmTIV7kid35MkqxMwTh8nqNiUNLeRWPIKsSjil1tsMbfD4xBShcO3+nI58uPE/U8cHR+uP3P8HJwucM8RVY1gM+7gXXWrqqLLeAWS7PM+PDWrfub/sN/EJ8rbn721advNVtoagsjRLmh8y4drsms2Z5h5KpZ48RiF8Fmo+9YHKcThbMw+POZOMWE+gjVvXnv6t++LxL+8zJHvdhHl1Ud/3oqYEEzOz49yYNBWtPljsNS7OMgq18w3sRc25vdixnB4f4O+f1Jvmwr5OvpzB/lwNSkaYXP6x0JocIRjs5jwiJp+OZ4+/G1kmSw1oKLwdcNlJEscEP5tPVyYw8xILi8ZUQWLUQFRHcUhKXypz/oYo7CHcFOu2ew+KSBeqfMytKRKTT7Txt9hi/CEaAbi5TSL4Xq9rvXpDU85qCpoKcn1VePYTz9/EPnA7CkRKu7zFmvAQOJCBqw4FaYae+luLGxIxO4CHr33NaQfmXEWhLSQ1w8nmnD7ieqWNAJf1WGlJ3NSGdJhKCyVWuqCy//j/4GbQCDzjakl+uPu00gYDORlHFCxyx7Q5sIWSbReVsw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(53546011)(186003)(31686004)(83380400001)(2616005)(36756003)(6506007)(2906002)(66556008)(66946007)(38100700002)(31696002)(86362001)(508600001)(122000001)(5660300002)(8936002)(91956017)(38070700005)(6486002)(71200400001)(4326008)(66476007)(66446008)(64756008)(8676002)(76116006)(316002)(110136005)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjJsdlRRU2JubjVjTDJCTmFkcmR4SklubDRBSHNrS1JLTFNDNHo0cWRnanh5?=
 =?utf-8?B?eXZyc0NHcmNsdzIyZHFuQUhBcVBkSG04RVlPWFhBeks1cGFNaDFsU3ozdHZR?=
 =?utf-8?B?cEZuanpTb1ZwMEM4OURzTkR5N0NDcVVXS0xaaVl4bDNyMTM4MElHcG1NRTE3?=
 =?utf-8?B?T2RQWkdxSkNTVEJOQUd6MTMzV3gvTTlBWUZXSGZRZDY5elYwRkdjNFBYSEFD?=
 =?utf-8?B?YjlZTnpJNVdpajRjYWozNTkvVG94NFpxZEFsbTBaajZGMnJkMStMdTlmYXl5?=
 =?utf-8?B?Z0ZtVG0vTmZpU21xS3g0bTBsMHVYS0hQd2hJY0V1VkxiYTRNaFFnWms5bnVN?=
 =?utf-8?B?Nk1yVW82a3liR1Q3aGNUazljalAzV1J1NFZNbkcrTnB3dXpFdTV1K2Z3RWI2?=
 =?utf-8?B?YWpCbkprQ0JFWTAzQURTc2Z2REY1Yk0zR0s4TUlFZXZaT3NEaEVpcFY2dzFF?=
 =?utf-8?B?aSs5ODBZRS85YmpyR09pSmprcXk4YVdzZzdWWHZCTlVxcHVtdGl4b1NBbEUr?=
 =?utf-8?B?UlhMWXcwNDJ5Unc1Wmw3NGxad3pWYzQ4Ry96Y3NPNG1KYTU5RFNIRytzckh5?=
 =?utf-8?B?b0txZWJRWHA2N1FCWWdsZWRpYlFBcXdOOHdCNkRQeHExY2hQNVE5WEJHeFk5?=
 =?utf-8?B?c08zTVg0bDZ1QXpjSXhTLy9wM3hGTEprVU1hK0lPckRaSTl6bDdvdWRZTU5o?=
 =?utf-8?B?Y05neEVOeFAzWlFaZytrTGRaS2orTGw4L3B2NmJOaW0zNTVEOUEwTDJRcmVB?=
 =?utf-8?B?bkJtNU5UdE1XVERPM0FtOGk0Vm5LVGoxOThrL3NmWkNFV3ZzcnF3aExjNUxQ?=
 =?utf-8?B?VlpNMTNjUElBSDcvNlV5VXZjcEZud29QV1EyZm1kZjZFMHdscGFBL0lmSGRx?=
 =?utf-8?B?NUpEL0l6YWxzTmJHRnFrakh4V0Fwc0w5ZUtTb0JoK0h2NU1VVC9hN1g0RU5x?=
 =?utf-8?B?dzR0bGh4RkE3WjcrYi8wVGdHRTcvZGdncU9TY3RqS2ZRazBJekpaUEdkR0N1?=
 =?utf-8?B?b1Y3alRDclJhc09GaEZsRVJEWmErbjlaY3daVGJrbzREQlAzSHcrQUJiY3Y1?=
 =?utf-8?B?WFFBRGtRL1BrVTF0NmszMldNSko1THAxWWY4MkZ1YjF3UzFZQjVaZWZJcFpR?=
 =?utf-8?B?dTd4amVWTTAvbUlWbmZjOVhlSm05VzFBVk1ZbUVLNWIzbEM5U0N1ekExanN2?=
 =?utf-8?B?OHNIN3JNZ0VFZ0VsU1ZOeW5SOG9LcnE3dktSMUNwdDYxM0h1M2RQUW5qakU0?=
 =?utf-8?B?TFN6M2pmOVUzeVIrSVRlWHlHZmk5MlZTRlZJbVpuVHh2bnRPRUdvNzJHU0h6?=
 =?utf-8?B?LzV2SDRnUms0SW9sd2lOYkV3YnVwSnBkaExKd0VDN2NMZFBHaHc2amdHTVdx?=
 =?utf-8?B?VXcwSEpCcXZzOXJZeVBpVVY2VzQ0TlpjREtVTW1FZ2NPb3E0SnBmd2l0YlJl?=
 =?utf-8?B?bFN0bTZsUVJWM3FXd2h6b05lYkphd20zNTllUGc5WnpOOE5yNG9aeEFWM2E3?=
 =?utf-8?B?cEVtc2FZUmRzLzdtYUwzTThFZkhBSlU3b0NJWHNFQ0N5anlhakZmRS91WWMx?=
 =?utf-8?B?RlJjTjBRbVBSVkIwc3pjUHl5S0ZmSEpUVElKUlZ0V3FTU0huRDRydjNwbVhS?=
 =?utf-8?B?c1hZLzhYOXhQbm93SUFiL1VobkNYN0JLc2ZZTkpyNkp6SWl6czN6bENiOEd5?=
 =?utf-8?B?NTBXVkRhd3dkZlZDYUZzSWtqcXRxSCtyWEcxVEtGakl6ZDRmS3dDcGZyTGVC?=
 =?utf-8?B?MEwydjg5MGx1R2UyaDVuZnZCSkU1TzJ3dldVQ1JNNys0V3BLRUgzTnRDS2tQ?=
 =?utf-8?B?WjlrdWVQZTJ6cExHMWIrY05YRFNFVkxxeWhjOC9yUFNQY2JXZFNrT0RHUlIv?=
 =?utf-8?B?UCt0SkN2eGNhOVFYdjVZalEreENIbEZqdk9kMWoxWURldjg4WkdyUnlUZFRZ?=
 =?utf-8?B?WExha1BpV25lTW9CbWF5Z0dpdjRCNzVuNlM5bW82V2VyNEZtN0dJcXl6Q0Jz?=
 =?utf-8?B?TU13eWFmMlpaaGxSNkFuM1llMW55VzhSZlEwazVYbE8rUy9jWFlodVhpR2xG?=
 =?utf-8?B?ZkZYN3ZyRFFVcXJXTFRyQU1PdUNrbXVYditrSDVOa1RRS3FmbGQ5N0E5aTEv?=
 =?utf-8?B?dlVqdzQ0azlrNnYyOGhpclVCME53TFlycDBsMStxSlAyMyt3Q1h4QjFuOTR4?=
 =?utf-8?B?QVpNR0ozVnRLWDR4bDlYRGIxaXh5MTB2cW5FUXdSaDdjdDFIQ3dGL2FpV293?=
 =?utf-8?B?MkFvOWVzTlM2bzA3QWVyT3NOR1FDcnZ6WFpUYnB3bzllSnV2SmRISEtFenF0?=
 =?utf-8?Q?UagDJrZLUfbYJyHx1L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90959E57B0A6CA4CB954F8E5669220A6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6320bb-7f68-42a1-dc18-08da160cfcf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 07:30:25.7883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2evXCci+JkL1noPbBibJHReftOLTPXZ3MJWU+vgSR3avZZB4Nd/NssUHFvA6D0DKeyNT5poqsNMfAX/E2Q5vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF4aW0sDQoNCk9uIDMvMjQvMjAyMiAyOjI0IEFNLCBNYXhpbSBEZXZhZXYgd3JvdGU6DQo+
IEhlbGxvLiBJJ20gdHJ5aW5nIHRvIGltcGxlbWVudCByZW1vdGUgd2FrZXVwIHNpZ25hbGxpbmcg
Zm9yIGR3YzIuDQo+IFRoZSBkd2MzIGRyaXZlciBpbiBnYWRnZXQgbW9kZSBoYXMgdGhlIGFiaWxp
dHkgdG8gc2VuZCBhIHJlbW90ZQ0KPiB3YWtldXAgc2lnbmFsIHRvIHRoZSBob3N0IGJ5IHdyaXRp
bmcgMSB0byB0aGUgc3JwIGZpbGU6DQo+IA0KPiBlY2hvIDEgPiAvc3lzL2NsYXNzL3VkYy9YWFgv
c3JwDQo+IA0KPiBNeSBuYWl2ZSBpbXBsZW1lbnRhdGlvbiB3YXMgYWJsZSB0byB3YWtlIHVwIHRo
ZSBob3N0IG9uIDUuMTAga2VybmVsLA0KPiBidXQgaXQncyBub3Qgd29ya2luZyBhbnltb3JlIG9u
IDUuMTUsIGl0J3MganVzdCBkb2VzIG5vdGhpbmcgbm93Lg0KPiBJIHRyaWVkIHRvIHJvbGwgYmFj
ayBhbGwgdGhlIGNoYW5nZXMgaW4gZHJpdmVycy91c2IvZHdjMiB0byB0aGUgNS4xMCwNCj4gYnV0
IGl0IGRpZG4ndCBoZWxwLg0KPiANCj4gSSBkb24ndCBoYXZlIGFueSBEZXNpZ25XYXJlIGRvY3Vt
ZW50YXRpb24sIHNvIEkgaG9wZSBzb21lb25lDQo+IGNhbiBoZWxwIG1lIHRvIG1ha2UgaXQgd29y
ayBpbiB0aGUgcmlnaHQgd2F5Lg0KPiANCg0KQWNjb3JkaW5nIGRhdGFib29rIFJtdFdrVXBTaWcg
Yml0IGRlc2NyaXB0aW9uIGJlbG93LiBZb3Ugc2hvdWxkIGFsc28gDQpjb25zaWRlciBMUE0gc3Rh
dGUuDQoNClJlbW90ZSBXYWtldXAgU2lnbmFsaW5nIChSbXRXa1VwU2lnKQ0KV2hlbiB0aGUgYXBw
bGljYXRpb24gc2V0cyB0aGlzIGJpdCwgdGhlIGNvcmUgaW5pdGlhdGVzIHJlbW90ZQ0Kc2lnbmFs
aW5nIHRvIHdha2UgdXAgdGhlIFVTQiBob3N0LiBUaGUgYXBwbGljYXRpb24gbXVzdCBTZXQgdGhp
cyBiaXQNCnRvIGluc3RydWN0IHRoZSBjb3JlIHRvIGV4aXQgdGhlIFN1c3BlbmQgc3RhdGUuIEFz
IHNwZWNpZmllZCBpbiB0aGUNClVTQiAyLjAgc3BlY2lmaWNhdGlvbiwgdGhlIGFwcGxpY2F0aW9u
IG11c3QgY2xlYXIgdGhpcyBiaXQgMS0xNSBtcw0KYWZ0ZXIgc2V0dGluZyBpdC4NCklmIExQTSBp
cyBlbmFibGVkIGFuZCB0aGUgY29yZSBpcyBpbiB0aGUgTDEgKFNsZWVwKSBzdGF0ZSwgd2hlbiB0
aGUNCmFwcGxpY2F0aW9uIHNldHMgdGhpcyBiaXQsIHRoZSBjb3JlIGluaXRpYXRlcyBMMSByZW1v
dGUgc2lnbmFsaW5nIHRvDQp3YWtlIHVwIHRoZSBVU0IgaG9zdC4gVGhlIGFwcGxpY2F0aW9uIG11
c3Qgc2V0IHRoaXMgYml0IHRvIGluc3RydWN0DQp0aGUgY29yZSB0byBleGl0IHRoZSBTbGVlcCBz
dGF0ZS4gQXMgc3BlY2lmaWVkIGluIHRoZSBMUE0NCnNwZWNpZmljYXRpb24sIHRoZSBoYXJkd2Fy
ZSBhdXRvbWF0aWNhbGx5IGNsZWFycyB0aGlzIGJpdCA1MA0KbWljcm9zZWNvbmRzIChUTDFEZXZE
cnZSZXN1bWUpIGFmdGVyIGJlaW5nIHNldCBieSB0aGUNCmFwcGxpY2F0aW9uLiBUaGUgYXBwbGlj
YXRpb24gbXVzdCBub3Qgc2V0IHRoaXMgYml0IHdoZW4gR0xQTUNGRw0KYlJlbW90ZVdha2UgZnJv
bSB0aGUgcHJldmlvdXMgTFBNIHRyYW5zYWN0aW9uIGlzIHplcm8uDQoNCklmIGl0IHdpbGwgbm90
IGhlbHAsIHBsZWFzZSBjaGVjayBwb3dlciBzdGF0dXMgb2YgY29yZSB3aGlsZSByZXN1bWluZzog
DQpoaWJlcm5hdGVkLCBpbiBwYXJ0aWFsIHBvd2VyIGRvd24sIGV0Yy4NCg0KVGhhbmtzLA0KTWlu
YXMNCg0KPiBJIHdpbGwgYmUgdmVyeSBncmF0ZWZ1bCA+DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMi9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4gaW5k
ZXggMzE0NmRmNmU2NTEwLi5jNjRlNTczYWY3Y2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNi
L2R3YzIvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPiBAQCAt
NDY4Myw2ICs0NjgzLDUyIEBAIHN0YXRpYyBpbnQgZHdjMl9oc290Z192YnVzX2RyYXcoc3RydWN0
IHVzYl9nYWRnZXQgKmdhZGdldCwgdW5zaWduZWQgaW50IG1BKQ0KPiAgIAlyZXR1cm4gdXNiX3Bo
eV9zZXRfcG93ZXIoaHNvdGctPnVwaHksIG1BKTsNCj4gICB9DQo+ICAgDQo+ICsvKioNCj4gKyAq
IGR3YzJfaHNvdGdfd2FrZXVwIC0gc2VuZCB3YWtldXAgc2lnbmFsIHRvIHRoZSBob3N0DQo+ICsg
KiBAZ2FkZ2V0OiBUaGUgdXNiIGdhZGdldCBzdGF0ZQ0KPiArICoNCj4gKyAqIElmIHRoZSBnYWRn
ZXQgaXMgaW4gZGV2aWNlIG1vZGUgYW5kIGluIHRoZSBMMSBvciBMMiBzdGF0ZSwNCj4gKyAqIGl0
IHNlbmRzIGEgd2FrZXVwIHNpZ25hbCB0byB0aGUgaG9zdC4NCj4gKyAqLw0KPiArc3RhdGljIGlu
dCBkd2MyX2hzb3RnX3dha2V1cChzdHJ1Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0KQ0KPiArew0KPiAr
CXN0cnVjdCBkd2MyX2hzb3RnICpoc290ZyA9IHRvX2hzb3RnKGdhZGdldCk7DQo+ICsJaW50IHJl
dCA9IC0xOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsNCj4gKwlzcGluX2xvY2tfaXJx
c2F2ZSgmaHNvdGctPmxvY2ssIGZsYWdzKTsNCj4gKw0KPiArCWlmICghaHNvdGctPnJlbW90ZV93
YWtldXBfYWxsb3dlZCkgew0KPiArCQlkZXZfZGJnKGhzb3RnLT5kZXYsDQo+ICsJCQkid2FrZXVw
IHNpZ25hbGxpbmcgc2tpcHBlZDogaXMgbm90IGFsbG93ZWQgYnkgaG9zdFxuIik7DQo+ICsJCWdv
dG8gc2tpcDsNCj4gKwl9DQo+ICsJaWYgKGhzb3RnLT5seF9zdGF0ZSAhPSBEV0MyX0wxICYmIGhz
b3RnLT5seF9zdGF0ZSAhPSBEV0MyX0wyKSB7DQo+ICsJCWRldl9kYmcoaHNvdGctPmRldiwNCj4g
KwkJCSJ3YWtldXAgc2lnbmFsbGluZyBza2lwcGVkOiBnYWRnZXQgbm90IGluIEwxL0wyIHN0YXRl
XG4iKTsNCj4gKwkJZ290byBza2lwOw0KPiArCX0NCj4gKwlpZiAoIWR3YzJfaXNfZGV2aWNlX21v
ZGUoaHNvdGcpKSB7DQo+ICsJCWRldl9kYmcoaHNvdGctPmRldiwNCj4gKwkJCSJ3YWtldXAgc2ln
bmFsbGluZyBza2lwcGVkOiBnYWRnZXQgbm90IGluIGRldmljZSBtb2RlXG4iKTsNCj4gKwkJZ290
byBza2lwOw0KPiArCX0NCj4gKw0KPiArCWRldl9kYmcoaHNvdGctPmRldiwgInNlbmRpbmcgd2Fr
ZXVwIHNpZ25hbCB0byB0aGUgaG9zdCIpOw0KPiArDQo+ICsJZHdjMl9zZXRfYml0KGhzb3RnLCBE
Q1RMLCBEQ1RMX1JNVFdLVVBTSUcpOw0KPiArCW1kZWxheSgxMCk7DQo+ICsJZHdjMl9jbGVhcl9i
aXQoaHNvdGcsIERDVEwsIERDVExfUk1UV0tVUFNJRyk7DQo+ICsNCj4gKwkvKiBBZnRlciB0aGUg
c2lnbmFsbGluZywgdGhlIFVTQiBjb3JlIHdha2VzIHVwIHRvIEwwICovDQo+ICsJaHNvdGctPmx4
X3N0YXRlID0gRFdDMl9MMDsNCj4gKw0KPiArCXJldCA9IDA7DQo+ICtza2lwOg0KPiArCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmhzb3RnLT5sb2NrLCBmbGFncyk7DQo+ICsJcmV0dXJuIHJldDsN
Cj4gK30NCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2dhZGdldF9vcHMgZHdjMl9o
c290Z19nYWRnZXRfb3BzID0gew0KPiAgIAkuZ2V0X2ZyYW1lCT0gZHdjMl9oc290Z19nYWRnZXRf
Z2V0ZnJhbWUsDQo+ICAgCS5zZXRfc2VsZnBvd2VyZWQJPSBkd2MyX2hzb3RnX3NldF9zZWxmcG93
ZXJlZCwNCj4gQEAgLTQ2OTEsNiArNDczNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2dh
ZGdldF9vcHMgZHdjMl9oc290Z19nYWRnZXRfb3BzID0gew0KPiAgIAkucHVsbHVwICAgICAgICAg
ICAgICAgICA9IGR3YzJfaHNvdGdfcHVsbHVwLA0KPiAgIAkudmJ1c19zZXNzaW9uCQk9IGR3YzJf
aHNvdGdfdmJ1c19zZXNzaW9uLA0KPiAgIAkudmJ1c19kcmF3CQk9IGR3YzJfaHNvdGdfdmJ1c19k
cmF3LA0KPiArCS53YWtldXAJCQk9IGR3YzJfaHNvdGdfd2FrZXVwLA0KPiAgIH07DQo+ICAgDQo+
ICAgLyoqDQo+IA0KPiANCg0K
