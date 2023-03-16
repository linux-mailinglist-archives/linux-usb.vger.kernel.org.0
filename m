Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61256BCE0F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 12:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjCPLUo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 07:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjCPLU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 07:20:27 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D48F968D5
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 04:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0zS4Qu3aFOcZyTNPky7uE/YSL8lYeAYfmtHgVNMDHEvdyUDKVBFp/rls9vp8QpiuFtu2wAUk78qApkgq5atkahwJB6bqJc/3entnhq3RWidzzFVUiWpYe4aBxuDPEZ0eDl5nZBxikoOtjD+RxWHV+0UsD+ju3ZZTmLcYFqo/PI/722qNSPTNRNmlzhZ7SyKTtC9u6T3WzydbhudRwMuS8PO6l3MqZOfA6OqPi3Ela1qt+s38yE2NvMQEepJwx3bCSosYoyKC40Do9TnvSkx4hv3dayQan8t2NBqEdT+ihJWCxwwP0vcAHssPp4h11nTC7LbNJ1vrV3QdqGPakNzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIR6U/yvx3Y8l0L+nmDHrkihyQ/+N0b/r2yZz8Zu03I=;
 b=TlDj8j0e+MY/Yt02R694RIVIszalJagvprbKEOi3miD5mOPTY7yxLL2ueJtwkIUexJCFIccAZv2y7pOjD8c/9RQcS0TAQzGLFLRLrZJMOAdKyC8tCm2BCLAADId1cLylvt+1pZ01luquD+R2P9nrVj4h7cRShpJmDrcrtjfN9H2h6zRwmzN8J/N0pxskhjsq3vFpdv2wKxaJKdfzUGa7MC6pziwzQC+6AOTMxcwoMjFB0SNPEnvDAVS0eS7EiVycJsjgJYjaeafhB50QAs4qVpa9FOluk9MMPA3SEudONN3SENuoQg55vfanm078WDoKcnb16rCaxVUKqBhJf0cJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIR6U/yvx3Y8l0L+nmDHrkihyQ/+N0b/r2yZz8Zu03I=;
 b=DncbWQYWGhCMwSb4XusaWZx4Se75GkjOtb/p+s32Er10lUrqjbA4+6HH/W8hA818kzgmOj7FLmfm6BDsHE0U3h/OHSvdkDRr/l2sWSsqZNaagv4MKgfPTMcFzK+113AkVBsBMip+EyyAeNPMTXB3D/m+6Sb/+pIHpvKW+9z/Q8e+WHYYvC4eKFBZ3bzLUjVrucpHA3lLS9InQkBh97UykWs8hodo/Mokp8iv9KCIAQJ8CT35iJUGHYL1wqapvTi5m2mBLQatDPU7C2IkMbk7zZkq9WtKo4uHyfQJsPXh4b9Z0ZkjFPz/3JCBj05mXTIYzbFqRh9dbH3fk8srV8aonw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CY5PR10MB6192.namprd10.prod.outlook.com (2603:10b6:930:30::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 11:19:39 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.022; Thu, 16 Mar 2023
 11:19:39 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Topic: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Index: AQHZUzTnvuOBWwNTH0CfFBqIVx8BD67zxl4AgAAqsICABle4AIAC/NSAgAAGYAA=
Date:   Thu, 16 Mar 2023 11:19:39 +0000
Message-ID: <c409e5c75d65344dfa9f065f4f6eeb585c06833f.camel@infinera.com>
References: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
         <ZAr+eiTrUN/LV3YN@kroah.com>
         <b626ba525751345e59da4af438c4adf2c833ca0a.camel@infinera.com>
         <7d2287ea03069b702b8da2157f8148b820de4446.camel@infinera.com>
         <ZBL18fPCgckibrcg@kroah.com>
In-Reply-To: <ZBL18fPCgckibrcg@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CY5PR10MB6192:EE_
x-ms-office365-filtering-correlation-id: efec3044-64e4-4bd8-51ce-08db26105547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DtZ66TDLszh6LY9CFd1AAS8jcmRBAb1snVIL+yYPunaESsyeiYu+UjWxcdn5x3+E2M+m1iReBn3NLin9w5BxjRRnmaL3M7Lnm3NbjAgtvPncUZP4LshJL9JtXwgMtbzCnPYJVqDQH6a9OD0gtnynrqEx55d+R0oLLIlVfFXahpHY1dPdELubYHw6Ip1aVXTSATgJNU25CpG7gmiG2Ve5z6+QuaU1lJKZXBfK2+ZH1SfadD6+yM49W7JppQ2ZoOzfdZyhi3GtUElt8eiUiaIAxkBUNOGxktQfZSlkmy+ZKfaiWaHkSdmjy5Zqil+Ksc/geUuARkwvGrBh8fWLHlVwIb+eccO+SDL1HSXm36ovG6HtPen2jaKurQEPhz3IxGy5cK/DKI6Q9GS4W4vRSIV4vkcOK3hF3C7E11A0afHd3U1CsmMTHKDPf8aMLqmQVTpS/yTvzC9tyWmTgIV/udi8AUhYMi1aIFiodIXUfo3EN+FcCYJiHihHnnVFVeN51Kfg4WOzxW33zT2Zei7v41q+0yA+plXx46cMcsQGVCL55gSj6225JhBjuzQ4WmKZfKjejSf2xoQuG1Q21GaRRTfFl6vNBGe6RHsjFKszvQveAhIjObBpUo8SvYhXDOXISgVtAMpzf+m7QOHge7SW06sLuQ0MzH5EVAB8W0gQWSBjHb8fQ9mjb5z5+/4dWi5bopU6Y/SZpqUDJzU5K8BkXalWZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199018)(36756003)(41300700001)(5660300002)(8936002)(2906002)(38070700005)(38100700002)(86362001)(122000001)(478600001)(71200400001)(91956017)(66556008)(66476007)(66446008)(64756008)(8676002)(76116006)(6916009)(6486002)(66946007)(83380400001)(4326008)(316002)(186003)(2616005)(6512007)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1h6T2xwOEdhMnpacUFuSFlIMHJHeUVlRnJhMCtMVXBRSkJnRGtQc0E3QS9O?=
 =?utf-8?B?RnM5c0hyWlBqYklsbXRIKzNoRHpqSkdtUXE1bkhLYVJvWEFMWWR5STgzUUVB?=
 =?utf-8?B?L3F5cnA0ZXJBcEFOV2xWOU1qT2U4K3V1YVlDT0VIRkhWSHhIZEFEZGNYd05B?=
 =?utf-8?B?bksrZ2Y3RDhQR29RRE1DclNoKzNoNFpXUEQzUThmeUlWdGFnY0srWkNlcHpR?=
 =?utf-8?B?ZTVEejBpSlpZeVRVTkJVZVVhSnRvNU93UXpTSjRyM3YyYnJsbmNOeGJqUTQv?=
 =?utf-8?B?YTRWRXdTYzc4Z2lFRjU3R0RyWXhRbitzK210MG9uRlpvN1lYdkhrTjFpcy9y?=
 =?utf-8?B?bzdGaU9BMGZVbThCZFRydDYrS1hIMTRTQW5xSVBHaUI0NWo4Q1VJZlB0SSsz?=
 =?utf-8?B?RUFtM3l0TnRpbWlQd3ozejJVdG1uN1BnZDBScERpMDZtSTBlM3FhUXNLVUtK?=
 =?utf-8?B?OW1HQ1czVkFzMUJUalZYL3VhOXd5WnZBejd4cFhibmp1R09sMEdQckxoWkRY?=
 =?utf-8?B?NlpXNm85REMxZWVkRzFqK2dBdGI5ZDlteHNIZnRtRThwbmJJVW9JUHpmRHZ4?=
 =?utf-8?B?RHF5WENDdlFXUmNJTjdoUlZJTDBWR1V2bG9KclJKMDRoT3ltNzcvUHZpNmtB?=
 =?utf-8?B?RnZHV3plS3F5dG42aUliVFRVQVY3SmxQS3Rkb0NTTnlrZUU3VWorbFdTbGZ5?=
 =?utf-8?B?SFhyM1ZFWEhkY1o1YTZTemg2NDN5RTNSd1h6djh0WllhU0pCOXU3dm0xZ2k5?=
 =?utf-8?B?SCtmZ1ZEU0JYWXhkZFcyMWFydkF4NmR3b3g4Um0yV2tmSWhLalFGSUpSZnRz?=
 =?utf-8?B?eWlnc09tK3h0WEhvUW5qVTdhakFuQlRob1M5eDFNUzN3Y0Y0dUxndFVSUll2?=
 =?utf-8?B?eHk2QmkvK3JGUnlnUWhTZXFUM3NFVnkrZzFDdXBicXhiQlMrSDVVaWpkY3Fh?=
 =?utf-8?B?T1VHZkdhVVZLRmlrQ2JOZjQ3MHluQzJCS0xmdy9tYWZqbVBWVXM4WGR1Z2Er?=
 =?utf-8?B?bDRKYTk3RnUrOTkwb0NBL0IxTFlsallkWmhDUittWkdmZ2h1ZkN6ZUxMUUpw?=
 =?utf-8?B?VUlHZUdXL015dE80TUtHWmxhNmxMS2VXUStSSVB6UkFsUnZyc2pCMTN5MmVO?=
 =?utf-8?B?U3B6dHlBVnNpeGRvYmRUcHJOS3NxTitCK3RxTlF2NjRqaHJCSmJGbDVMNVln?=
 =?utf-8?B?U2VXRUJucWMwMk1uU1hNTWN1VXl1UFhkNzI5ckJDY3BNZzNVL0FGNUh3aDBL?=
 =?utf-8?B?a0s3ZW9QWTltc2h4ejA1OEoxaW9Wa0VkaUVmYzNkT0lIUHAvTXhxUXFnRjRS?=
 =?utf-8?B?Q2JGN050QWdZaWd3amxZdGVmNVM3a2N6aHRPcXVMVXZ4cTF3Nk1EZExUQU94?=
 =?utf-8?B?amJpd1doc3RRb0RrM3g4bDdSaGVaS1hLVDRobTczTTZHWXZqRDNlY2JtMG1y?=
 =?utf-8?B?a0VTNE5qRXp5RTRFSE5FbWRZRE5FZG9rOCs4MWdaa0lkVXN3b2Q1WHhLTy9O?=
 =?utf-8?B?K1cyNFp1VVRBQzR4Ly9vcy9OTlhOdkQxdGExMFZLcGJOWWtuMlFyWFVPZkll?=
 =?utf-8?B?NEg3R3pwcHErRjlnTlNJRTk2eC9LdmdCWVZmZjNwMWlYUnNqaVV4aVBqU3dl?=
 =?utf-8?B?akJUeGRyUGpaQTJOKzB2UEhUVUJTS25NTHV5QkhsSzRhdTdrU0xCWGVrSFM3?=
 =?utf-8?B?dEprRHhENzNTL1hVb0VFMnZ0Wmg3ZmNWRm9wUHFIK2IrcThGWHlNd1FvRmR2?=
 =?utf-8?B?N2c5bEJhRE5kRTNtbVVKOU5TSHcxV0RQV3UvZ25vMFJhaHJ5VDJ0Y1lwZWxO?=
 =?utf-8?B?a1FzOG5uanZNeXNsenJ2RTJjME1XVEQ1bUo1Vmd5Q1QzU0wwOTJrTHFZZkJX?=
 =?utf-8?B?T0VlalF4WGFVWGxDM0c0ckFXK0xBb1dremtCMFg3SGVUYm9NNW1jMEhYMFhq?=
 =?utf-8?B?VkdobFNZaUk4MlhjTmtjU3R5OGN6cEZDNi9oT1VkQkpON3dDbXJqTllSSzIr?=
 =?utf-8?B?UXhaajVwM1VNRW9NMEI1WVBGUEZDSEVlV0p4ZUNnbXhzWDlDR1h2SWpZWCtr?=
 =?utf-8?B?MTlIVk85TGFXcWRMVHRrZFhwQnZDeDlaaUhZalhrVjBrdHVsUk8rSWM5NnNr?=
 =?utf-8?B?dzVlTmVGMjdEYlVSWDdDbFIvSjFKQzM2cy9Tb3dzcjZIRnc4K045WDcyaksy?=
 =?utf-8?Q?KGbOlywcMe/9PtZdYmNhF5lKW4QwJx5+Z4f679FBHt8i?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0DF6EFBF0F46D4A884C61C211F9F9C4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec3044-64e4-4bd8-51ce-08db26105547
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:19:39.4501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/HD020XxLLcVLPh3KUk43i0dyGidR2yb3FjAQX26WMg0doinR6++B150D0qA9nuBcu/Gz2mmoGWElFnvigDoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6192
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIzLTAzLTE2IGF0IDExOjU2ICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMDE6MTk6MjVQTSArMDAwMCwg
Sm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjMtMDMtMTAgYXQgMTM6Mjcg
KzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiBPbiBGcmksIDIwMjMtMDMtMTAg
YXQgMTA6NTUgKzAxMDAsIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlOg0KPiA+ID4g
PiBPbiBGcmksIE1hciAxMCwgMjAyMyBhdCAwOTo0NDoyNkFNICswMDAwLCBKb2FraW0gVGplcm5s
dW5kIHdyb3RlOg0KPiA+ID4gPiA+IFRoZSBvbGQgUk5ESVMvTkNNIGNvbmZpZ3MgZG9lcyBub3Qg
d29yayBhZ2FpbnN0IG1vZGVybiBXaW5kb3dzLiBJIHdvbmRlciBpZiB0aGVyZQ0KPiA+ID4gPiA+
IHNob3VsZC9jb3VsZCBiZSB1cGRhdGVkIHRvIHdvcmtpbmcgc3RhdGUgPw0KPiA+ID4gPiANCj4g
PiA+ID4gUGxlYXNlIG5ldmVyIHVzZSBSTkRJUyBvbiBtb2Rlcm4gc3lzdGVtcyB1bmxlc3MgeW91
IGZ1bGx5IHRydXN0IHRoZQ0KPiA+ID4gPiAib3RoZXIgc2lkZSIgb2YgdGhlIGNvbm5lY3Rpb24g
YXMgaXQgaXMgbm90IGEgc2VjdXJlIHByb3RvY29sIGJ5IGFueQ0KPiA+ID4gPiBtZWFucy4NCj4g
PiA+IA0KPiA+ID4gWWVzLCB3ZSB3aWxsIG1vdmUgdG8gTkNNIChuZXcgaW4gPj0gV2luZG93cyAx
MCkNCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gTkNNIHNob3VsZCAianVzdCB3b3JrIiBpbnN0
ZWFkLiAgV2hhdCBleGFjdGx5IGlzIGZhaWxpbmcsIGFuZCB3aGF0DQo+ID4gPiA+IHNwZWNpZmlj
YWxseSBkbyB5b3UgbWVhbiBieSAibW9kZXJuIFdpbmRvd3MiPw0KPiA+ID4gDQo+ID4gPiBOQ00g
ZG9lcyBub3QganVzdCB3b3JrIG9uIFdpbmRvd3MgPj0gMTAgaXQgbmVlZHMgY29uZmlnZnMgc2V0
dGluZ3M6DQo+ID4gPiANCj4gPiA+IE5DTSBzbmlwcGVkOg0KPiA+ID4gCWVjaG8gMSAgICAgICA+
IG9zX2Rlc2MvdXNlDQo+ID4gPiAJZWNobyAweGJjICAgID4gb3NfZGVzYy9iX3ZlbmRvcl9jb2Rl
DQo+ID4gPiAJZWNobyBNU0ZUMTAwID4gb3NfZGVzYy9xd19zaWduDQo+ID4gPiANCj4gPiA+IAlt
a2RpciBmdW5jdGlvbnMvbmNtLnVzYjANCj4gPiA+IAlta2RpciAtcCBmdW5jdGlvbnMvbmNtLnVz
YjAvb3NfZGVzYy9pbnRlcmZhY2UubmNtDQo+ID4gPiAgICAgI1NldCBjb21wYXRpYmxlIGlkIHNv
IHRoYXQgV2luZG93cyAxMCBjYW4gbWF0Y2ggdGhpcyBmdW5jdGlvbiB0bw0KPiA+ID4gICAgICMg
TkNNIGRyaXZlciBtb3JlIGVhc2lseS4NCj4gPiA+IAllY2hvIFdJTk5DTSAgID4gZnVuY3Rpb25z
L25jbS51c2IwL29zX2Rlc2MvaW50ZXJmYWNlLm5jbS9jb21wYXRpYmxlX2lkDQo+ID4gPiANCj4g
PiA+IAlta2RpciAtcCBjb25maWdzL2MuMQ0KPiA+ID4gCW1rZGlyIC1wIGNvbmZpZ3MvYy4xL3N0
cmluZ3MvMHg0MDkNCj4gPiA+IAllY2hvICJjb25mMSIgPiBjb25maWdzL2MuMS9zdHJpbmdzLzB4
NDA5L2NvbmZpZ3VyYXRpb24NCj4gPiA+IAlsbiAtcyBmdW5jdGlvbnMvbmNtLnVzYjAgY29uZmln
cy9jLjENCj4gPiA+IAlpZiBbICEgLUwgb3NfZGVzYy9jLjEgXQ0KPiA+ID4gCXRoZW4NCj4gPiA+
IAkJIGxuIC1zIGNvbmZpZ3MvYy4xIG9zX2Rlc2MNCj4gPiA+IAlmaQ0KPiA+ID4gDQo+ID4gPiBO
ZXcgUk5ESVMgaW4gV2luZG93cyA+PSAxMA0KPiA+ID4gCWVjaG8gMSAgICAgICA+IG9zX2Rlc2Mv
dXNlDQo+ID4gPiAJZWNobyAweGJjICAgID4gb3NfZGVzYy9iX3ZlbmRvcl9jb2RlDQo+ID4gPiAJ
ZWNobyBNU0ZUMTAwID4gb3NfZGVzYy9xd19zaWduDQo+ID4gPiANCj4gPiA+IAlta2RpciBmdW5j
dGlvbnMvcm5kaXMudXNiMA0KPiA+ID4gCW1rZGlyIC1wIGZ1bmN0aW9ucy9ybmRpcy51c2IwL29z
X2Rlc2MvaW50ZXJmYWNlLnJuZGlzDQo+ID4gPiANCj4gPiA+IAkjU2V0IGNvbXBhdGlibGUgLyBz
dWItY29tcGF0aWJsZSBpZCdzIHNvIHRoYXQgV2luZG93cyBjYW4gbWF0Y2ggdGhpcw0KPiA+ID4g
ICAgICMgZnVuY3Rpb24gdG8gUk5ESVM2IGRyaXZlciBtb3JlIGVhc2lseS4NCj4gPiA+IAllY2hv
IFJORElTICAgPiBmdW5jdGlvbnMvcm5kaXMudXNiMC9vc19kZXNjL2ludGVyZmFjZS5ybmRpcy9j
b21wYXRpYmxlX2lkDQo+ID4gPiAJZWNobyA1MTYyMDAxID4gZnVuY3Rpb25zL3JuZGlzLnVzYjAv
b3NfZGVzYy9pbnRlcmZhY2Uucm5kaXMvc3ViX2NvbXBhdGlibGVfaWQNCj4gPiA+IA0KPiA+ID4g
CW1rZGlyIC1wIGNvbmZpZ3MvYy4xDQo+ID4gPiAJbWtkaXIgLXAgY29uZmlncy9jLjEvc3RyaW5n
cy8weDQwOQ0KPiA+ID4gCWVjaG8gImNvbmYxIiA+IGNvbmZpZ3MvYy4xL3N0cmluZ3MvMHg0MDkv
Y29uZmlndXJhdGlvbg0KPiA+ID4gCWxuIC1zIGZ1bmN0aW9ucy9ybmRpcy51c2IwIGNvbmZpZ3Mv
Yy4xDQo+ID4gPiAJaWYgWyAhIC1MIG9zX2Rlc2MvYy4xIF0NCj4gPiA+IAl0aGVuDQo+ID4gPiAJ
IAlsbiAtcyBjb25maWdzL2MuMSBvc19kZXNjDQo+ID4gDQo+ID4gDQo+ID4gRGlkIHRoaXMgbWFr
ZSBhbnkgc2Vuc2UgdG8geW91ID8gVGhlIG9sZCBsZWdhY3kvYnVpbHRpbiBjb25maWdzIGRvZXMg
bm90IGRvIGFueSBvZiB0aGlzLg0KPiANCj4gU29ycnksIEkgZG8gbm90IGhhdmUgYW55IFdpbmRv
d3MgbWFjaGluZXMgdG8gdGVzdCB3aXRoIHNvIEkgcmVhbGx5IGRvDQo+IG5vdCBrbm93LiAgSWYg
eW91IHRoaW5rIHRoZSBkZWZhdWx0cyBhcmUgY3VycmVudGx5IHdyb25nLCBwbGVhc2Ugc3VibWl0
DQo+IGEgcGF0Y2ggdG8gZml4IHRoZW0gdXAuDQoNClRoZXkgYXJlIHdyb25nIGZvciBXaW4gPj0g
MTAsIHRoYXQgbXVjaCBpcyBzdXJlLg0KDQpJbiB0aGUgMTpzdCBtYWlsIGluIHRoaXMgc2VyaWVz
IEkgc2hvd2VkIHdoYXQgSSBoYWQgZG9uZSB0byBjaGFuZ2UgdGhlDQpkZWZhdWx0cyBieSBtaW1p
Y2tpbmcgdGhlIHNldHVwIGZyb20gY29uZmlncyh0aGF0IHdvcmtzKSBpbnRvIGNvZGUgaW4gbGVn
YWN5IGFyZWENCmJ1dCBJIGNhbm5vdCBtYWtlIGl0IHdvcmsuIFRoaXMgbmVlZHMgc29tZW9uZSB3
aG8ga25vd3MgaG93IGNvbmZpZ2ZzIHdvcmtzDQphbmQgY2FuIGNvZGlmeSBpdCBpbnRvIGxlZ2Fj
eSBDIGNvZGUobm90IG1lIG9idmlvdXNseSkNCg0KIEpvY2tlDQo=
