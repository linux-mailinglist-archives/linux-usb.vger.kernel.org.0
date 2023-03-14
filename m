Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1686B8737
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 01:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjCNAtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 20:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCNAtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 20:49:23 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B693CC20
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 17:49:21 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DK1FP8011065;
        Mon, 13 Mar 2023 17:49:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=fvA3a+wN/qk9PDMZOd6pp9XtvhUfafycPZ29nS89pfU=;
 b=s0ycJ1C8fbtQyvIAfZcR458GY6TvQWiVSq3xeQpTLdDoNhWR23fUlwVjdrTATCJ93aEX
 J9pBsO0PFy08hGjhwHBtkTNYpF4+ufOBdSJU5pP8mBD6MZtgHBTHItAHNygoRp5ZG5JQ
 ZeZlr4fiuvYnfuBvvggNpbhBWZfDRMZ9OBCsfydIEEpBQstH24r2kUhOH3JJ6vpbq/tS
 Hq+QLXzLbgv7TWwiwYjwaS2xW+UjSUxYGY0Rwmw2KLUyRQLU0u4ngb/n3aMm11+35nR4
 j+xP3IEL+vifR5/nID1pq0TH9Tq3YIC6dK5H438EKYX1yfzdkpkxKjyv1pnYcmE7Jpfm 8A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3p9ar47de1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 17:49:13 -0700
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 28BAD40103;
        Tue, 14 Mar 2023 00:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1678754952; bh=fvA3a+wN/qk9PDMZOd6pp9XtvhUfafycPZ29nS89pfU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Q9kg6BJHtYw69Nxw2jzf58TyAEnJpUHMKwc4tZApvbBwfIGcibcbxkGf2K0/k6sGH
         cfbzQeWK3iw7CF+WXfhvT+mjMC3dBXr+cZNmZ6VLclKfto2+r7lBvoaSc4PH8yHCGK
         WPyrZOiedNrOCC9b7zab6wudlWt/yGiFRHGz0gytcxwuSzgl/HwUKX8dGZYNjc8JXb
         YkBoCwpor4jS9NsaI0zTgRWF/rTyp+cYiVP9sR6v4V/pBICk7u+VZKPErs2GVkMrmh
         kLe0WWbrZVABmY4VenpbUpjsM9LWDcN0mFn+mAvnbAUTovaHKml4Nv93tuD7FwLIxU
         adobJWpzau7bA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 71670A00B9;
        Tue, 14 Mar 2023 00:49:11 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id ECD074011B;
        Tue, 14 Mar 2023 00:49:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KZAYGli+";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSAXO5sxtjXcdUqQV//TIZAUT2Muwr/DREidrq+aVNZ/2FyUdCuWhoRQ6X1Tk5+5R0HjcXfGnUeZRP6SF8LTGkOgE2sFEOO7xHteElV+DED5RIcccB+qKDhJG5lld1sqJ/eb346haEeX6xkekoHv9C2hci9426PJjgQ1GyJD3JVJFCoacHbm4EIKiQyqv74/YgYwFQ3we8f8cHs9+PuQ7t1sZRZyR56z8qislHJd4wMLRGTqL3Z/79jAFOAIRSZ/Z6yNJA+WKreITVX+w+qQzidEDBKW9Q2MQIExKJYs0Ulfa5SxMS5nvWDqbOXSOFWDYbtb9MJGPPLaehgRRmymOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvA3a+wN/qk9PDMZOd6pp9XtvhUfafycPZ29nS89pfU=;
 b=lJbuSUz60+YuHSukWtEXTaD+t69yG8FoRr+QrgnBJWGEqqH5Tz49TJ4oMDDZXzKxDGxMDAwUH0QupM3IFgrFmwYkqBUYWcJvE8Fz0kWHaxCXUhqHIP7CSlFEXtz/7VtM7/PlUQIhxx4Obps9h9jLh+tnpYuJTkibezjJu1b/bUzJNdmh4FuVEv/Rvj9EzTEAhu0LE31E8u4EZKwwBIfNwGGDFuVI0mPaTTp5TGLN2fVF1m0Bh6enwbVCGx1C/y8xrmaox+ZDFxwIZmmRdOHyKZlxcWqiLJ6fM5JFKARMVxEvza4kZJ0Bn0E8d9n0tnfA7bx31paFU19f54LdTuQpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvA3a+wN/qk9PDMZOd6pp9XtvhUfafycPZ29nS89pfU=;
 b=KZAYGli+AHH0mQTY9CVX9KBtSQfiNRKxszS91FbSSQZOlB4VUc6zk+KSOWciymcGhscCe0Va78+sF5zs6W9y6Ntkw2TKeJqfU5P7/kHwfe2Gmfn7K2CJtc6uV4bq1COqjcIgHtPL50/Ng4sFcKIdpxMLi6Gq3Kf9BeJrtgUHaKA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 00:49:07 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 00:49:07 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIAgAAPLgCAAAUXgIAAz5OAgADhYYCAATLtgIADouQA
