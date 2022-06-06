Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A0C53F25E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 01:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbiFFXGA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 19:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbiFFXFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 19:05:52 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F9C9FEA
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 16:05:51 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90791C086B;
        Mon,  6 Jun 2022 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654556751; bh=thqKG5LhQt+FHdSnBrRZJ/VPX/D1oRfia6/Z0Zthweo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KT84Sl4Hy822I0Dfo06KcITXY3q+giA8cpIsNkE+gyvF1DPyqbvYTXWcORcIra+e9
         84EvnKobFCmm41KK6sRPrgYlvHGUS3jVgW3xIpcmX6gqymf9BDLTj0AEeyQgTbj8eD
         VZ9HP19+pwsVnRGWCvYPTMXYviw4xLRTHslYg+T5HrT+P4EtlK+Mr2p3m1oKvSfx2v
         u+jmma7R4mt4OmaYeB/Bn0AoOHjvHmcH9IzaCTdnXuMiesg8XeGnRJK3elV+sn3TmT
         qPpCyf8eZNaCSTb9PVeG4Ino7GXQbGWMTN+UrMOff6gZR8ZgshVh0RfQuFi00R6OPQ
         MgWWwOAKxpzmw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C7E0BA026D;
        Mon,  6 Jun 2022 23:05:49 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A8ABD40060;
        Mon,  6 Jun 2022 23:05:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bfLE803u";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3J5mCpugY3eG9c9ernZTdAviSqPYmyWDg6NEHXwPRDP3b1wpiFD8WBH9Nl/Rtf10lhOAZ9Jam4CHOZDD60zyboT7hBsxhs2uT84dS5ULjzLxMrMXhowQgj11G0QzJ27lzU8F1oZOtj8vYzlmvXo8ognVhHnoaK08vtywrShzcyvpuyKh0qBHSOFw0xm5bGxFtcedDWNaY24pIUaJkwl9azVXNtusTvoUxSSPFFJGaktIXXOePdjoO3Tdhe88URuRKaMaq1mehbmBaMUPE8tUh2ulp4A37f0vF1QUUF9I6nLfvqsnu1RjGm1wDIBACRchstDdvL89pi3ZQlexkUllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thqKG5LhQt+FHdSnBrRZJ/VPX/D1oRfia6/Z0Zthweo=;
 b=lUymh0h2jMlWUmiwwwyjinoyQRpdZWBBTpp0V9Hh+UJyi8yq8eRfksDYEx/N29kmra6hKWHPL1QDpeSFyQLw0gLjNVEl55g8sAgNoM0O0apXT32Otd7K5ONFV8YCt/eFQUUgYTFPpT3R3MwSR/ughXgA/TL5uGxGkkDudJtWuw2RghIsCvITLqPHEIwjwPZf30YT2L+LrRxM2CrWvNhVG96Eu0K4TFW6S4YN8+ecCBVIRNa/0yuALbFznS0qUtI52MjQw0urK4E2zW3WaXr4xF4H1jR1lxqlJUl+nHk7H5cu73ACeoiIk+65d2QqllG+ZldBpdtLd/AAwHLNH/jDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thqKG5LhQt+FHdSnBrRZJ/VPX/D1oRfia6/Z0Zthweo=;
 b=bfLE803uHt+AWJxyoYLXVVVTexO6bnd1hzLm5AilKpphXCVBfkpEPrWYiJToQCO/H7a3lht77Goex2SCoOKQRduZliQEYtGxw6/t+mhlFrd6rp+vLp6t3Fi+GHMbOrBg1WQ4AlL5XBWyLcROUja+kbYBAKYSDTDoMcqml2PJpd0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN6PR12MB1380.namprd12.prod.outlook.com (2603:10b6:404:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 23:05:45 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 23:05:44 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "jindong.yue@nxp.com" <jindong.yue@nxp.com>
Subject: Re: [PATCH v2] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH v2] usb: dwc3: add power down scale setting
Thread-Index: AQHYeYS4qD16HnplSEKMbL/1lWrjGa1DANwA
Date:   Mon, 6 Jun 2022 23:05:44 +0000
Message-ID: <b478c226-3fa0-64ea-1e1e-0ca4c902a2ad@synopsys.com>
References: <1654505573-2501-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1654505573-2501-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7303829-a9ec-4d15-27ad-08da4811160e
x-ms-traffictypediagnostic: BN6PR12MB1380:EE_
x-microsoft-antispam-prvs: <BN6PR12MB13807534B63136E6513D07EFAAA29@BN6PR12MB1380.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YLTWfB/h/5oZ8sckvoS6leqcRAoMCCb9I3cQBjAiWDJNfXfuJs8KUng/935/z2dhdnSaS7FdH1ppW156ef6zDDqCbJpW9lYbQzkM5AH8FWmrpYr9py0+p2wbIXBD1x1IfT9zi0SlJ8JNC0SIupruPOPOSKD53tlN944Z8CYYFbqfKtkmXLROEoc6sIIwzZa4Ub3s4QXLR0WpaBlVD4BkntiHXs62BJAoparL9f/4pJMb59zXKnUzakrTVevzfUmi1A2p8NyWWxwXSWkKTElaGdZjkzX2M7gSqXLl0X2rOgXjL9cqm0O9S6bhdSTL7A1ljYW64jn7Nm7cHFMhzLoI6GlWqUJH/sBMhx0dS7ihDJq2iYOXie7mQAuaxzyrSQk25dKnW5ZpSO2P2YRJPg1S97IlyTChhZ34RJM6iP/E8jk3PINmXiQxf0+BTHM9vcQgn0ScPJ7e1LnqC7MzEZL1SZcfrpRjg5i+iSvb4uS+IW7aMWq/i5f0u6bip29A/w50+BmHub3+DB2RLijEAsiSLXYTm8cZd4p9wJsb4XJQ+r3jBvgSgRPPPWl5bzIXTVYfNHfzeZ8Ldfj7mwKNRlT8y2CVWJODOuFcrDniK/mz2hucSlwAaT0q4nEXQ523osBcBEIX+7QlFEoEqw3Wikd52m7AkUsJuVaQuK9Kg0phBPsvDoJ8NWoeFaDR59QiIJ/YLwzm96z6BFt7bBtBZEgS/h/gf3WSgpD9n4VIYnl/Fwy6rmpIF+nOW2YUwgm9TdTHK8SlOVeUSKmEKHrAJsUT6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(91956017)(316002)(71200400001)(6486002)(76116006)(54906003)(110136005)(186003)(122000001)(31696002)(38070700005)(86362001)(83380400001)(66476007)(64756008)(8676002)(4326008)(66556008)(66446008)(26005)(66946007)(6512007)(31686004)(36756003)(8936002)(38100700002)(508600001)(2906002)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a25SWWdlZkNsQndhV3hiejFscEtvdzZQcWN5RVpPWW5TMHdvS2JFTGFrRk83?=
 =?utf-8?B?UWpDeUVYQ3pGRElONTFvU3BpQUl6VHRDN25JYzVzZzRDZnV1YjNXK0kvcEhw?=
 =?utf-8?B?Nk9lWFdQSzBjTW1NNW1Gcit3eW1jVExySzNEUGtvSk9ZckFpaEtWZW01MjFK?=
 =?utf-8?B?cDNWYlJYeHgyZkdoK0pBdUcyNzF6cnhQMHJ2REszN0YxekdDdFRNVFI4NTNs?=
 =?utf-8?B?V3BtTEZtTnh0T2VjKzQvcUo0anlqTFhMS1lwL1lEZzAwRkNOekpnT2xpZDc2?=
 =?utf-8?B?NGViSmZzTmhUUDErUHQ5RFJ5YXdKeHFKUndINnNtQjJaRU1aVVNZRzZsMDh4?=
 =?utf-8?B?SS9laEVwcXJPc1RIazZkeVNqZXMvVDVPeU96K1F4V1pTbld0ZzZFTkhxNkpj?=
 =?utf-8?B?SkViTmlRVkswNjZlZWVmTGVoM1BoQTRIOHJ0c0tuZFhGZzQwZ3dyMGFGN2tC?=
 =?utf-8?B?SjN0UWFJQlFBOEZsUmJETFc0KzFCSy9Qa3kwM1Z6RGE2Zk96V040MDE0Z1Nn?=
 =?utf-8?B?L1JRVEtzWFBDdzF0VEZBM3Njc2F5elZFK3hSYS96WGo0bm9xNnFIenROV2JX?=
 =?utf-8?B?bGlxaXZPS1BWbVFWMWNMUUtCTDFscmZHZWlRNklzcDFIeCsrUGxmMWY2YU4w?=
 =?utf-8?B?MzNiNHFMaG5GMjRINUNuS2tDU2Q0ZzUxd2hmUHdzditXdVBaa1FrdEkrcVRQ?=
 =?utf-8?B?Q09MQ092RHpCWURURkgyMk1NYUlTenYrOGNkNWgyc2ZpR3ZzZXYySVF0UXZr?=
 =?utf-8?B?dkVPZlhFZUVrNkcyUURrRzdaTFJYS0t4Q0dsbHkzNDllMnRscDhZdU5oWjJ3?=
 =?utf-8?B?NGw0SVVWSHlNNkpHTVRNZm1zMVBVZ21kNzFJVWZJLytCZkhqWElmQkFkeUFE?=
 =?utf-8?B?REhjcFM2b0Ywb2tObGNPK0IwUXN1RTN1SzdnbmxoVDI4ZjVDcEVNd0RXWlVC?=
 =?utf-8?B?N0JxMzRPaWhTSjhtcHhJSCsvc2MzdnZsM1ZWVTU4UW5ZcVJBa1krUUxJTGRT?=
 =?utf-8?B?eUMrQ2U2aFJUdkcwdWJBUkZUcUUxNEhuRUpHRzZnS2FhOWFIWm4zdXRoSFM1?=
 =?utf-8?B?bGV0SGltaFpEd0VLWmpFR1liUjFLdTFtYWw5UXExWDlZUXYyYk9GbGRpQTRB?=
 =?utf-8?B?cGl5R2w2MFQ5NFFocWs0UXlsU294RUhnOWRCODFjdzF3d1duU3BJZ0pTaTNl?=
 =?utf-8?B?aUhIM2xLMEMzNWdCYXRjMlBkaFM4OHhnR2pGYm1lYWsxSEIyMVhEV3dlVEtO?=
 =?utf-8?B?U1FESGNLSENKb3FRWWYzTi9BRWtzU2xQajhrck5oZzZQSm1xZm5KSmYyWHU1?=
 =?utf-8?B?alBCWkdndWtoNUFxMUp3NmpsNWJCVTVPRDEzMlJXdFdyK2Y4U2RuekhCTFJN?=
 =?utf-8?B?RkpLcHlzaG1UTlpjVWR0d1hyN0x0cXUxZ0lmK3ZsK3ZTcFNhTmJuZ0E3VlVX?=
 =?utf-8?B?YytPejRmYWZEUmgxOU5FK0NjeTFDN1hSbVcvMmZMY0phQUlVWWZxVk80VWl6?=
 =?utf-8?B?N01YT0tLYkw3aHZBYXBUVEhPZEZxelViOVJJY05oK1FiNnVNaU14UzZsaElQ?=
 =?utf-8?B?Nzc1cFRwU2xXaEV1VWxueW1tcmhXVUwvdWNPL0xwS1hKb3VybEdteG1YSGw1?=
 =?utf-8?B?eldOeWY1UHF1WWl0V1R5eCt4bnlBSUpNaElXLzBEL1hpT0lXMW5HZTVDaWx5?=
 =?utf-8?B?bFRmWXNRWUJkZG1iSjE4SGV3dW1NTUFoWUdYWjVMZ2VFTHl0NERob1BIL2FF?=
 =?utf-8?B?QXZYWDZ0TW5Yd0FxUnFMQldUbGRvd2pva2E0SHlyakI5cDRVb3NzSDhzQlE2?=
 =?utf-8?B?WlpNY3A1MUtWQ1RMc2xNcWNVcExnU09adDdRWHpaR2hWYk5VbDZKRjUvV20w?=
 =?utf-8?B?OHltdlpsSzhDNXROTnZ0SXdXYmNkeldIWjdNcGYxTldzZHVNNXhFTE14K1pL?=
 =?utf-8?B?eGM1S1M1S0MrTCtqbHFXeEU0TmVnanNhYTBBdGdySGU4UFZ3ckc3ODAxMHoz?=
 =?utf-8?B?eFpCdDR6Q3l4b1lzWkZkR0VNbE51eHp0UFNHSjZyQWthSUVHYUx3cEd6cTh0?=
 =?utf-8?B?d3lGZHNNRE5mV2c2emJVb0MxVEFTeUpuTExUZUlqVnRWOWVtbWNkekpjM1d6?=
 =?utf-8?B?KzJCMjZWdmRwcUJ3WTQrZ3hXMFFyaW9BTXdPdmxIdTR5T2FUQVNrZExZZnpC?=
 =?utf-8?B?blB4elgxTXRnazN0dXBoanBmaU1JSzAwVDRwVDRTTU43QlEycGFaSGU3N082?=
 =?utf-8?B?MXAvclNFMTBtb091TXppSW5DZkFvWWNpNTgwcUNSREFHd3dvR1VSb1dPenBk?=
 =?utf-8?B?V2k3eFg1ZzM0UXlqaTZiZ1BQZkdoUWZLRXQ4UGh4WmM1dmpCNUZMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4691F6849300DE459A2E4C85E3DEA1E8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7303829-a9ec-4d15-27ad-08da4811160e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 23:05:44.7860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1QryAb2weKmmZZDhkDhJoJ3iozK30yPPcnua8NUqKnfXz/vw69rIZTQ0eFFafU8XLgExtnoe/dvRaNMZ8Q0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1380
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TGkgSnVuIHdyb3RlOg0KPiBTb21lIFNvQyhlLmcgTlhQIGlteDhNUSkgbWF5IGhhdmUgYSB3cm9u
ZyBkZWZhdWx0IHBvd2VyIGRvd24gc2NhbGUNCj4gc2V0dGluZyBzbyBuZWVkIGluaXQgaXQgdG8g
YmUgdGhlIGNvcnJlY3QgdmFsdWUsIHRoZSBwb3dlciBkb3duDQo+IHNjYWxlIHNldHRpbmcgZGVz
Y3JpcHRpb24gaW4gRFdDMyBkYXRhYm9vazoNCj4gDQo+IFBvd2VyIERvd24gU2NhbGUgKFB3ckRu
U2NhbGUpDQo+IFRoZSBVU0IzIHN1c3BlbmRfY2xrIGlucHV0IHJlcGxhY2VzIHBpcGUzX3J4X3Bj
bGsgYXMgYSBjbG9jayBzb3VyY2UgdG8NCj4gYSBzbWFsbCBwYXJ0IG9mIHRoZSBVU0IzIGNvcmUg
dGhhdCBvcGVyYXRlcyB3aGVuIHRoZSBTUyBQSFkgaXMgaW4gaXRzDQo+IGxvd2VzdCBwb3dlciAo
UDMpIHN0YXRlLCBhbmQgdGhlcmVmb3JlIGRvZXMgbm90IHByb3ZpZGUgYSBjbG9jay4NCj4gVGhl
IFBvd2VyIERvd24gU2NhbGUgZmllbGQgc3BlY2lmaWVzIGhvdyBtYW55IHN1c3BlbmRfY2xrIHBl
cmlvZHMgZml0DQo+IGludG8gYSAxNiBrSHogY2xvY2sgcGVyaW9kLiBXaGVuIHBlcmZvcm1pbmcg
dGhlIGRpdmlzaW9uLCByb3VuZCB1cCB0aGUNCj4gcmVtYWluZGVyLg0KPiBGb3IgZXhhbXBsZSwg
d2hlbiB1c2luZyBhbiA4LWJpdC8xNi1iaXQvMzItYml0IFBIWSBhbmQgMjUtTUh6IFN1c3BlbmQN
Cj4gY2xvY2ssDQo+IFBvd2VyIERvd24gU2NhbGUgPSAyNTAwMCBrSHovMTYga0h6ID0gMTMnZDE1
NjMgKHJvdW5kZXIgdXApDQo+IA0KPiBTbyB1c2UgdGhlIHN1c3BlbmQgY2xvY2sgcmF0ZSB0byBj
YWxjdWxhdGUgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29t
Pg0KPiAtLS0NCj4gQ2hhbmdlcyBmb3IgdjI6DQo+IC0gQWRkIFB3ckRuU2NhbGUgZmllbGQgdXBk
YXRlIGNvbmRpdGlvbjogbGVzcyB0aGFuIHRoZSBjYWxjdWxhdGVkDQo+ICAgdmFsdWUgb3IgbW9y
ZSB0aGFuIDN4IHRoZSBjYWxjdWxhdGVkIHZhbHVlLg0KPiAtIENvcnJlY3QgMTZrIGZyb20gMTYz
ODQgdG8gMTYwMDAuDQo+IC0gRGVsYXJlIHZhcmlhYmxlcyBpbiBzZXBhcmF0ZSBsaW5lcy4NCj4g
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAgMSArDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGUwMjdjMDQyMGRj
My4uMzdjMzQ2OTBkMTFiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTAyOSw2ICsxMDI5LDMzIEBA
IHN0YXRpYyB2b2lkIGR3YzNfc2V0X2luY3JfYnVyc3RfdHlwZShzdHJ1Y3QgZHdjMyAqZHdjKQ0K
PiAgCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HU0JVU0NGRzAsIGNmZyk7DQo+ICB9DQo+
ICANCj4gK3N0YXRpYyB2b2lkIGR3YzNfc2V0X3Bvd2VyX2Rvd25fY2xrX3NjYWxlKHN0cnVjdCBk
d2MzICpkd2MpDQo+ICt7DQo+ICsJdTMyIHNjYWxlOw0KPiArCXUzMiByZWc7DQo+ICsNCj4gKwlp
ZiAoIWR3Yy0+c3VzcF9jbGspDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCS8qDQo+ICsJICogVGhl
IHBvd2VyIGRvd24gc2NhbGUgZmllbGQgc3BlY2lmaWVzIGhvdyBtYW55IHN1c3BlbmRfY2xrDQo+
ICsJICogcGVyaW9kcyBmaXQgaW50byBhIDE2S0h6IGNsb2NrIHBlcmlvZC4gV2hlbiBwZXJmb3Jt
aW5nDQo+ICsJICogdGhlIGRpdmlzaW9uLCByb3VuZCB1cCB0aGUgcmVtYWluZGVyLg0KPiArCSAq
DQo+ICsJICogT25seSB1cGRhdGUgdGhlIHBvd2VyIGRvd24gc2NhbGUgd2hlbiB0aGUgZGVmYXVs
dCBzY2FsZToNCj4gKwkgKiBMZXNzIHRoYW4gdGhlIGNhbGN1bGF0ZWQgdmFsdWUgZnJvbSBjbGtf
Z2V0X3JhdGUoKTsgb3INCj4gKwkgKiBSaWRpY3Vsb3VzbHkgaGlnaCB0aGF0J3MgbW9yZSB0aGFu
IDN4IHRoZSBjYWxjdWxhdGVkIHZhbHVlLg0KDQpXZSBzaG91bGQgZGVzY3JpYmUgd2h5IHdlIHdh
bnQgdG8gZG8gdGhpcy4gTWF5YmUgcmVwaHJhc2UgdGhlIGxpbmUgYWJvdmUNCmFzIGJlbG93IChv
ciBzb21ldGhpbmcgZXF1aXZhbGVudCk6DQoNCiJUaGUgcG93ZXIgZG93biBzY2FsZSB2YWx1ZSBp
cyBjYWxjdWxhdGVkIHVzaW5nIHRoZSBmYXN0ZXN0IGZyZXF1ZW5jeSBvZg0KdGhlIHN1c3BlbmRf
Y2xrLiBJZiBpdCBpc24ndCBmaXhlZCAoYnV0IHdpdGhpbiB0aGUgYWNjdXJhY3kNCnJlcXVpcmVt
ZW50KSwgdGhlIGRyaXZlciBtYXkgbm90IGtub3cgdGhlIG1heCByYXRlIG9mIHRoZSBzdXNwZW5k
X2Nsay4NCk9ubHkgdXBkYXRlIHRoZSBwb3dlciBkb3duIHNjYWxlIGlmIHRoZSBkZWZhdWx0IGlz
IGxlc3MgdGhhbiB0aGUNCmNhbGN1bGF0ZWQgdmFsdWUgZnJvbSBjbGtfZ2V0X3JhdGUoKSBvciBp
ZiB0aGUgZGVmYXVsdCBpcyBxdWVzdGlvbmFibHkNCmhpZ2ggKDN4IG9yIG1vcmUpIHRvIGJlIHdp
dGhpbiB0aGUgcmVxdWlyZW1lbnQuIg0KDQpUaGUgcmVzdCBsb29rcyBmaW5lIHRvIG1lLg0KDQpS
ZXZpZXdlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpU
aGFua3MsDQpUaGluaA0KDQo+ICsJICovDQo+ICsJc2NhbGUgPSBESVZfUk9VTkRfVVAoY2xrX2dl
dF9yYXRlKGR3Yy0+c3VzcF9jbGspLCAxNjAwMCk7DQo+ICsJcmVnID0gZHdjM19yZWFkbChkd2Mt
PnJlZ3MsIERXQzNfR0NUTCk7DQo+ICsJaWYgKChyZWcgJiBEV0MzX0dDVExfUFdSRE5TQ0FMRV9N
QVNLKSA8IERXQzNfR0NUTF9QV1JETlNDQUxFKHNjYWxlKSB8fA0KPiArCSAgICAocmVnICYgRFdD
M19HQ1RMX1BXUkROU0NBTEVfTUFTSykgPiBEV0MzX0dDVExfUFdSRE5TQ0FMRShzY2FsZSozKSkg
ew0KPiArCQlyZWcgJj0gfihEV0MzX0dDVExfUFdSRE5TQ0FMRV9NQVNLKTsNCj4gKwkJcmVnIHw9
IERXQzNfR0NUTF9QV1JETlNDQUxFKHNjYWxlKTsNCj4gKwkJZHdjM193cml0ZWwoZHdjLT5yZWdz
LCBEV0MzX0dDVEwsIHJlZyk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICAvKioNCj4gICAqIGR3YzNf
Y29yZV9pbml0IC0gTG93LWxldmVsIGluaXRpYWxpemF0aW9uIG9mIERXQzMgQ29yZQ0KPiAgICog
QGR3YzogUG9pbnRlciB0byBvdXIgY29udHJvbGxlciBjb250ZXh0IHN0cnVjdHVyZQ0KPiBAQCAt
MTEwNSw2ICsxMTMyLDkgQEAgc3RhdGljIGludCBkd2MzX2NvcmVfaW5pdChzdHJ1Y3QgZHdjMyAq
ZHdjKQ0KPiAgCWlmIChyZXQpDQo+ICAJCWdvdG8gZXJyMTsNCj4gIA0KPiArCS8qIFNldCBwb3dl
ciBkb3duIHNjYWxlIG9mIHN1c3BlbmRfY2xrICovDQo+ICsJZHdjM19zZXRfcG93ZXJfZG93bl9j
bGtfc2NhbGUoZHdjKTsNCj4gKw0KPiAgCS8qIEFkanVzdCBGcmFtZSBMZW5ndGggKi8NCj4gIAlk
d2MzX2ZyYW1lX2xlbmd0aF9hZGp1c3RtZW50KGR3Yyk7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXgg
ODFjNDg2YjM5NDFjLi43MjI4MDhkOGMwYWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0yMzEsNiAr
MjMxLDcgQEANCj4gIA0KPiAgLyogR2xvYmFsIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgKi8NCj4g
ICNkZWZpbmUgRFdDM19HQ1RMX1BXUkROU0NBTEUobikJKChuKSA8PCAxOSkNCj4gKyNkZWZpbmUg
RFdDM19HQ1RMX1BXUkROU0NBTEVfTUFTSwlHRU5NQVNLKDMxLCAxOSkNCj4gICNkZWZpbmUgRFdD
M19HQ1RMX1UyUlNURUNOCUJJVCgxNikNCj4gICNkZWZpbmUgRFdDM19HQ1RMX1JBTUNMS1NFTCh4
KQkoKCh4KSAmIERXQzNfR0NUTF9DTEtfTUFTSykgPDwgNikNCj4gICNkZWZpbmUgRFdDM19HQ1RM
X0NMS19CVVMJKDApDQoNCg==
