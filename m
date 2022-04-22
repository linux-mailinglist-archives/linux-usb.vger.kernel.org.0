Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7D850BC96
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 18:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbiDVQJ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 12:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiDVQJZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 12:09:25 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139685DE51
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 09:06:32 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9442940D3A;
        Fri, 22 Apr 2022 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650643591; bh=IElD5FkRWY/Vm2YYwTLvdYD/KjNm6TaBRGNEMVBIe1Y=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SYoCgx8gy67B6w4eKtD++BgPeygRiPpYWfXBHS4GHvaA+xTZL5kudN9KjpGLixicZ
         4fexYt9aS6n1cXmGFuMnbI4g4VN57UeCojg24OJi15Fp0WuWss+dvh2SYjOcdsxTRI
         o4fzT/F3L+7hF0je+QQG5v+JYZG7WBAyRMD6fgOQOxYvvIdX/lswqFr6NeaEbudDMj
         ISdlnKHHVFiy2oIgUrDg04hak1wI7OIdjbah27c1RU+riEvKasFJ4HVJvf7sE9h53M
         S+KZx3Bm1GWI8wdwx2N6kDOZhsE9FjQihlc9nx+QU0w8RZaPEhiPTCypXHDMF4bmhv
         uM6UcdXFZ0tTA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 46978A006A;
        Fri, 22 Apr 2022 16:06:31 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 28896800E0;
        Fri, 22 Apr 2022 16:06:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UBx3McVI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixt6izi6A4U86tcZjDMAl5w9C981tg8ma9QkLLJtihp4+qkAtNNmLx+C1hqspi/nRmyNdjqKkWgifl4HGGVr7lNEH/5pvxDDPwkvR2GSo/munC+3YKM0lbSmNY42ZR2RdDZh8AMsMZqzfkvWYFMgXCgQVX/hUXLg5MlfloayHUDy/TKDbd7LhU+wEFBRr/+J90/JqoPMNq737x9k3Cbdaf9ftBhLnRPjTASLSWJTOKYD28XTRvewWaUsUbRZGeegJz0YF4ehvJSyaK9C8hscJL7b1VgVQAaFibXvr6/bIftCfT4OWv6MqqyZRuR6a7KwXmtvpSlZLm8V1gUeOtsTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IElD5FkRWY/Vm2YYwTLvdYD/KjNm6TaBRGNEMVBIe1Y=;
 b=iXVnqBzYkYAiB28oATCNVT+ETpYVjtGw8wn05MVNDI52h/TSSGdLfORs0Y6ThKad/Ans2tDTBfUYbSCWZlH1sq5AeNDNbylj9l/g5f5Stl89qYmz1Hj3McEFG25XaYwvjRX+/vwMCRjkeBxtAX33UU06kpDy7FdBgkZTsbyXZVQOtKP9QwYkKzgBnPC3jKzvtGqFm/knmR13mUPyGGrWBVOG1Z3iAWCjesCjjccs8iUeH++34Q03TbhPyLX5VCaqxe8xJNzyvvPwO4+hW/dWpe1WHDrRdW9nP5OCBjXSMwBz05wmckmQN3Wlj8B3ZpZNcm9CUkMuaf4e411aqLM2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IElD5FkRWY/Vm2YYwTLvdYD/KjNm6TaBRGNEMVBIe1Y=;
 b=UBx3McVIUAnc1By3W7nu65lwFN4i0bvScjjbqhf8gSwOlXo9dyir/l6WH+hbIQDuumrGalcA6ZFF4PUMDWU+rKqseIGMmAgCplPSSRaMYJWTRgcH28cU8xnjkvMIxVMTwrTvLRgLxdPUAIK3FqZCt0SHEIOSBfAJCLfitf8i7ck=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN6PR1201MB2544.namprd12.prod.outlook.com (2603:10b6:404:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 16:06:26 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::d7:f2c8:c731:bdba]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::d7:f2c8:c731:bdba%5]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 16:06:26 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: common: debug: Hex dump non-standard control
 requests
Thread-Topic: [PATCH] usb: common: debug: Hex dump non-standard control
 requests