Date:   Tue, 14 Mar 2023 00:49:07 +0000
Message-ID: <20230314004902.fpkbhegd7j6znjx7@synopsys.com>
References: <ZAja0So7EDH5FfI0@kroah.com>
 <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
 <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
 <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
 <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
 <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
 <20230309210907.r5daisahfzyhjl46@synopsys.com>
 <50fc84ff18f33a8d70986c1865c977e638a8563f.camel@infinera.com>
 <20230310225843.m4ypslx5x6wsldla@synopsys.com>
 <3c0fc6880ee13c98577225b05aaf7ac9edf3adfe.camel@infinera.com>
In-Reply-To: <3c0fc6880ee13c98577225b05aaf7ac9edf3adfe.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SN7PR12MB7131:EE_
x-ms-office365-filtering-correlation-id: 9acef97d-422c-41ac-e757-08db2425eaac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AC6NmTQ/XwYFwxFqXCb0D+cZD5GYWdxO54oSJgKJGfLV6YpoKsp/3AL0DpPAFlg0PQRz/d2bxorwzCx4i0AZXi/5OqkTadXPg5klxN0jF8JB8dIAral30hX4BmLdr9AS5mXHlkfCgP3/XAPHBjOCwCCtqYUUc1gOqTH5+qJwOGJENsNfYsK+9TvAiuVFNPUobIAsRLj4zR+GFXb0LP3CGw+iBFUmveOTlEd7rZ9q5s4g595HYUy/LfVKKbo8oi1PtjcblaZcUZ4JJ7SvjF3etGVE82KTzGXgZ1FvvytTNV0wMAcsORXmgo6KhlVVrmlVKD6tORuKAI5XBNZl0NRuNR25uywCv2BCtX6r2tdfa2WsBj3GWcfvtmnIjgnSbwhvAJALrhkcEcxVgY4FQgNeOlNPZ/Pu0FI0o4XLM65VW8C/hrdYFMdCnf4MN/XAlt/3PVsJ3zojfb9BL8hlEgFfpZLGUsNr2DsCxtby4IHxB4r49VoyIPq2xxLMYNkxJb3M6JWelys+mnyoGIn9Jddaxlai4bnuP7OINh14TmGJvLA3qLTWS7c8Xvqj3fY/PwhLt4ahW+Ts3L6/O0RsjjBibmE+Jjbfswxw119aurnQYXQicGtZoMpRIrPSJ+Q9ktKXxznCztycnUQlAA3wEYiVwhVdTz4MOBxR8hh2DGUDq/zlD7QZGVWo/IGG9WAtorJt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(4326008)(41300700001)(54906003)(8936002)(478600001)(6916009)(66476007)(66556008)(66446008)(66946007)(64756008)(8676002)(76116006)(86362001)(38070700005)(122000001)(38100700002)(36756003)(6506007)(26005)(1076003)(6486002)(966005)(71200400001)(186003)(5660300002)(2906002)(316002)(6512007)(83380400001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0ltWHBiMTM4OEZxWStWeWEwbk5kQ2JaU2RYeGVwUUZxRTlhc3ZUZFdBZ0N2?=
 =?utf-8?B?dzdlREZkaWhTTVhyL0tBeDd2eXBrS0s1VTJNSEh1MUEvWENpMjhOR1lUZ2RH?=
 =?utf-8?B?MUZNVXllMU9Gb1NTaDhPZ1l6ak1PZ295MUV0bmRwWnpDR3NuL0xmUXQvU1cy?=
 =?utf-8?B?THBhWElIeXJRbWJtRndrNVA5ZXhKZVFKb3JIWXh3Y3dVMTAzWDlzWEJWeUtM?=
 =?utf-8?B?SWMrMEh6MHZFWkxub0NyVDRSVThCcEF3T29NdW9pWllqcksvN0FpNlNwUWhw?=
 =?utf-8?B?dmtWODZrV0x4d0R2a0VWWVQyYlJxUDhDcXh0KzJGcWdpeGNKN0VEbHBPZE55?=
 =?utf-8?B?bkQyVnMvRGxjcUg2MFNBY0Q0YThtdm1tdmZtMDdpUnZYWDlsNnZRSGpVQmVz?=
 =?utf-8?B?YWZsUGxmY0EwVjAwcmhBdERDMmk0cklNTkNCR2ZLdjZoUnI3YkpaeDE0a1Rs?=
 =?utf-8?B?MjNPaWRkRmVrYk1lY0JvSzlmcTBoa1NXR3V4ZTNpdllzZ2JObER5eGZhOVFq?=
 =?utf-8?B?dXhrZWdLall0SWxOWFFXbXRKUFNjRlFxSlViK1BZRXltU3Q2SGt6ZDFyWjhk?=
 =?utf-8?B?KzJBSXJ6OWtONUlYd3VwMk1OSy96Q3ZVb0RrcHhZUW5Wc1NTYmZCWFBqYWtE?=
 =?utf-8?B?c05sSWFvU2pFMkR1d0IxQU9vTXhqK0YrbWtwSy9MbzBCZmpEUUluVVl0V21T?=
 =?utf-8?B?djI5blJPSDBYRUF1QnF2dWU2R0xPMjNCWWU3aVVIOTF4TVNhQ0htcnhSTGpJ?=
 =?utf-8?B?dTFTdExnSURaU0cwcVZqekd5b3hpMFBWM3UrQXpBVjF4dmpNL0pEUWUwaEVT?=
 =?utf-8?B?Wms4T0F1OUZSN2hXd3REUEVKNUszSFpXSndZV0RuUVNLZGhWdzFMOHc0ejJE?=
 =?utf-8?B?UXZmVkxBR2x1RHgxWFpYS0x6TUtNSjZ6ZjJpMW5LQTl6TDh2TnYxK1RoTkpY?=
 =?utf-8?B?NTBxU3hseHcwTlV0SEhwMFdHMlpEcFlSdnRRTHV1WXlRWGV3eFFGUVlEYlBC?=
 =?utf-8?B?bFp3bTNUOTVsODRRbTZEMG5BR2U2OC9zZEE3alhjNEYwQjBKTXQ2aUpJWk9B?=
 =?utf-8?B?Q3RPWEZiZUZDZzVhOFJiSVpWTE1wbWRZMlhONnBiTlBudlpIcHkvaXk3ZnZF?=
 =?utf-8?B?NzdTWFFLcmFRckpDVkUweTRST2NzWnI5QW9XWjQ3UUdRV2ZxZmR2LytDN2Q4?=
 =?utf-8?B?YlBjTWMrQTk3RytwM1RQNmxralRScHljSGoyam82SkF5MzNHTTlEODF1aWwv?=
 =?utf-8?B?UXc4QzVjTkE1aEtsaWY5RkJzSW82VWhwV0p2ZHlXdW9CWWRKVzQvaFROOWVJ?=
 =?utf-8?B?Z3pPbVNSYlpMMmRyVWYwcXpaUy9Ic3JGUkM3Y25aejJ5bEhCSnZDOFhlN1VR?=
 =?utf-8?B?bW56TnVaUVlLVDdnakxGQWhaREhMOVRSN2RCeW9oeGl0TloxQTg5SzZsTG9r?=
 =?utf-8?B?cXhUOG5zSzJOV29qT0hQZHdhZ1NaeUpZVzhNZHBoQVVuTi9ZSHl6TzIrMGhn?=
 =?utf-8?B?bk1Mck1zTDZWM2d2UDZ3MHhNa1QwOERjUnpMblpFTmNvUHJjZlo5Y09SSWlq?=
 =?utf-8?B?U3YwSll3QXVVa0RmcGNLeFVMK2dYOTB1Y01nTXhaK3hEelFCWXQ5WW9HMllF?=
 =?utf-8?B?cEtERmlxSUk5YlpaNXhHS1N5M0dJRjFUNVFIM0ZQam1JS09aQXh3SHNtd0xF?=
 =?utf-8?B?Yy9hOFd4TnRWSHJLQ1dxWEpWRlk0UVFubFFFc2hjV05DR3ZRQlMxNXNuUzZG?=
 =?utf-8?B?dms3RWNuRFcyaDk4TXVrS3BOcU5pQU54QVk3QlEvNWtNZHQ4OFh1MncwdGZj?=
 =?utf-8?B?cTA3Mk9aMlNRK2RJNmswaXArTDVZZGk1cExDcCtFUFpSZ3BxenI3eDJTSmZ3?=
 =?utf-8?B?MWJLaUFETkhmUm5uNWgvREljQXY3UkY1VkhrekszaVpxV0pCWmtIMC9xV2Rj?=
 =?utf-8?B?L3VOTnhFcldxaDFrbCs3dGpINHZyTVlKZmE5MjRKWFhSbE9mN2ZwNVZud0t1?=
 =?utf-8?B?dFJxOW5UZ3VNSmJ4RXlJUXBTNFE1Qmg4SXdHM2U4bGsxNjZKeTJ3SDQvYUtL?=
 =?utf-8?B?OEdvamRkWjVtZ24zanpZSFVMbEUrTVpkM0lvYzVUbzAvak5jd002dTk4eEZq?=
 =?utf-8?B?NW1HS29CN2JsSVZ0L0RRbFh2b1BFUGlvWnQ4b2g2L1JjOWZrdU1yNEJKdEtP?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A1480A989FB0C4C91187A7F73DE663F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LlmlBJlYGjL2tiYu/4bxTHo4E4F1xKADTYtPIvflyCA22y4dycdBL8AaVtM3qBhgrHYgJqgkoJwL8Irh6rqpW56Ym37TDRFLaNkQWL7ddoLIiAgYKbSBY4+D9hbUZ0wl2pfk5pqnk5bWtg8OzeuA0YriNErJG+5WDAv3bSFkQ4ib0g+AgQrRzWHbGB1cI1T/awlCFatLSy9X0vqeKlYvPY4W4RU9Js97e3pweVpBjlblYkDYdAsOg8J9PoC9t8hLFWRTLpmOzlbRK42bhpeJfdvnSJsvbMjc0Qfr9aj/RIcIySatONwgzoscria/7kIDdcDHpP7VRm9wyjpZc6autzMKuzIufjBMm9tYEBSnggMnGUm66X9kxFDhy4PV5LjXAnE7tfCqQg/nARDsExzLizqk4xSACUcgpL/8aSWtjwJ9DIuaZYDml2zR3bovumPNxqvZ8jwF4Es2ege6ejFrq6qTf3oXbOuD1HTfJxTaaFdwu+epdlpJ8Xi2cM0YPi286eIliL7I9E7Mk8WjYaLcEqQsVcCsbKkOtt89b8C/9GFMb3d9TyciJQ6Yc+rWVm+nD5Y4mVwi3mO5zg6vFud2PBYjO7B3pQAV6Z363xy2eSzTfCQkdC1WeGelJrbkm6T/iYYZf/BjvCSl3apPNsE1oa6uZ3qVv9UnBPlKvie4KClh8h2XhlhiuPIhzmljW/W/hg1mCqx1xymIS3JdfQXRQCKWG50HVIGm/+wOnwr8x9u/oUPaf5wi9AE0RlG8roGaXUWAeGILJ0IFlUHVXVehBKz6jAceTR6y80vadaG9/2rAi+lwLl4kFawZgIbH2su7C9c6Y1yzAw3l9sY4U6+7yPLCUiDFMT2mJ545axk0IGdLE3u/OdzrFHBCfE6/vi3MEv56wEUkUJ6A6nj1FfulQXhv/UbBB2IxUc3AmOmZxf4=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acef97d-422c-41ac-e757-08db2425eaac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 00:49:07.2334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFvg76/hw+056GlWvsdgYssbc9WcBEFRJjmTLtNBo8fqxzqlXg73rluOrkySSl49KlE1R5+dDRMl/2u/I3I/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131
X-Proofpoint-GUID: PMMpLNAn-OMC3Uu31xCYSFFG7nxXQJtC
X-Proofpoint-ORIG-GUID: PMMpLNAn-OMC3Uu31xCYSFFG7nxXQJtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303140005
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU2F0LCBNYXIgMTEsIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+IE9uIEZyaSwg
MjAyMy0wMy0xMCBhdCAyMjo1OCArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIEZy
aSwgTWFyIDEwLCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gT24gVGh1LCAy
MDIzLTAzLTA5IGF0IDIxOjA5ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+IE9u
IFRodSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+IE9u
IFRodSwgMjAyMy0wMy0wOSBhdCAxOTo1NiArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
ID4gPiA+ID4gT24gVGh1LCBNYXIgMDksIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+
ID4gPiA+ID4gPiA+IE9uIFRodSwgMjAyMy0wMy0wOSBhdCAxNzozMiArMDEwMCwgSm9ha2ltIFRq
ZXJubHVuZCB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMjI6
MjYgKzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBX
ZWQsIDIwMjMtMDMtMDggYXQgMTk6NTggKzAxMDAsIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNjox
Mjo1MVBNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IE9uIFdlZCwgMjAyMy0wMy0wOCBhdCAxODoyNSArMDEwMCwgR3JlZyBLSCB3cm90ZToNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwgTWFyIDA4LCAyMDIzIGF0IDA1OjEwOjE3UE0g
KzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAN
Cj4gPiANCj4gU05JUCAuLi4NCj4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gV2hpbGUgSSByZW1l
bWJlciwgSSB0cmllZCB0byBjcmVhdGUgYm90aCBhIE5DTSBhbmQgYSB0dHlBQ00gb24gdG9wIG9m
IG15IGR3YzMgZ2FkZ2V0DQo+ID4gPiBidXQgdGhlbiBJIGdvdCBzb20gYmluZCBlcnJvciB3aGVu
IGFjdGl2YXRpbmcgdGhlIFVEQy4gSXMgdGhhdCBleHBlY3RlZCA/DQo+ID4gPiBJIGZpZ3VyZWQg
Ym90aCBjb3VsZCBsaXZlIG9uIHRoZSBzYW1lIGRldmljZSBhbmQgd291bGQganVzdCBtdXggdGhl
IHR3byBwcm90b2NvbHMuDQo+ID4gPiANCj4gPiANCj4gPiBJJ20gbm90IGNsZWFyIHdoYXQgeW91
IG1lYW50IGhlcmUuIFRoZSBnYWRnZXQgZHJpdmVyIGFuZCB0aGUgVURDIGRyaXZlcg0KPiA+IHNo
b3VsZCBiZSBzZXBhcmF0ZWQgYW5kIGFic3RyYWN0ZWQgZnJvbSBlYWNoIG90aGVyLg0KPiA+IA0K
PiA+IEFsc28sIHBsZWFzZSBub3RlIHRoYXQgYWxsIHRoaXMgdGFsa2luZyBwb2ludHMgYXJlIGJh
c2VkIG9uIHRoZQ0KPiA+IGFzc3VtcHRpb24gdGhhdCB0aGUgaXNzdWUgaXMgZHVlIHRvIHRoZSBo
b3N0IHB1dHRpbmcgdGhlIGRldmljZSBpbg0KPiA+IHN1c3BlbmQgYmFzZSBvbiB5b3VyIGV4cGVy
aW1lbnQuIFdlIGRpZG4ndCByZXZpZXcgdGhlIGxvZ3MuDQo+ID4gDQo+ID4gSU1PLCB0aGUgYmVz
dCBvcHRpb24gc2hvdWxkIGJlIHRvIHByZXZlbnQgc3VzcGVuZCBmcm9tIHRoZSBob3N0IHNpZGUg
YXMNCj4gPiBpdCBsb29rcyBsaWtlIHlvdXIgZGV2aWNlIG1heSBvcGVyYXRlIGluIHVzYjMgc3Bl
ZWQgYWxzbz8NCj4gPiANCj4gPiBCUiwNCj4gPiBUaGluaA0KPiANCj4gVGhpcyBzY3JpcHQgYmVz
dCBleHBsYWluIEkgdGhpbms6DQo+ICMhIC9iaW4vc2gNCj4gDQo+IHN0b3AoKSB7DQo+ICAgICBn
PSIvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMSINCj4gICAgIGlmIFsgLWUgIiR7Z30i
L1VEQyBdOyB0aGVuDQo+IAllY2hvICIiID4gICIke2d9Ii9VREMNCj4gCXJtIC1mICIke2d9Ii9v
c19kZXNjL2MuMQ0KPiAJcm0gLWYgIiR7Z30iL2NvbmZpZ3MvYy4xL25jbS51c2IwDQo+IAlybSAt
ZiAiJHtnfSIvY29uZmlncy9jLjEvYWNtLkdTMA0KPiAJWyAtZCAiJHtnfSIvY29uZmlncy9jLjEv
c3RyaW5ncy8weDQwOSBdICYmIHJtZGlyICIke2d9Ii9jb25maWdzL2MuMS9zdHJpbmdzLzB4NDA5
DQo+IAlbIC1kICIke2d9Ii9mdW5jdGlvbnMvYWNtLkdTMCBdICYmIHJtZGlyICIke2d9Ii9mdW5j
dGlvbnMvYWNtLkdTMA0KPiAJWyAtZCAiJHtnfSIvZnVuY3Rpb25zL25jbS51c2IwIF0gJiYgcm1k
aXIgIiR7Z30iL2Z1bmN0aW9ucy9uY20udXNiMA0KPiAJWyAtZCAiJHtnfSIvYy4xL3N0cmluZ3Mg
XSAmJiBybWRpciAiJHtnfSIvYy4xL3N0cmluZ3MNCj4gCVsgLWQgIiR7Z30iL2MuMS9zdHJpbmdz
LzB4NDA5IF0gJiYgcm1kaXIgIiR7Z30iL2MuMS9zdHJpbmdzLzB4NDA5DQo+IAlbIC1kICIke2d9
Ii9jb25maWdzL2MuMSBdICYmIHJtZGlyICIke2d9Ii9jb25maWdzL2MuMQ0KPiAJWyAtZCAiJHtn
fSIgXSAmJiBybWRpciAgIiR7Z30iDQo+ICAgICBmaQ0KPiB9DQo+IA0KPiBzdGFydCgpIHsNCj4g
ICAgIG1rZGlyIC1wIC9zeXMva2VybmVsL2NvbmZpZy91c2JfZ2FkZ2V0L2cxDQo+ICAgICBjZCAv
c3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMQ0KPiANCj4gICAgICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMNCj4gICAgICMgUG9wdWxhdGUgRGV2aWNlLUxldmVsIFN0dWZmICMN
Cj4gICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gDQo+ICAgICAjU2V0dGlu
ZyBkZXZpY2UgY2xhc3Mvc3ViY2xhc3MvcHJvdG9jb2wgdG8gdGhlc2UgdmFsdWVzDQo+ICAgICAj
IGFsZXJ0cyB0aGUgT1MgdGhhdCB0aGlzIGlzIGEgY29tcG9zaXRlIGRldmljZSB3aXRoDQo+ICAg
ICAjIElBRHMgaW4gaXQncyBmaXJtd2FyZS4NCj4gICAgICMgcmVmOiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy1oYXJk
d2FyZS9kcml2ZXJzL3VzYmNvbi91c2ItaW50ZXJmYWNlLWFzc29jaWF0aW9uLWRlc2NyaXB0b3Jf
XzshIUE0RjJSOUdfcGchZjJEbXVrQkN6LW4yZFhSVERUZDIyWWpIZFhnS1hXWndDTHR1d29CNFNk
alctVTdzMnM5Q3llejQtSmptSEpOemhldHhkWDA2YTZpb2hWXzF5ajdicHEySGEyOEx2d0FMU3ck
IA0KPiAgICAgZWNobyAiMHhFRiIgPiBiRGV2aWNlQ2xhc3MNCj4gICAgIGVjaG8gIjB4MDIiID4g
YkRldmljZVN1YkNsYXNzDQo+ICAgICBlY2hvICIweDAxIiA+IGJEZXZpY2VQcm90b2NvbA0KPiAN
Cj4gICAgIGVjaG8gIjB4MTVBMiIgPiBpZFZlbmRvcg0KPiAgICAgZWNobyAiMHgwMDAxIiA+IGlk
UHJvZHVjdA0KPiANCj4gICAgICNta2RpciBzdHJpbmdzLzB4NDA5DQo+ICAgICAjZWNobyAiMTIz
NDU2NyIgPiBzdHJpbmdzLzB4NDA5L3NlcmlhbG51bWJlcg0KPiAgICAgI2VjaG8gIkluZmluZXJh
IiA+IHN0cmluZ3MvMHg0MDkvbWFudWZhY3R1cmVyDQo+ICAgICAjZWNobyAiTkRVIiA+IHN0cmlu
Z3MvMHg0MDkvcHJvZHVjdA0KPiANCj4gICAgICNlbmFibGUgdXNlIG9mIG9zX2Rlc2MncyAoaW1w
b3J0YW50IGZvciBSTkRJUyAmIE5DTSBlbmFibGVtZW50IG9uIFdpbmRvd3MpOg0KPiAgICAgZWNo
byAxICAgICAgID4gb3NfZGVzYy91c2UNCj4gICAgIGVjaG8gMHhiYyAgICA+IG9zX2Rlc2MvYl92
ZW5kb3JfY29kZSAjb3IgMHhjZCA/DQo+ICAgICBlY2hvIE1TRlQxMDAgPiBvc19kZXNjL3F3X3Np
Z24NCj4gDQo+ICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gICAgICMg
UG9wdWxhdGUgSW5kaXZpZHVhbCBGdW5jdGlvbnMgIw0KPiAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjDQo+IA0KPiAgICAgI1RoZSBvcmRlciBmdW5jdGlvbnMgYXJlIHBvcHVs
YXRlZCBoZXJlIHdpbGwgYmUgcmVmbGVjdGVkIGluIHRoZQ0KPiAgICAgIyBvcmRlciBvZiBkZXNj
cmlwdG9ycyB3cml0dGVuLg0KPiANCj4gICAgICMjIyMjIyMjIw0KPiAgICAgIyBSTkRJUyAjDQo+
ICAgICAjIyMjIyMjIyMNCj4gICAgICNOb3RlISBJZiBSTkRJUyBpcyBlbmFibGVkLCBpdCAqaGFz
KiB0byBiZSB0aGUgZmlyc3QgZnVuY3Rpb24hIE90aGVyd2lzZSwgV2luZG93cyAxMCB3aWxsIHJl
cG9ydCBlcnJvciAxMCAoZmFpbGVkIHRvIHN0YXJ0IGRldmljZSkuDQo+ICAgICAjIChJdCdzIHVu
Y2xlYXIgd2h5IHRoaXMgaXMgdGhlIGNhc2UuLikNCj4gICAgICMgaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vZG9jcy5taWNyb3NvZnQuY29tL2VuLXVzL2Fuc3dlcnMvcXVlc3Rp
b25zLzQ3NDEwOC9kb2VzLXJuZGlzLW5lZWQtdG8tYmUtbGlzdGVkLWFzLXRoZS1maXJzdC1mdW5j
dGlvbi5odG1sX187ISFBNEYyUjlHX3BnIWYyRG11a0JDei1uMmRYUlREVGQyMllqSGRYZ0tYV1p3
Q0x0dXdvQjRTZGpXLVU3czJzOUN5ZXo0LUpqbUhKTnpoZXR4ZFgwNmE2aW9oVl8xeWo3YnBxMkhh
MjhVUldDVE5RJCANCj4gICAgICMgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
c3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzY4MzY1NzM5L3dpbmRvd3Mtcm5kaXMtY29tcGF0
aWJsZS1kZXZpY2UtZG9lcy1ybmRpcy1uZWVkLXRvLWJlLWxpc3RlZC1hcy10aGUtZmlyc3QtZnVu
Y3RfXzshIUE0RjJSOUdfcGchZjJEbXVrQkN6LW4yZFhSVERUZDIyWWpIZFhnS1hXWndDTHR1d29C
NFNkalctVTdzMnM5Q3llejQtSmptSEpOemhldHhkWDA2YTZpb2hWXzF5ajdicHEySGEyLUh0enpY
b2ckIA0KPiAgICAgaWYgWyAwID0gMSBdDQo+ICAgICB0aGVuDQo+IAlta2RpciBmdW5jdGlvbnMv
cm5kaXMudXNiMA0KPiAJbWtkaXIgLXAgZnVuY3Rpb25zL3JuZGlzLnVzYjAvb3NfZGVzYy9pbnRl
cmZhY2Uucm5kaXMNCj4gDQo+IAkjIFNldCBjb21wYXRpYmxlIC8gc3ViLWNvbXBhdGlibGUgaWQn
cyBzbyB0aGF0IFdpbmRvd3MgY2FuIG1hdGNoIHRoaXMNCj4gCSMgZnVuY3Rpb24gdG8gUk5ESVM2
IGRyaXZlciBtb3JlIGVhc2lseS4NCj4gCWVjaG8gUk5ESVMgICA+IGZ1bmN0aW9ucy9ybmRpcy51
c2IwL29zX2Rlc2MvaW50ZXJmYWNlLnJuZGlzL2NvbXBhdGlibGVfaWQNCj4gCWVjaG8gNTE2MjAw
MSA+IGZ1bmN0aW9ucy9ybmRpcy51c2IwL29zX2Rlc2MvaW50ZXJmYWNlLnJuZGlzL3N1Yl9jb21w
YXRpYmxlX2lkDQo+IA0KPiAJbWtkaXIgLXAgY29uZmlncy9jLjENCj4gCW1rZGlyIC1wIGNvbmZp
Z3MvYy4xL3N0cmluZ3MvMHg0MDkNCj4gCWVjaG8gIjB4QzAiID4gY29uZmlncy9jLjEvYm1BdHRy
aWJ1dGVzICMgU2VsZiBwb3dlcmVkDQo+IAllY2hvICJjb25mMSIgPiBjb25maWdzL2MuMS9zdHJp
bmdzLzB4NDA5L2NvbmZpZ3VyYXRpb24NCj4gCWxuIC1zIGZ1bmN0aW9ucy9ybmRpcy51c2IwIGNv
bmZpZ3MvYy4xDQo+IAlpZiBbICEgLUwgb3NfZGVzYy9jLjEgXQ0KPiAJdGhlbg0KPiAJICAgIGxu
IC1zIGNvbmZpZ3MvYy4xIG9zX2Rlc2MNCj4gCWZpDQo+ICAgICBmaQ0KPiANCj4gICAgICMjIyMj
IyMjIw0KPiAgICAgIyBOQ00gICAjDQo+ICAgICAjIyMjIyMjIyMNCj4gICAgICNVc3VhbGx5IEkg
dGVzdCB3aXRoICplaXRoZXIqIFJORElTIG9yIE5DTSBlbmFibGVkLCBidXQgbm90IGJvdGgsIGhl
bmNlIHRoZSBpZigwKSBoZXJlLi4NCj4gICAgIGlmIFsgMSA9IDEgXQ0KPiAgICAgdGhlbg0KPiAJ
bWtkaXIgZnVuY3Rpb25zL25jbS51c2IwDQo+IAlta2RpciAtcCBmdW5jdGlvbnMvbmNtLnVzYjAv
b3NfZGVzYy9pbnRlcmZhY2UubmNtDQo+IAkjIFNldCBjb21wYXRpYmxlIGlkIHNvIHRoYXQgV2lu
ZG93cyAxMCBjYW4gbWF0Y2ggdGhpcyBmdW5jdGlvbiB0bw0KPiAJIyBOQ00gZHJpdmVyIG1vcmUg
ZWFzaWx5Lg0KPiAJZWNobyBXSU5OQ00gICA+IGZ1bmN0aW9ucy9uY20udXNiMC9vc19kZXNjL2lu
dGVyZmFjZS5uY20vY29tcGF0aWJsZV9pZA0KPiANCj4gCW1rZGlyIC1wIGNvbmZpZ3MvYy4xDQo+
IAlta2RpciAtcCBjb25maWdzL2MuMS9zdHJpbmdzLzB4NDA5DQo+IAllY2hvICIweEMwIiA+IGNv
bmZpZ3MvYy4xL2JtQXR0cmlidXRlcyAjIFNlbGYgcG93ZXJlZA0KPiAJZWNobyAiY29uZjEiID4g
Y29uZmlncy9jLjEvc3RyaW5ncy8weDQwOS9jb25maWd1cmF0aW9uDQo+IAlsbiAtcyBmdW5jdGlv
bnMvbmNtLnVzYjAgY29uZmlncy9jLjENCj4gCWlmIFsgISAtTCBvc19kZXNjL2MuMSBdDQo+IAl0
aGVuDQo+IAkgICAgbG4gLXMgY29uZmlncy9jLjEgb3NfZGVzYw0KPiAJZmkNCj4gICAgIGZpDQo+
IA0KPiAgICAgIyMjIyMjIyMjDQo+ICAgICAjIEFDTSAgICMNCj4gICAgICMjIyMjIyMjIw0KPiAg
ICAgaWYgWyAxID0gMSBdDQo+ICAgICB0aGVuDQo+IAlta2RpciAtcCBmdW5jdGlvbnMvYWNtLkdT
MA0KPiANCj4gCW1rZGlyIC1wIGNvbmZpZ3MvYy4xDQo+IAlta2RpciAtcCBjb25maWdzL2MuMS9z
dHJpbmdzLzB4NDA5DQo+IAllY2hvICIweEMwIiA+IGNvbmZpZ3MvYy4xL2JtQXR0cmlidXRlcyAj
IFNlbGYgcG93ZXJlZA0KPiAJbG4gLWZzIGZ1bmN0aW9ucy9hY20uR1MwIGNvbmZpZ3MvYy4xDQo+
IAlpZiBbICEgLUwgb3NfZGVzYy9jLjEgXQ0KPiAJdGhlbg0KPiAJICAgIGxuIC1zIGNvbmZpZ3Mv
Yy4xIG9zX2Rlc2MNCj4gCWZpDQo+ICAgICBmaQ0KPiANCj4gICAgICNBY3RpdmF0ZS9iaW5kIFVT
QiBnYWRnZXQNCj4gICAgIGVjaG8gMmYwMDAwMC51c2IgPiBVREMNCj4gfQ0KPiBjb21tYW5kPSRA
DQo+IA0KPiBjYXNlICR7Y29tbWFuZH0gaW4NCj4gICAgIHN0YXJ0KQ0KPiAJZWNobyAiU3RhcnRp
bmcgdXNiLWxjIg0KPiAJc3RhcnQNCj4gCSNpZmNvbmZpZyBsYyAxNjkuMjU0LjEwMC4xMDEgbmV0
bWFzayAyNTUuMjU1LjI1NS4yNTIgIyBmb3IgZGVidWcNCj4gICAgIDs7DQo+ICAgICBzdG9wKQ0K
PiAJZWNobyAiU3RvcHBpbmcgdXNiLWxjIg0KPiAJc3RvcA0KPiAgICAgOzsNCj4gICAgIHJlc3Rh
cnQpDQo+IAlzdG9wDQo+IAlzdGFydA0KPiAJOzsNCj4gDQo+ICAgICAqKQ0KPiAJZWNobyAiQ3Jl
YXRlIFVTQiBHYWRnZXQgZGV2aWNlIGR1YWwgTkNNIGFuZCBybmRpcyBWMC4xLjEgZm9yIE1BQywg
TGludXggYW5kIFdpbmRvd3MiDQo+IAlleGl0IDENCj4gCTs7DQo+IGVzYWMNCj4gDQo+IA0KPiBU
aGlzIGdpdmVzIG1lIGFuIGVycm9yOg0KPiANCj4gLi9jb25maWdfZ2FkZ2V0LnNoIHN0YXJ0DQo+
IFN0YXJ0aW5nIHVzYi1sYw0KPiBzaDogd3JpdGUgZXJyb3I6IERldmljZSBvciByZXNvdXJjZSBi
dXN5DQo+IA0KPiB0aGUgbGluZSBjYXVzaW5nIHRoYXQgaXM6DQo+IGVjaG8gMmYwMDAwMC51c2Ig
PiBVREMNCj4gDQo+IEp1c3QgY3JlYXRlIGVpdGhlciBOQ00gb3IgQUNNIHdvcmtzLCBidXQgbm90
IGJvdGgNCg0KTm90IHN1cmUuIFlvdSBtYXkgbmVlZCB0byB0cmFjZSB0aHJvdWdoIHRoZSBjb2Rl
IHBhdGggYW5kIHNlZSB3aGVyZSBpdA0KZmFpbHMuDQoNCkJSLA0KVGhpbmg=
