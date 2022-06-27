Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B217455D582
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239711AbiF0Q4M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 12:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235437AbiF0Q4M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 12:56:12 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3A618B2D
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 09:56:11 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C874A46936;
        Mon, 27 Jun 2022 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1656348971; bh=DgXLvJLckW+N18j1nUn+mozFIEbuayMfUfgrmKUyrxE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AhOFbkZoQnRbRYt6vhJUyV0HRjv1iCU7tQIyp2bQlXBhYpnr9CMLuuu0WCdJ7ZJgV
         +2p0do9Kktc6ng2nn0sNEegPjcOTrfm63NdOBuu7vDg4xKFq/AccWGUMLMxzS5Wcb4
         MLpMDcW2S6DLXymEkGneG7QXi5OmG/Oc9d6dtlmwqg17jLI1qFK4erVfM/FGenmhyv
         2hWiefkUAc8RM4/dwLeaI8JyidgP2nGln96DlPywxLzBFVzSx1g9a6sjrMn/G/cRLG
         WMWqoP9pLNQlTf4DrXTIMiysh6l4vADpMF+kR0VmMIUG/JaBJIjb8b+x3QvFJNKP8A
         B/KMeO9A1mNpQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E1EC7A0076;
        Mon, 27 Jun 2022 16:56:09 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9EA7240085;
        Mon, 27 Jun 2022 16:56:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LzOqDq1g";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNt+qSxd11QgGEqDIZWihTu2CsLa5bGV+huUaxY0UZpfW3vQDDd6g1E0BdrWQg25vgGehs6n9A875PpqoKSV8x0rUjpvPjUTmEu3bV3SRcJ2NJJY1+OdiScvCQaQD9Ka2M0Xira4Gip8YBibXRukkQs3/r8x8N4J1mWg+KVgMTntw8Id1xWCSxWV++Z3PYrwWtG9jL+yKr4o3Mchgj7b4LXzNOz+gAfp9k85ub+my9QAMENLmte8SCUWfod9dJ43uor1cQ6yA91xF0uCYO78vsZhEQmOOsXM56ZLdwztaspoRQAthNTYDvbFZRIptU9ww20dJIbfdVCbdIsyRAh5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgXLvJLckW+N18j1nUn+mozFIEbuayMfUfgrmKUyrxE=;
 b=U0od4IO1ZI+l7k6mAKZKz6sJD2R7nxcMRVV5Kqdr2CSp6LMrsEBdMGzBvi1mliIgso/rjFKduagG6MyadN1GnHi9C3gfHqH4Ov+nZkEOUExMbQvylLtpEFe9U3aIacL7BZCauTtfqf2mVSFTVvcys/0zJaKNa3fFprQToTN8H5GdLcs+xlxNA5raLR6AAGrTOcshk9zaMYqdC7CUt8SZCwyemy9RNuAC5d0zbb9tHgP2FLTCYL7rvqfR8482xQZVXc53SFxil31UCY2D1dIvp1SvfM7vAs1iT6klwpCASakCJA5z/V6hHex2wl2Yn/2dsDrgV1uXU1vazv82CVsbHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgXLvJLckW+N18j1nUn+mozFIEbuayMfUfgrmKUyrxE=;
 b=LzOqDq1gxK6CE0ZJp9xK5dlCeYLpBXYDDP3PjSXn+mqj7mOU1AhjQrPlYn4LyGq9mHOGotpvjcjwCleo/F5YyXGFG4u/8XHU7ajONDEAjqU1LqH4uF6kg1cDPu3VAWwRo9gu0Q9RilvI+vXSnPwLP2t8SeaRqn+u+vfxqwt2Ops=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR12MB1676.namprd12.prod.outlook.com (2603:10b6:4:8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Mon, 27 Jun 2022 16:56:06 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::8948:d205:4d47:c54c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::8948:d205:4d47:c54c%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 16:56:05 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
Thread-Topic: [PATCH v2] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
Thread-Index: AQHYgRd2l1V9/lvpt0ebYXS1Y7e82q1jHykAgABsPIA=
Date:   Mon, 27 Jun 2022 16:56:05 +0000
Message-ID: <708f3063-cf2f-5d4e-6afd-ee1702b080e1@synopsys.com>
References: <9df529fde6e55f5508321b6bc26e92848044ef2b.1655338967.git.Thinh.Nguyen@synopsys.com>
 <400a84d5-4d23-bf67-4a80-773bf2129da0@quicinc.com>
In-Reply-To: <400a84d5-4d23-bf67-4a80-773bf2129da0@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99b57ca3-c1ba-4f6b-12d6-08da585ded1b
x-ms-traffictypediagnostic: DM5PR12MB1676:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vMFMLVrMmSYPBxidGDzjLGrhiqlVQnyjA2goMUIX/BOijazl6/IIe/CGQKTheL7Qg6xHKVoYS8Z3sTKbBjaNrde5cTnxvb+x30law5c2ac1tywf1whCzbCwizUVDKJHvzv0wzwrcwI0ezGfnSQznnajUAmZqouxkoSvUVRI99veEfbi25bjSKKyh5JI7d19OOe/oF4Fa596seEwnRcRcQeKFEbJmYEzugEYtgQWsmVrQtcxU0n91RWsMN6hURFA6sPUgP8euNBKoonKV9Inp+S+wl9f/4Mbg+p7Eht8exw8Job6DiHkQ8Fg8BuYpzUXTP/F2A6l/UUZ5q2jCErtAVyK1DdiOVWJfrItCp/+AjuVbYeFJpmtoXuLmUqHzRLrmQngvM6ejkNrf5TdODoHKkIbwYxdykmbfDGwkyjRYKUB6835PtVK0UZuoGUYGOq39+Ar/eQfG6xp+LgCTVMeiLgfjCQ0Qzsv6rk/yIVLZoJkHRt+YhMlZgmrYbDQmRkx+2pQhcFVhAm1dyHEyK0bddqlHoPhbZ51lV9J2qnnWPtttk+r3ltIaCOrTXB0p4e6TeC6QSL/WtZ37ZRJyTQWhBp+LkEHYhOQ12ATPm2u796BR+BIZ4CuqHQcz7xyYdO0YnI+RTpPsZqZYHqpos3pJyfKVjeWDNHM4yQwwW7H9j23Onemhuk5i0tvjyYaDaYgsrHhrX2cf+fbFdE1mhp8aM2BKoUu/wwv2AG58rFKzrpQjaxWQgzkkHwepgnVeEhJoIBZ5WIPcIn9vpfpppVCB16fnf+8xAeBq5cnxL2lOlNKgOdZVnlf8LRmmraTujRbFhua26Cll/h4/mz6XVmtLo7Qf4oZFcEfO+Kv6ws3NNeIpPE/minHaGCbdDs9hzh3L82G8i/GgDayplQqwlUB7Ww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(39860400002)(396003)(346002)(31696002)(6512007)(110136005)(53546011)(38070700005)(5660300002)(26005)(38100700002)(2906002)(316002)(186003)(83380400001)(478600001)(36756003)(64756008)(66946007)(66556008)(41300700001)(122000001)(66446008)(66476007)(6486002)(8676002)(2616005)(107886003)(76116006)(4326008)(71200400001)(31686004)(8936002)(86362001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VStuTko4TnpwVHFYb3ZOUjNSQ1dDazVUQytzMVFSWThrblVraElkWUNzc0J2?=
 =?utf-8?B?Y0NSaWsxQ1hWSHg0T2ppK1Y2TU9KUGc1SUhXRE1vaVlYY084c2dUQ1ladFZO?=
 =?utf-8?B?ZUhWUFV3UzdxUUk1V2IxZ2kvWjVmV0RMcVc4Qmd0WTFMa1c4TUV3K3B3blFX?=
 =?utf-8?B?NFR4NVBBWXdGZzZxcmlIZUIyVGZHcU1vYkRNcEZFbEhIUHZ0ZW4rZkVrMjR5?=
 =?utf-8?B?REhSQzI1dmlNNGhLQ3ZYMUdCRURZdlJRWXF3TEZZRDZ5Nm9QaG9TT0NlNVVm?=
 =?utf-8?B?ZmRhcU9iSkxKQkZTaGYzYUZWRGtDOEZzQys5dUM3V3dwMURjeG5FTCtWelQ0?=
 =?utf-8?B?aVJrYjgzMXA0MFF3U0pQbHZnbGhKOUlxM2MzTG9mSDBHUFlqakVSUTBnUDhH?=
 =?utf-8?B?RHp5NDVyeUxBb1lzS2pVNi95a3hyQzRnQk9ldU8rU05GNFJDOFN6RTNXc0U2?=
 =?utf-8?B?RDE2L25JZDgzT29jcFVKRERWVHd4ZnpSc2xvTXYyWlN1by9rMnJ6ZllaOWlk?=
 =?utf-8?B?Ty95WTJ4a3RXU1d6Zy9rVXJTd3RvQitWbUNUVU9DSTdkd0Q4T3czNUlqRjZu?=
 =?utf-8?B?aU9vczA0dTJvK2RhdWk4MzdKa1d2LzBhdDVlU2hJdzVvblZOVEk5R3kxb2tt?=
 =?utf-8?B?bEtpMlg4akp5Vnh2ZlR0dEFzbmZnOW5WRklPLzBSUm5jcUpidis1UU5OTXB1?=
 =?utf-8?B?NGV1YjNhNC82dU1UVk1uUU0zNUlITFpkdHdjM0duN1ovdVRlQ1Z4ZStjS3NQ?=
 =?utf-8?B?Z2pidkljRlgreXhTelJieW54bks2clh6U2tUNFBMOGcyNzZPVjgwRHJrc1Fu?=
 =?utf-8?B?YVBXalBHcEQyRWFLM2Fxcit4TFE3WVAweERaQVEzRS90VmV5cUdvT3lSdERo?=
 =?utf-8?B?TnJXKzlDeWI4YVZCSk15TkFEcC9BT0lUZE9qYmhhM2dyVUxwYWwrR2lYTmVZ?=
 =?utf-8?B?YkU5dmNkcCthOE11N1lWRkhzRGFmYTNVbVFEYmFBemIrRW13Mnd3U2M4NFg1?=
 =?utf-8?B?Nk96R2I5ZWdLWWY4cE82MzIrdGVaZXg5Q09HdlpQTVBnVjVLTWRZYi9sY2VZ?=
 =?utf-8?B?Tm55YmlnVGNza0JXd0hRYWlTNHM5bDY0RDlXeHlzNTFsdW1GQldFRThNTDA1?=
 =?utf-8?B?Y2RXTk53NkxKMVlJcEVsWkVSbFdEOTF0cHRjZGpSTzJNeGVvaUdmYnVGSVlo?=
 =?utf-8?B?THNyZWowd2JTM01FRFlLT05DK0k1eGhlbjFoZ28ySDRCOWs1ZTM1U000ZUEz?=
 =?utf-8?B?L2RRR2Q3cDdueEZzU21FMGZzU0xWMUdhVFAyd0hLQkg5V3lwcjRkQ2N5Wlhk?=
 =?utf-8?B?U0xyMEU3bmFNSzl0cEpxWmhMVFVpS21CdjVsU0FQdG9hZklvcEZHL1Q1L0kz?=
 =?utf-8?B?Z2RiTTdqWnZnaFl3YyswelVsV2NGNURtVzIwcE9vVDlLVEVNODFXVXpybzBw?=
 =?utf-8?B?dFRwYXVzc1B2N0dtMFBYSlFad3dQL09FVjFPcWcyYitZeTF2bmdHMENJMFRx?=
 =?utf-8?B?THBXREhpdkRnY3ZUMTdlUVdvRHE2ekVoOEdERThnUXhnMlYxN2lIa2J5Rmoy?=
 =?utf-8?B?NmhDaGg1NjltZUNBdTZuR2gzbzhMM3FXWFd6OG0yTFZIWXk0WGkrV3lMQ29t?=
 =?utf-8?B?emY2a3hhbnNzSlpQL2wxUW5QcEwzenhhNHFhOWtqVCtDT2VsQk44UFZmSGJH?=
 =?utf-8?B?djJ1MmRCa1U3MFhvM1hvVlM4cjJhZ2tkWmNDVXlYZ3pIK3pFamJBaTBmY2FF?=
 =?utf-8?B?LzYxVVNvWHlmeGt5WGh4eVJyT25KSENoc1M1eEhzL0c2Wm5ickUzVGg0YXlS?=
 =?utf-8?B?QzNCU2c3VFdBRFhZWEYxYXVuZmN6bWhqSXE3NHhyRkh3eFFMS1JEVE9PMzBC?=
 =?utf-8?B?YTdEY3Zra0E4NUdjRUdJdURZM09wT2pMeE5VaWdXbWJnTmtNNjZPOUtCNXRv?=
 =?utf-8?B?aFJzYS9FY3NXZ1ZNTEZ4THJwVU9ob2c4dnNQWVFnbWp6VENCampyM1VRbUZP?=
 =?utf-8?B?Y1EzUlpjL2V2V1BIYjZIQWhXTUxCU2hSVEFGU2t3WXY1QnJ3N1RkVkFZTk0r?=
 =?utf-8?B?WDgzRmdndFVIQXlQNDdvdHVWemFsRnIzUklab0c4ZkpGWVhpbStwV2FCT1dC?=
 =?utf-8?Q?2x5k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AD843C98C847344947C28304B5CBBBE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b57ca3-c1ba-4f6b-12d6-08da585ded1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 16:56:05.9211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8CslQnENOTQC+VeFYSwJ7Lq6+Z1xRLHciENtQM2h5Di49By5j/TnGtGJrlGvKfpHZTgjahxc7PAEfaNg+POoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1676
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNi8yNy8yMDIyIDM6MjggQU0sIFVkaXB0byBHb3N3YW1pIHdyb3RlOg0KPiBIaSBUaGluaCwN
Cj4NCj4gT24gNi8xNi8yMiA1OjU0IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBTeW5vcHN5
cyBJUCBEV0NfdXNiMzIgYW5kIERXQ191c2IzMSB2ZXJzaW9uIDEuOTBhIGFuZCBhYm92ZSBkZXBy
ZWNhdGVkDQo+PiBHQ1RMLkNPUkVTT0ZUUkVTRVQuIFRoZSBEUkQgbW9kZSBzd2l0Y2hpbmcgZmxv
dyBpcyB1cGRhdGVkIHRvIHJlbW92ZSB0aGUNCj4+IEdDVEwgc29mdCByZXNldC4gQWRkIHZlcnNp
b24gY2hlY2tzIHRvIHByZXZlbnQgdXNpbmcgZGVwcmVjYXRlZCBzZXR0aW5nDQo+PiBpbiBtb2Rl
IHN3aXRjaGluZyBmbG93Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gwqAgQ2hhbmdlcyBpbiB2MjoNCj4+
IMKgIC0gUmViYXNlIG9uIEdyZWcncyB1c2ItdGVzdGluZyBicmFuY2guDQo+Pg0KPj4gwqAgZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMgfCAzICsrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+PiBpbmRleCAyYzEyYmJi
Y2Q1NWMuLjkxMjc4ZDJhNzJiOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPj4gQEAgLTE1OSw3ICsxNTks
OCBAQCBzdGF0aWMgdm9pZCBfX2R3YzNfc2V0X21vZGUoc3RydWN0IHdvcmtfc3RydWN0IA0KPj4g
KndvcmspDQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIMKgwqDCoMKgwqAgLyogRm9yIERSRCBob3N0
IG9yIGRldmljZSBtb2RlIG9ubHkgKi8NCj4+IC3CoMKgwqAgaWYgKGR3Yy0+ZGVzaXJlZF9kcl9y
b2xlICE9IERXQzNfR0NUTF9QUlRDQVBfT1RHKSB7DQo+PiArwqDCoMKgIGlmICgoRFdDM19JUF9J
UyhEV0MzKSB8fCBEV0MzX1ZFUl9JU19QUklPUihEV0MzMSwgMTkwQSkpICYmDQo+IGp1c3QgY3Vy
aW91cywgaSBtaWdodCBiZSB3cm9uZyBoZXJlIGJ1dCwgZGlkIHlvdSBtZWFudCB0byB1c2UNCj4N
Cj4gKERXQzNfSVBfSVMoRFdDMykgJiYgRFdDM19WRVJfSVNfUFJJT1IoRFdDMzEsIDE5MEEpID8N
Cg0KDQpOby4gVGhlIGNoZWNrIGFib3ZlIHNob3VsZCBhbHdheXMgYmUgZmFsc2UgcmlnaHQ/IFRo
ZSBjb250cm9sbGVyIGNhbid0IA0KYmUgYm90aCBEV0NfdXNiMyBhbmQgRFdDX3VzYjMxIElQIGF0
IHRoZSBzYW1lIHRpbWUuDQoNCg0KPg0KPiBiZWNhdXNlIGZyb20gdGhlIGNvbW1pdCB0ZXh0IGl0
IGxvb2tzIGxpa2Ugd2UgYXJlIHRyeWluZyB0byBhdm9pZCANCj4gZG9pbmcgR0NUTCBjb3JlIHNv
ZnQgcmVzZXQgZm9yIEdFTjEgYWJvdmUgMTkwQQ0KPiBhbmQgR0VOMi4gQnV0IHRoZSBjaGVjayBm
YWlscyBmb3IgR0VOMSBjb250cm9sbGVyIHdpdGggdmVyc2lvbiBhYm92ZSANCj4gMTkwQS4NCj4N
Cg0KSSdtIG5vdCBjbGVhciB3aGF0IHlvdSBtZWFudCBieSBHRU4xL0dFTjIgaGVyZS4gV2UncmUg
bm90IGRvaW5nIGFueSANCkdFTjEvR0VOMiBjaGVjayBoZXJlLiBBbmQgd2hhdCBmYWlscz8NCg0K
DQpCUiwNCg0KVGhpbmgNCg0K