Thread-Index: AQHYQKkR9Bd1+WNAaESEJ6aCTubUb6z8GiYAgAAqWwA=
Date:   Fri, 22 Apr 2022 16:06:25 +0000
Message-ID: <744b88e2-0fd9-037f-de7c-953907f436b9@synopsys.com>
References: <bf1e225b660d0bb68ccdb3ce1bd7bd2d33edb817.1648253632.git.Thinh.Nguyen@synopsys.com>
 <YmKu+N0tTlNgkfxq@kroah.com>
In-Reply-To: <YmKu+N0tTlNgkfxq@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d503a24-ad6e-4694-c78c-08da247a0d95
x-ms-traffictypediagnostic: BN6PR1201MB2544:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB254493E5B3DA2DD2D27D8D42AAF79@BN6PR1201MB2544.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: apTAEpYYpRE003fdMaaNZAElW+rG5c9OuOkhom7fFI1rxPPJvHydVPJZ1jr3lCCJKmfjimSpPdFO6i55St6dpPPPBQfO8g+CheaNvVZJ8n5HaomDt+u32ubXsK3/eIJJKOVr6QKoZPtA4xPL9EXD3tHH9BgV7Fk2mFaeOVOnZx2iUuVPwAbeTN4XNKmf150lIEp0F8tPV7ciNkKXhqWQ57bv+ZPyNXTRpGadWu9A/6Ffd+fK3ddHLw5b4KKtSls0UE4vyhQ/qrn4h/6vd7/g5mRQusCeDBww95N9k7opJL0Rl2Ty5IfYikggMBzv2Xo7ZTDCWs5BvkxPuIegA1hGeFhw9pi63O13QgVsnqEDQZz0J80F1zRGEJ2brreM4rs+r6gOVBXNpAFPHseVOpMGURzPZNBTBkq0aZOKS/BVhQ0RpgJsmZayKn3AeY3T1Ln7VwOHinxTycru08Vp3XeP3x/5WO/S/rGtqa7lA9uC8xrlBTGHZrX62i9F0+Iqr5jULbP31KCU22xGXW9naWVUCoCfacM2WRRU7FOFvrZChoDWJ7rGKQSK2+eI21XXKQIbes2Z20VDJgr26EFOFjtfLG5ynKr8H4J3onMFkWBzy7MvacptSZGNEjG7oDGPcIEG8KkkC/7YG2daSPXCG8cpaNIyjBUFZaKvyQNBQbtBEXFYjjcxgrHPF4zxJgBieAvxJ8JbUlM6ZCttX9tH/ralQyCtZ6zdhJSi0j4GoxFYiBZ9XXELFFmc9wTqHpDTDQRgysQ/I4w/zidSyJiXyk6AyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(2906002)(71200400001)(110136005)(6486002)(8936002)(6512007)(26005)(31696002)(5660300002)(86362001)(6506007)(122000001)(316002)(36756003)(38070700005)(83380400001)(38100700002)(54906003)(31686004)(186003)(4326008)(8676002)(2616005)(66946007)(76116006)(64756008)(66556008)(91956017)(66476007)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME9sR1pnWit4MmZ5djJ2UjZjMzNEV1c0Q1NhN0ozM0dUVjJ3Y2FBUWRiS1px?=
 =?utf-8?B?Ymw5cHZ3VVFCYXZOLzlqclZMMmswQVQrc0JlL1BPN2NHNmI1aHdRbk4zUGNl?=
 =?utf-8?B?T0tlZFBFZkxaN0JkWWZ0UVNJbEVoR0FWYndSWnFTMXg0aWhvMUU2dk8zM3da?=
 =?utf-8?B?cjRDeS9ab1B6MVEvMEgxeWxYcmVMbHhSaHRWUTdOMmlldDZkWlpKV2ZqN0J4?=
 =?utf-8?B?SlhlQ1dtWEJ1RlphemFabnBSRkZSSmRtdjVGM3JaMGJDS1RySndZeEtmTEM5?=
 =?utf-8?B?THdiK2V6ckxhSGo2SkVuRS84MVNnY2srT2FTTDM1QzlGa0xSNkdZSVI1NVNw?=
 =?utf-8?B?N2Y0bkdJWVIzL2t3dFpUdjk1L3FRaE5wK1pDRXpMSUFaZkUrTmNlZVFnOEJl?=
 =?utf-8?B?cEdZb3BIRFBJNkZmSmJ5RkVQNjc0ZW92UXlIWGRHQjdRYVlWVStOM25KTHFt?=
 =?utf-8?B?RlA3MjQ1RTRHcE1UclFMK1E3bERLVlJLZURMUm9nSG1OeEZOYy9qSnBPSTR6?=
 =?utf-8?B?WDM5QlMzSzlkdjlTM3RrTkcySmRRRGl5OGc1U1ovZHB4VURibEl2RU1iMGwr?=
 =?utf-8?B?VkZIOXlyOUFXT0VkZFF4c1Z1Ymh0VmRiVVBMaFV1dlpIdnVQQVY4ZENieW9h?=
 =?utf-8?B?ZUJwakhnbHgxQ2dwbU52eGJZVEk0dGxnb3d0TVVKY0JyOEtnSVpwOE0rMDNN?=
 =?utf-8?B?Ni9rMGQveDdZb3QyR3JzK1RSWVpMSjYrWTdKUUIyTkhIbFBFRGF4aTJiVUpU?=
 =?utf-8?B?SktDZ01NekRYcjFzSk9mY29tbUc2WUJ4ZVdPTjBxQVF0K05CUEp5cllVeVNH?=
 =?utf-8?B?ZkJreG5YSnFSQ3kzbmpyWk02QW1mNXo5ajIxRVUvWXMzRjNTL1JIR1QxWWZ5?=
 =?utf-8?B?WlpROHdGS3h4dTYzeTJqTzNaQ1lJcFVwR3dGVTFzYitHMEMySHJ3cjdheXRn?=
 =?utf-8?B?WjUzUVdmZDBTTytvZDRDZEFhckU2YVdOQVE4VmRJSzMxMkFYSXJPQmJ5WS9v?=
 =?utf-8?B?THZrT21oMVB6Qy8rYzN5S0VEMDhRa2hCOFNVWEZscXZXUTkrY3RsYWk3VkVv?=
 =?utf-8?B?MFlXc2FnbWhURm5TakY5Q0pNbHlTOEFlWDcyRThLblBqTTQwQjAvZ3FNNjVP?=
 =?utf-8?B?bzJOU3NMZlAvNHh3SzFEQmlwbURCNEZYblVUMEdhMWFXaTVmMDlEejAvaDlL?=
 =?utf-8?B?bFNlSHVTY1FqQ3NkWXpJcFhZMXNQTU5Lb2ZMT2FDK0h5bFRpSVErYWw5MG9M?=
 =?utf-8?B?STA4cUkyOGZXbitmcVkxTVhqeElZY01Rd0w0dVJlRmhVN05rRGw1OStuV0lm?=
 =?utf-8?B?UmZqam9QRm9zWFRnSzRKck5tR24ybWdJYjFOQ3hEM2h2VDZ4SC9oaGx6UjRK?=
 =?utf-8?B?UGhCb3dSdGRvNElTdUZBM09EN3pMNUFiT1NUSUo3ekVtR2dtb3R6RHFGT0Na?=
 =?utf-8?B?bHc2ZkV6dUVpRVJhK295cFNkemxhaGJNTVVTNTdsZ0dSdTgrMmcvZEpScG90?=
 =?utf-8?B?bDN5Sjk4M1J6ZFl5NTV4ZnRMNzFBc0VFZ0RDQ01Zc0JMMjBBNmE0OGRaeFhs?=
 =?utf-8?B?WnlSVjlxL0hKbmdMaXhDNldPOXVOQlBjTTdnY3dvTlNrLzBiVlVZU2oxcVd2?=
 =?utf-8?B?ZUc2U01pbHRJQ1dRY2dlOWxXb2NsWE03SGl4VFhVRDA1cjN6Y3ljQWdidXpI?=
 =?utf-8?B?MDNRUkQvZHNKaEh1c2RMSHYrb3BueUlJNDJQc2UrR0ZqWVBtNXd1djZjZTlw?=
 =?utf-8?B?MXY1RkRXejhrRGs2OVptWURuQ2lOU0pGNkpBNjNZMTFGRkZyMHNpbFNHVU1E?=
 =?utf-8?B?TDNUTEkrWDBQZE92WEU3NDVWN0hlMFFCdURacFg3eWNSMHd2ejdqVmRSVHZF?=
 =?utf-8?B?ekdKQ2xtcUdqdGFUTXlPM2d3dHpKNEVlcVJId1VCZVV3OGtJeUJMZk1va1Vu?=
 =?utf-8?B?R0h1alYxZFVtV052ZFhWcGp2K0E5V0VEVlI1S0hnVjB0Qi9tU3ViZjU2WGNX?=
 =?utf-8?B?WjJzN1VvSlAvTFlJMkV1YVRzTG1DM3ZiVC94NlcrRVhmTUY2MDA2dDVYZEVD?=
 =?utf-8?B?VFVha0JXT2J3WXRMUzQ2ZDE5TlZ1cCt4aHR4NXV3cndPT3BjSkJPNzMwRlVr?=
 =?utf-8?B?Z3V6aHVkZi9CYmlmaFF0eFhoNTkvcjYyR3hRQmtEYlJqNGg3V1lPdVh0MGto?=
 =?utf-8?B?N28yelE4bUlUclhoU1YxUk0wOFkvN0JWVWZueUdTMWJVUWo5TjlkR1o5WUx0?=
 =?utf-8?B?MjRHbndjYVcya2kxNDZKYkhrQTlNaTQ5eFdjT1pFNVFwcHlOK08xR2ZacE5F?=
 =?utf-8?B?NVlIUGU1YmRIVGM0M0pvd1RjZzkxWU16Q3hxeGVvTE5UWGV5c1Q3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87C17B342209D9408A3BCAA1C1A48764@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d503a24-ad6e-4694-c78c-08da247a0d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 16:06:25.8407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtIkxar6joekBDLEKfCW/lxIl6t2GBQbfEqvw10K4hTLZ4191KGY4rgVH3iXM4ZS3Ffxlx/KYxoTiVTvwuqC0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2544
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBGcmksIE1hciAyNSwg
MjAyMiBhdCAwNTozMzowNFBNIC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiB1c2JfZGVj
b2RlX2N0cmwoKSBvbmx5IGRlY29kZXMgc3RhbmRhcmQgY29udHJvbCByZXF1ZXN0cy4gRG9uJ3Qg
YXR0ZW1wdA0KPj4gdG8gZGVjb2RlIG5vbi1zdGFuZGFyZCByZXF1ZXN0cy4gSnVzdCBkdW1wIHRo
ZSBjb250ZW50IG9mIHRoZSByZXF1ZXN0cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL3Vz
Yi9jb21tb24vZGVidWcuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29tbW9uL2RlYnVnLmMgYi9kcml2ZXJzL3VzYi9j
b21tb24vZGVidWcuYw0KPj4gaW5kZXggMDc1ZjZiMWIyYTFhLi5jYjM4NzI1ZjkyNzYgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9jb21tb24vZGVidWcuYw0KPj4gKysrIGIvZHJpdmVycy91
c2IvY29tbW9uL2RlYnVnLmMNCj4+IEBAIC0yMDgsNiArMjA4LDIwIEBAIHN0YXRpYyB2b2lkIHVz
Yl9kZWNvZGVfc2V0X2lzb2NoX2RlbGF5KF9fdTggd1ZhbHVlLCBjaGFyICpzdHIsIHNpemVfdCBz
aXplKQ0KPj4gIAlzbnByaW50ZihzdHIsIHNpemUsICJTZXQgSXNvY2hyb25vdXMgRGVsYXkoRGVs
YXkgPSAlZCBucykiLCB3VmFsdWUpOw0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMgdm9pZCB1c2Jf
aGV4X2R1bXBfY3RybChjaGFyICpzdHIsIHNpemVfdCBzaXplLCBfX3U4IGJSZXF1ZXN0VHlwZSwN
Cj4+ICsJCQkgICAgICBfX3U4IGJSZXF1ZXN0LCBfX3UxNiB3VmFsdWUsIF9fdTE2IHdJbmRleCwN
Cj4+ICsJCQkgICAgICBfX3UxNiB3TGVuZ3RoKQ0KPj4gK3sNCj4+ICsJc25wcmludGYoc3RyLCBz
aXplLCAiJTAyeCAlMDJ4ICUwMnggJTAyeCAlMDJ4ICUwMnggJTAyeCAlMDJ4IiwNCj4+ICsJCSBi
UmVxdWVzdFR5cGUsIGJSZXF1ZXN0LA0KPj4gKwkJICh1OCkoY3B1X3RvX2xlMTYod1ZhbHVlKSAm
IDB4ZmYpLA0KPj4gKwkJICh1OCkoY3B1X3RvX2xlMTYod1ZhbHVlKSA+PiA4KSwNCj4+ICsJCSAo
dTgpKGNwdV90b19sZTE2KHdJbmRleCkgJiAweGZmKSwNCj4+ICsJCSAodTgpKGNwdV90b19sZTE2
KHdJbmRleCkgPj4gOCksDQo+PiArCQkgKHU4KShjcHVfdG9fbGUxNih3TGVuZ3RoKSAmIDB4ZmYp
LA0KPj4gKwkJICh1OCkoY3B1X3RvX2xlMTYod0xlbmd0aCkgPj4gOCkpOw0KPj4gK30NCj4+ICsN
Cj4+ICAvKioNCj4+ICAgKiB1c2JfZGVjb2RlX2N0cmwgLSBSZXR1cm5zIGh1bWFuIHJlYWRhYmxl
IHJlcHJlc2VudGF0aW9uIG9mIGNvbnRyb2wgcmVxdWVzdC4NCj4+ICAgKiBAc3RyOiBidWZmZXIg
dG8gcmV0dXJuIGEgaHVtYW4tcmVhZGFibGUgcmVwcmVzZW50YXRpb24gb2YgY29udHJvbCByZXF1
ZXN0Lg0KPj4gQEAgLTIzMyw2ICsyNDcsMTIgQEAgY29uc3QgY2hhciAqdXNiX2RlY29kZV9jdHJs
KGNoYXIgKnN0ciwgc2l6ZV90IHNpemUsIF9fdTggYlJlcXVlc3RUeXBlLA0KPj4gIAkJCSAgICBf
X3U4IGJSZXF1ZXN0LCBfX3UxNiB3VmFsdWUsIF9fdTE2IHdJbmRleCwNCj4+ICAJCQkgICAgX191
MTYgd0xlbmd0aCkNCj4+ICB7DQo+PiArCWlmICgoYlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFT
SykgIT0gVVNCX1RZUEVfU1RBTkRBUkQpIHsNCj4+ICsJCXVzYl9oZXhfZHVtcF9jdHJsKHN0ciwg
c2l6ZSwgYlJlcXVlc3RUeXBlLCBiUmVxdWVzdCwNCj4+ICsJCQkJICB3VmFsdWUsIHdJbmRleCwg
d0xlbmd0aCk7DQo+PiArCQlyZXR1cm4gc3RyOw0KPj4gKwl9DQo+IA0KPiBCdXQgd2h5IG5vdCB0
cnkgdG8gZGVjb2RlIHRoZSBvdGhlciB0eXBlcyBhbmQgc2F5IHdoYXQgdGhleSBhcmU/DQo+IFdv
dWxkbid0IHRoYXQgYmUgbW9yZSBoZWxwZnVsPw0KPiANCg0KSSBhZ3JlZS4gSXQgd291bGQgYmUg
Z3JlYXQgaWYgc29tZW9uZSBjYW4gZW5oYW5jZSB0aGlzIHRvIGRlY29kZSBvdGhlcg0KdHlwZXMg
YWxzbyAocHJvYmFibHkgY2xhc3MgdHlwZSBvbmx5PykuIFRoaXMgaXMganVzdCBhIHF1aWNrIGZp
eCB0byBtYWtlDQpzdXJlIGl0IGRvZXNuJ3QgaW5jb3JyZWN0bHkgZGVjb2RlIHRoZSB3cm9uZyB0
eXBlLg0KDQpCUiwNClRoaW5oDQo=
