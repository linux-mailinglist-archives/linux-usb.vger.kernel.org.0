Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80319534775
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 02:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbiEZA01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 20:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346213AbiEZA0I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 20:26:08 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A4BA500A
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 17:26:03 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDD0545F46;
        Thu, 26 May 2022 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653524763; bh=GsaCQxzBtj/VvP8Ac6O5rwBRx0s4uQIgZ82UPdZhEg8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Guqo7AELgR9YoQcBh7bvnvXyoht0fQPVSTUK5A32GBJiq7rC5vQNuBrwh8fSfhhmZ
         lBNQwM0oEq67rTiKpPI39goOCXUjy4K534D1IdfdfE4dDwbVq7gBlUuMrgdqdh4JSE
         41IDDUPc+V482b8Qa5Z3vOW9yDey+PkJcmOPzYVLuH4Bh4KNVcJ4T+tC8/SC5QemQ+
         UB8xE6ai3CBFithJ6OvMSnvvB/lp8yeFpcwyiCjTsmZS325ZUul7nqY9HA291aIzSQ
         WIVMp+DXsJy+QeeWaD1wJML3wzKjMpX8sTHGYv4ox4S04nx7x7dp22WEqX2ymSH1WO
         PIC2SjFncqyqg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 20D48A0077;
        Thu, 26 May 2022 00:26:01 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C241B40067;
        Thu, 26 May 2022 00:26:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ohn80yiT";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4gxTaJHh7Xb1f0RDBbA7RfArkYN3nTnWujdakzrRSQlWMPNihb2PqSCeD0NRsLn1pnYRrsSh3zdUYjHaM2WsZfhWaA7ZLGFyv1svQu/x5tBSgBWO23iYEmB6a0hd8vqBHbgVbUd8dTBWEMaDz3Wspk97WDWly8o6e/2DIloHfRFkbt1qWNG9sF2HBvjwwEO+csrbhVB7GKyJKKbLFFKoNJsq1xKgqOVd29VkIPDJFLZCRK59HQN2cvSsHWmsvGur7GYmKfIgIJVL0PnkjMXlI6CoR3dh6vu4JXgPZabUthG9gBBxlIOl9cjtEF2NOcM07smthWr5BOJ3ZMDfeksUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsaCQxzBtj/VvP8Ac6O5rwBRx0s4uQIgZ82UPdZhEg8=;
 b=NzagGnGDCqP6tyAEgPeliILNfIZaEPWvphnMJiaTGuN0cudFWuQS7V57BX9Aa5WZGXRVhyOjHpbUuI9UTuXCky0cywibKon0ve2qz059q6m+Mux18TcHG3IwCEA+OFMG22By9T2n5mD7VVPchLG2/uw+fj0WoA7yXnWeJ9AxGtr201PIRuNvb1KByuFXA+CnHVfm7OgKadxjNzFZLRj40Rv4Tp2jtgostA3b5loxreJPSiP6gMZ5LLLJRD3XPlQI5H0QBZW0CavhxdZfzr9hxB56skgXeFyn37nkkdFSdLVoAzt0j3pegIoBiUKx+yllE16ugD2cdOfYBeIlB+oNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsaCQxzBtj/VvP8Ac6O5rwBRx0s4uQIgZ82UPdZhEg8=;
 b=ohn80yiTIibGaNE8+YdUvZGM+WkSUIsP7O7O+95Q4XzGYXvAnKpHSUdMAeeW4sLdwUZzowbCXYmW0Jt8UYfrr1wioGGmGmbhGJuK5VmR1ZlabdnhSjp9OptFtzBhDqBK3ZYrLhVKqzknftk3udmEAMAcqjivoT0bdbzW968Mr7Y=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN2PR12MB3710.namprd12.prod.outlook.com (2603:10b6:208:16d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Thu, 26 May
 2022 00:25:55 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 00:25:55 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
Thread-Topic: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
Thread-Index: AQHYVe/SnOT1IryojUCTvpGnMrnu860CtucAgCRnpACABkB7AIAAEd8AgAKjB4CAAG6HgA==
Date:   Thu, 26 May 2022 00:25:55 +0000
Message-ID: <4988ed34-04a4-060a-ccef-f57790f76a2b@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <14105f3b-aa09-1fd5-48f4-9f15eec2473e@quicinc.com>
 <aa9e6681-76f1-357c-b01c-64576b5faee8@quicinc.com>
 <ac113646-7814-374c-c546-a583e4144e18@synopsys.com>
 <3b3e4d7f-d993-628d-c3c0-aa104127223a@quicinc.com>
 <7e4e9e74-c7f2-e4f1-577d-45b0e3be9ac0@quicinc.com>
In-Reply-To: <7e4e9e74-c7f2-e4f1-577d-45b0e3be9ac0@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a34ab00c-a9e3-4634-d3bd-08da3eae4cae
x-ms-traffictypediagnostic: MN2PR12MB3710:EE_
x-microsoft-antispam-prvs: <MN2PR12MB3710D239D6320DCE87D13301AAD99@MN2PR12MB3710.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ft/Qm6sNqMSI++TQ3WkTG6MuJob+evnG+2ECyaFOkFzW0y4RZjML7Jx1SOs6ix8JzIJCvqNR1lAMmyXc7E7ELGYyg6GvFxyqJzqTHIPY1WkVsA663oa2z0SlTpqu+6VkLWxJzUuFpmm0VJ6VQqJZFB4q8nS5anB8uZP2SiiyVab1hB31FWv4EYK/jOBdyPiI7NYhD88y23mo6zgRTBrlhfF/kQS7JiKQQK91VmZmue688vZPGoDUTQll+Xa1Gu/UHZUSEUIKg/i/YK8P0RcBY74kMdCtcnu7HzDtKbn9QqbNqpnce6dywqHeRT9CEkj4PxAY1eojC+VJe9xOLJc6cybOH5Eifc2cUwe5/M+awDxFSy97j2PEUxSfudUO+xoEhIT8S9i0ISIMwC5DVs1HlDNF75scYjes1e0/W+6oGAPYTcbE0MbH9zxiWOK2m1LHq0y6rDuX3hnWsya0NmDaBjcmUwRvY7ckzORZuDCiTq0YQnChpG2hA/oS7JMCv+x7MUd1d8pcNx+y1t/8SVHpcIluH0CdOwxAkVWo8iXeVWbloaPLOaGLFjk22F7hDi3sLEOSrz0qcSum5cjFC2mXVviGTOudcYZik9EaXDumiST1Miaby47BNyaKCSYozKtP/HPJHlYVOLE/mvNP67yZMHRfW1I6Xj9iGWx75j5UsAdaXxxfBGkyUTMAQKT7rs9Y6wubCRwbbA/4c2MJKBS/uqNbXXe6j82VGXGJ9VmtvMVr4ExR4vUQAWHagXwPxjCE2TIPiWVnZL9tgRyWWZSr7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(508600001)(6486002)(2616005)(5660300002)(110136005)(38070700005)(38100700002)(107886003)(83380400001)(8676002)(26005)(66556008)(8936002)(31696002)(76116006)(66446008)(316002)(53546011)(91956017)(66476007)(122000001)(4326008)(64756008)(66946007)(6512007)(31686004)(36756003)(71200400001)(86362001)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2JYQTl2VVhhc3huMmh5L3dBV1cyQnQ2VWxYV0ZjUE1VWHhJRFJheThlWDFi?=
 =?utf-8?B?elUwY0dscEhQeERVanBydWxRTDhkaExlak51K2xHTmVSYm5Vd1kxeDdrL2pQ?=
 =?utf-8?B?T1lmRkN2akY1TTRrcUt3WjhFbytNcmx3M2YzeXllUUJaS3RSUEExVG5LeWxU?=
 =?utf-8?B?ejNjSmhnU25sc3pHS25pbk5TQWVncER2T2djLzlJTWV2Umh0TFY4ZG9FUExY?=
 =?utf-8?B?SzdTTzl2MmdoU1RaWllMWlcxQlc2Z3F1WCt5STZWMzhOVHRGWDIzT2NLb3E5?=
 =?utf-8?B?Vmx5aHRjTGk2QXBvYTVXWlk3ZU55ZVZjQk9yajROcG1CVlp6bnZwZlptMnpM?=
 =?utf-8?B?dnR5bEo1ZVVnTExWdXRHakJoSDk1cForbnB1ZmpxNStjVi9seGIwUlB1OUdC?=
 =?utf-8?B?TldwUnVpTGpwbmFzVnU2S2hpaXFYNHJIMjdKVGFpMUxsVUZ1Y1hERStFdXJa?=
 =?utf-8?B?MXJKbFRMaHpucjFlL0cxSzU4aTBKdGRhZTdyN3pieXNYazNmZk8xNjAwL0R4?=
 =?utf-8?B?cU5zKzBKbDNKcG4vbkYxbzZOYU5QTWpvU3ZRR3RiTnF0YWtHM050Ni85b2JG?=
 =?utf-8?B?d1M5QWdCZjV5eTFDT3l1UDAvSEhSN1NNZEY1d2FXM29LSkJzVHRwenNrS1dI?=
 =?utf-8?B?YSs4UXc4Z2NtTVdnVUhBZ0hERno2czdraGJqaDZ1aEVKa0dwV2JESk9PUnVh?=
 =?utf-8?B?V1VrUEZVeTJTMmtvWjlTa09PQjVCNFFEYnlpRmROMGl3aFIrT0NMRlBUcXV5?=
 =?utf-8?B?NkVxdk5uUVJkOGZtV01qUC9mdEc5Rlc4ZGVFL2tmOXpUaG1iY3hwYkZMS285?=
 =?utf-8?B?Kzc2ZWJjV0ZkMGZrL0trWk1JZUhvbE9SbVFSNXIrbko4V2QxczZHeVc1dGN0?=
 =?utf-8?B?TDhLQ091WURBY09zK3gvT3k1WkpqQnNjUk1ITDF4TzVxTG9pWVBxcE5FMWc3?=
 =?utf-8?B?SUJTQzNNQndZajE2ZEFzd2l1YmIwVTV3U3pVK1I4Z0tlQUt3WnJRY29LV29G?=
 =?utf-8?B?a2FnOW8zRWF1M3pQZmhnb0RtdGx2OTQ0emRWVHcvRkt4SUxsTnhJVzFJQU9Y?=
 =?utf-8?B?U3hGeko3dWlHNVhtZnk1cmdwa0lrN3VYSkg4VHA2KzBZajE2cDNFNTZodVBW?=
 =?utf-8?B?T050WC9LVzh1L3ErWHpKRGJaS1RKaExSUVZsM1pGVmJuNm1QTCtwcW56NFBs?=
 =?utf-8?B?NzB2QTJyZlVWOVFZV3l6Q3ZQb2NIV0p2b1ZTTEZuU1pvNEpmd096T2VYejJh?=
 =?utf-8?B?b1c2and0bWtKK2hxMDhKUTdxYlFqbm9aYTB4TW0wUUVIS3lhN0hYVWlUcVNt?=
 =?utf-8?B?WHc5THR0MW10Qmg3YkpDK25WcXJ3M2h3RW5aREdLZndIeDg0UWdxWEpJcVJO?=
 =?utf-8?B?MzRtRkRER3VpZ213b0UyaU9HVFUyWG1ra0RINnk1eWF2OUpqY2loemgyUWdj?=
 =?utf-8?B?eWF6R3VENHV6N2ZWSjZ3eTloNVM1N1hXdEQwYmtvUVp3TUNselVkSm9RcktE?=
 =?utf-8?B?OGp2NCs1amtRcm5zdC9GcmtPcnhpbVBUN0ZzRzhZN0VUZmJhblZKRWJEdVVr?=
 =?utf-8?B?OFNXMm1WRDZ1cVE0QkczQnNzYnRScTQvQzhqd1dpbG16K2FTTEFwRlhQYlBo?=
 =?utf-8?B?cVRvSXArSjVpZUxIMS9XTjJtUmZVVXltYzA1M0JsRUl6Z29OZTM4Unc3Umh0?=
 =?utf-8?B?WFQwalhjQWwrVkE4MGtZcmlXeGMxeXpBcTJ4WW5ORmltc1FSOXhFTmNiMmla?=
 =?utf-8?B?am05dEFmZ3h5UTUzL1lPYlhFT0ExU29nUGgxSkQxQzh1eXdjdFgrb1lXU2cw?=
 =?utf-8?B?TXFVTytiTG0xNTQxV1JUVmRFUjUxa2NVSmRLb1NHTFFlWS9wLzNmSDhmY1VF?=
 =?utf-8?B?bnNGUUxKN3dDWVF4UmEvTjFGZkNTcGc2RnhGRXdIZ2VrQWVRM2dTWDZ2MkF2?=
 =?utf-8?B?aTBHOXc4NkZoM3JrQ1FibE9FUWR4WGk3YklrcmxTNmZjMVBQRDZRckF3bWty?=
 =?utf-8?B?M1d4SGVRSjRjbjBrVDZsUHNySVBFclFoZXhPRHJDZTJBbzVmY256SDNyMkZx?=
 =?utf-8?B?cW1vZmR0QWZtV1lDbDR1RHhDY0U5NGgzNGRIVlEzVWthbHp3amN1OHI5NGxN?=
 =?utf-8?B?K2lhL2ZtQ010emhwVHNhTU5IRWpybHdWeTNlSEx6NVVETzVqM0N1cndlOGNW?=
 =?utf-8?B?WE82SlBjRjNpaUtvYXBBTXFubjBSZWw0MFlMUjBMSjdpc3o0L0g4N3JUMEdm?=
 =?utf-8?B?czZNL2FaOUM2UmhFRGxjMzZVYjBlMXpIenAzazduUGZPeDZralJ4MjlINFQ1?=
 =?utf-8?B?WHh2OUpHTW5Xc1NqSHZlYytuRWUzcHYxVHh3cEJCZVhHZXFPNkZEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21B53DE256BA714BBB978116FE31D80A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34ab00c-a9e3-4634-d3bd-08da3eae4cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2022 00:25:55.7479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKRgh+/ZCX4SqY12nd8x//ELGfrc3vu6NuB02iEQ8R/lI82VokldPmwSvI7PPUkSH2FvlAR6n0CpwxjBoR0Ajg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3710
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2VzbGV5IENoZW5nIHdyb3RlOg0KPiBIaSBUaGluaCwNCj4gDQo+IE9uIDUvMjMvMjAyMiA2OjM0
IFBNLCBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+PiBIaSBUaGluaCwNCj4+DQo+PiBXZWxjb21lIGJh
Y2shIDopDQo+Pg0KPj4gT24gNS8yMy8yMDIyIDU6MzAgUE0sIFRoaW5oIE5ndXllbiB3cm90ZToN
Cj4+PiBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+Pj4+IEhpIFRoaW5oLA0KPj4+Pg0KPj4+PiBPbiA0
LzI2LzIwMjIgMjowNSBQTSwgV2VzbGV5IENoZW5nIHdyb3RlOg0KPj4+Pj4gSGkgVGhpbmgsDQo+
Pj4+Pg0KPj4+Pj4gT24gNC8yMS8yMDIyIDc6MjIgUE0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+
Pj4+PiBUaGlzIHNlcmllcyBjbGVhbnVwIGFuZCBlbmhhbmNlIGR3YzMgcHVsbHVwKCkgaGFuZGxp
bmcgdG8gY292ZXINCj4+Pj4+PiBkaWZmZXJlbnQNCj4+Pj4+PiBjb3JuZXIgY2FzZXMuDQo+Pj4+
Pj4NCj4+Pj4+PiBXb3VsZCBiZSBncmVhdCB0byBoYXZlIHNvbWUgVGVzdGVkLWJ5IGJlZm9yZSBw
aWNraW5nIHRoaXMgc2VyaWVzIHVwLg0KPj4+Pj4+IFRoYW5rcyENCj4+Pj4+Pg0KPj4+Pj4+DQo+
Pj4+Pj4gVGhpbmggTmd1eWVuICg2KToNCj4+Pj4+PiDCoMKgwqAgdXNiOiBkd2MzOiBnYWRnZXQ6
IFByZXZlbnQgcmVwZWF0IHB1bGx1cCgpDQo+Pj4+Pj4gwqDCoMKgIHVzYjogZHdjMzogZ2FkZ2V0
OiBSZWZhY3RvciBwdWxsdXAoKQ0KPj4+Pj4+IMKgwqDCoCB1c2I6IGR3YzM6IGdhZGdldDogRG9u
J3QgbW9kaWZ5IEdFVk5UQ09VTlQgaW4gcHVsbHVwKCkNCj4+Pj4+PiDCoMKgwqAgdXNiOiBkd2Mz
OiBlcDA6IERvbid0IHByZXBhcmUgYmV5b25kIFNldHVwIHN0YWdlDQo+Pj4+Pj4gwqDCoMKgIHVz
YjogZHdjMzogZ2FkZ2V0OiBPbmx5IEVuZCBUcmFuc2ZlciBmb3IgZXAwIGRhdGEgcGhhc2UNCj4+
Pj4+PiDCoMKgwqAgdXNiOiBkd2MzOiBnYWRnZXQ6IERlbGF5IGlzc3VpbmcgRW5kIFRyYW5zZmVy
DQo+Pj4+Pj4NCj4+Pj4+PiDCoMKgIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmPCoMKgwqAgfMKgwqAg
MiArLQ0KPj4+Pj4+IMKgwqAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDEyNg0KPj4+Pj4+
ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4gwqDCoCAyIGZp
bGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+
Pj4+Pj4NCj4+Pj4+PiBiYXNlLWNvbW1pdDogNWMyOWU4NjQ5OTk3NjNiYWVjOWVlZGI5ZWE1YmQ1
NTdhYTRjYmQ3Nw0KPj4+Pj4NCj4+Pj4+IFRoYW5rcyBmb3IgdGhpcyBzZXJpZXMuwqAgUnVubmlu
ZyB0aGUgdGVzdHMgdy8gdGhlIGNoYW5nZXMgbm93IGFuZCB3aWxsDQo+Pj4+PiBkZWJ1ZyBpZiBJ
IHJ1biBpbnRvIGFueSBpc3N1ZXMuwqAgSSB3aWxsIG5lZWQgdG8gcnVuIHRoZSBwcmV2aW91cyB0
ZXN0DQo+Pj4+PiBjYXNlcyBJIGhhZCBhcyB3ZWxsLCBzaW5jZSB0aGUgY2hhbmdlIHJlbW92ZXMg
dGhlIEdFVk5UQ09VTlQgY2xlYXJpbmcNCj4+Pj4+IGR1cmluZyBwdWxsdXAgZGlzYWJsZSAodGhp
cyB3YXMgYWRkZWQgZm9yIHNvbWUgY29udHJvbGxlciBoYWx0DQo+Pj4+PiBmYWlsdXJlcykuDQo+
Pj4+Pg0KPj4+Pg0KPj4+PiBHb2luZyB0byBzdW1tYXJpemUgc29tZSBvZiB0aGUgdGhpbmdzIEkn
dmUgZm91bmQgc28gZmFyOg0KPj4+PiAxLsKgIERXQzNfRVBfREVMQVlfU1RPUCBmbGFnIHNldCBm
b3IgRVBzOg0KPj4+PiBUaGUgdGVzdCBjYXNlIGJlaW5nIHJ1biB3aWxsIGhhdmUgdXNiIGVwIGRl
cXVldWUgcnVubmluZyBjbG9zZWx5IGluDQo+Pj4+IHBhcmFsbGVsIHRvIHNvZnQgZGlzY29ubmVj
dC7CoCBUaGVyZSBpcyBhIGNoYW5jZSB0aGF0IHdlIHJ1biBpbnRvDQo+Pj4+IGNvbnRyb2xsZXIg
aGFsdCBkdWUgdG8gYWN0aXZlIEVQcywgc2luY2Ugd2UgYXJlIG5vdA0KPj4+PiB3YWl0aW5nL3N5
bmNocm9uaXppbmcgZm9yIERXQzNfRVBfREVMQVlfU1RPUCB0byBiZSBjbGVhcmVkIG9yIGNvbXBs
ZXRlLg0KPj4+DQo+Pj4gSSBzZW50IGFuIHVwZGF0ZS4gQ2FuIHlvdSB0ZXN0IGl0IG91dD8NCj4+
Pg0KPj4+Pg0KPj4+PiBBdHRhY2hlZCB0aGluaF9uZXdlc3RfZGVsYXllZF9zdGF0dXNfY2F1c2lu
Z19lcF9zdG9wX2RlbGF5X2ZsYWcudHh0DQo+Pj4+IC0gRm9yY2UgZGV2aWNlIGNyYXNoIGlmIHJ1
bi9zdG9wIHJvdXRpbmUgZmFpbHMgdy8gLUVUSU1FRE9VVC4NCj4+Pg0KPj4+IENhbiB5b3UgY2xh
cmlmeSBoZXJlPyBEaWQgeW91IGZvcmNlIHRoZSBjcmFzaCBvciBkaWQgdGhlIGNyYXNoIG9jY3Vy
IGR1ZQ0KPj4+IHRvIHRoZSBjaGFuZ2U/DQo+Pj4NCj4+IEp1c3QgaW5qZWN0aW5nIGEga2VybmVs
IHBhbmljIGlmIHRoZXJlIGlzIGFuIC1FVElNRURPVVQgY29uZGl0aW9uDQo+PiBkdXJpbmcgcnVu
L3N0b3AgY2xlYXIuwqAgVGhlIGVuZCBvZiB0aGUgdHJhY2VzIHdpbGwgYmUgYXQgdGhlIHBvaW50
IG9mDQo+PiB3aGljaCB0aGUgZXJyb3Igb2NjdXJyZWQuDQo+Pg0KPj4+PiAtIFRoZXJlIGlzIGEg
c2l0dWF0aW9uIHdoZXJlIGEgZnVuY3Rpb24gd2lsbCByZXR1cm4gZGVsYXllZF9zdGF0dXMsIGFu
ZA0KPj4+PiB3ZSBjYW4gc2VlICJ0aW1lZCBvdXQgd2FpdGluZyBmb3IgU0VUVVAgcGhhc2UiIHBy
aW50IGR1cmluZyBwdWxsdXANCj4+Pj4gZGlzYWJsZS4NCj4+Pg0KPj4+IEl0IHNob3VsZCBiZSBm
aW5lIHRoYXQgdGhlIHdhcm5pbmcgZ2V0cyBwcmludGVkLiBUaGUgcHJvZ3JhbW1pbmcgZ3VpZGUN
Cj4+PiBzdWdnZXN0ZWQgdGhhdCB0aGUgZHJpdmVyIHNob3VsZCB3YWl0IGZvciBhbGwgdGhlIGNv
bnRyb2wgdHJhbnNmZXJzIHRvDQo+Pj4gY29tcGxldGUuIFRoaXMgZGV2aWF0ZXMgZnJvbSB0aGUg
cHJvZ3JhbW1pbmcgZ3VpZGUuIElmIGl0IGhhcHBlbnMgb2Z0ZW4NCj4+PiBlbm91Z2gsIHdlIG1h
eSBuZWVkIHRvIGluY3JlYXNlIHRoZSB0aW1lb3V0Lg0KPj4+DQo+PiBZZXMsIGFncmVlZC4NCj4+
DQo+Pj4+DQo+Pj4+IDIuwqAgQ29udHJvbGxlciBoYWx0IGZhaWx1cmUgZHVlIHRvIG5vbi16ZXJv
IEdFVk5UQ09VTlQNCj4+Pj4gU28gd2l0aCB0aGlzIHBhdGNoIHNlcmllcywgYW5kIHJlbW92aW5n
IHRoZSBHRVZOVENPVU5UIGNsZWFyaW5nLCBJJ20NCj4+Pj4gcnVubmluZyBpbnRvIGNvbnRyb2xs
ZXIgaGFsdCBmYWlsdXJlcyBhZ2Fpbi7CoCBXaGVuIEkgcHJpbnRlZCB0aGUNCj4+Pj4gR0VWTlRD
T1VOVCByZWdpc3RlciBhdCB0aGUgdGltZSBvZiBmYWlsdXJlLCBpdCBzaG93ZWQgdGhhdCB0aGVy
ZSB3ZXJlDQo+Pj4+IHNldmVyYWwgcGVuZGluZyBldmVudHMuDQo+Pj4NCj4+PiBEbyB5b3UgaGF2
ZSB0aGUgbG9nIGZvciB0aGlzPyBXaGF0J3MgdGhlIElPIGRlbGF5IGZvciBlYWNoIHJlZ2lzdGVy
IHJlYWQNCj4+PiBvbiB5b3VyIHBsYXRmb3JtPyBJIHN1c3BlY3QgdGhhdCB0aGUgcG9sbGluZyBm
b3IgaGFsdCBzdGF0dXMgaXMgdG9vDQo+Pj4gcXVpY2ssIHdlIG1heSBuZWVkIHRvIGFkZCBzb21l
IGRlbGF5IGJldHdlZW4gcG9sbHMuDQo+Pj4NCj4+IFdpbGwgdHJ5IHRvIGNvbGxlY3QgYSBsb2cg
Zm9yIHlvdSBhZnRlciBhZGRpbmcgdGhlIG5ldyBjaGFuZ2VzIChpZiBJDQo+PiBydW4gaW50byB0
aGlzKS7CoCBJIHRyaWVkIHRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2YgbG9vcHMgYXMgd2VsbCwg
YnV0DQo+PiB0aGF0IGRpZG4ndCBoZWxwLg0KPj4NCj4gSSB0aGluayB0aGUgcmVhc29uIGZvciB0
aGUgbm9uLXplcm8gR0VWTlRDT1VOVCBpcyBwcm9iYWJseSBkdWUgdG8gdGhlDQo+IGZhY3QgdGhh
dCB3ZSdyZSBzdGlsbCBnZXR0aW5nIEVQMCBldmVudHM6DQo+IA0KPiBbIDM1NDguMDQwODU5XVtU
MjAwNTFdIGR3YzMgYTYwMDAwMC5kd2MzOiB1bmV4cGVjdGVkIGRpcmVjdGlvbiBmb3IgRGF0YQ0K
PiBQaGFzZQ0KPiBbIDM1NDguMDYxMjgyXVtUMjAwNTFdIGR3YzMgYTYwMDAwMC5kd2MzOiB1bmV4
cGVjdGVkIGRpcmVjdGlvbiBmb3IgRGF0YQ0KPiBQaGFzZQ0KPiBbIDM1NDguMDcxNDI5XVtUMjAw
NTFdIGR3YzMgYTYwMDAwMC5kd2MzOiB1bmV4cGVjdGVkIGRpcmVjdGlvbiBmb3IgRGF0YQ0KPiBQ
aGFzZQ0KPiBbIDM1NDguMDgzNDk5XVtUMjAwNTFdIGR3YzMgYTYwMDAwMC5kd2MzOiB1bmV4cGVj
dGVkIGRpcmVjdGlvbiBmb3IgRGF0YQ0KPiBQaGFzZQ0KPiBbIDM1NDguMDk1NTQ2XVtUMjAwNTFd
IGR3YzMgYTYwMDAwMC5kd2MzOiB1bmV4cGVjdGVkIGRpcmVjdGlvbiBmb3IgRGF0YQ0KPiBQaGFz
ZQ0KPiBbIDM1NDguMTA1ODIwXVtUMjAwNTFdIGR3YzMgYTYwMDAwMC5kd2MzOiB1bmV4cGVjdGVk
IGRpcmVjdGlvbiBmb3IgRGF0YQ0KPiBQaGFzZQ0KPiBbIDM1NDguMTIyMDI3XVsgVDIxODldIGR3
YzNfZ2FkZ2V0X3J1bl9zdG9wOiBwdWxsdXBzX2Nvbm5lY3RlZCA9IDANCj4gWyAzNTQ4LjE1Njc3
MF1bIFQyMTg5XSBHRVZFTlQgQ09VTlQgPSA4DQo+IA0KPiBJbiB0aGUgY2hhbmdlcyBwcm9wb3Nl
ZCwgeW91J3JlIGJsb2NraW5nIHRoZSBpbnNwZWN0IHNldHVwIEFQSSBpZg0KPiAhZHdjLT5jb25u
ZWN0ZWQsIGJ1dCBkdWUgdG8gcmV0ID0gLUVJTlZBTCwgdGhlIGV4aXQgcm91dGluZSB3aWxsIGdv
IGFuZA0KPiBpc3N1ZSBhIHN0YWxsIGFuZCByZXN0YXJ0IG9uIEVQMC7CoCBJIHRoaW5rIHlvdXIg
bWFpbiBpbnRlbnRpb24gd2FzIGp1c3QNCj4gdG8gaWdub3JlIGl0LCBjb3JyZWN0Pw0KPiANCg0K
Tm8sIG5vdCBqdXN0IGlnbm9yaW5nIGl0LiBUaGUgaW50ZW50aW9uIGlzIHRoYXQgd2hpbGUgcG9s
bGluZyBmb3IgdGhlDQpoYWx0ZWQgc3RhdGUsIHRoZSBkcml2ZXIgd2lsbCBjb250aW51ZSB0byBz
ZXJ2aWNlIGFueSBpbnRlcnJ1cHQgDQpnZW5lcmF0ZWQgYnkgdGhlIGNvbnRyb2xsZXIuIElmIGl0
J3MgYSBjb250cm9sIHRyYW5zZmVyLCB0aGVuIHRoZSANCmNvbnRyb2xsZXIgd2lsbCByZXNwb25k
IHdpdGggYSBTVEFMTCBhbmQgcmVqZWN0cyBhbnkgbmV3IGNvbnRyb2wgDQp0cmFuc2ZlciBhbmQg
c2V0dXAgYSBuZXcgVFJCIGZvciB0aGUgbmV4dCBzZXR1cCBzdGFnZS4gVGhlIGludGVycnVwdCAN
CmhhbmRsZXIgd2lsbCBjbGVhciB0aGUgR0VWTlRDT1VOVCB3aGlsZSBwb2xsaW5nIGZvciBoYWx0
ZWQgc3RhdGUuIFRoZSANCmV4cGVjdGF0aW9uIGhlcmUgaXMgdG8gcG9sbCBmb3IgdGhlIGhhbHRl
ZCBzdGF0ZSBsb25nIGVub3VnaCBmb3IgdGhlIA0KaW50ZXJydXB0IGhhbmRsZXIgdG8gY29tZSBh
bmQgY2xlYXIgdGhlIEdFVk5UQ09VTlQgYmVmb3JlIHRoZSB0aW1lb3V0Lg0KDQpMb29rcyBsaWtl
IHNvbWVob3cgdGhlIHBvbGxpbmcgZm9yIHRoZSBoYWx0ZWQgc3RhdGUgYmxvY2sgdGhlIGlycSAN
CmhhbmRsZXI6DQoNClsgMzU0OC4xMTc4NzIyODUgICAgICAgMHhmZjgyOGE2YWJdICAgZGJnX2dh
ZGdldF9naXZlYmFjazogZXA3aW46IHJlcSBmZmZmZmY4MDQxNTc1NjAwIGxlbmd0aCAwLzY1NTM2
IHpzSSA9PT4gLTEwOA0KWyAzNTQ4LjEyMDY0NjgxNiAgICAgICAweGZmODI5NzZjM10gICBkYmdf
c2VuZF9lcF9jbWQ6IGVwOGluOiBjbWQgJ0VuZCBUcmFuc2ZlcicgWzExMGMwOF0gcGFyYW1zIDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIC0tPiBzdGF0dXM6IFN1Y2Nlc3NmdWwNCg0KVGhlcmUn
cyBhIDMwbXMgZ2FwIGhlcmUuIFByb2JhYmx5IGR1cmluZyB0aGUgcG9sbGluZz8gKHdvdWxkIGJl
IGdvb2QgdG8gDQpoYXZlIG1vcmUgcmVnaXN0ZXIgcmVhZC93cml0ZSB0cmFjZXBvaW50cykNCg0K
WyAzNTQ4LjE1MTMxNDQ3MyAgICAgICAweGZmODMyNzJkN10gICBldmVudCAoMDgwMDAxYzApOiBl
cDBvdXQ6IEVuZHBvaW50IENvbW1hbmQgQ29tcGxldGUNClsgMzU0OC4xNTE3NjA5MzEgICAgICAg
MHhmZjgzMjk0NTFdICAgZXZlbnQgKDA4MDAwMWMwKTogZXAwb3V0OiBFbmRwb2ludCBDb21tYW5k
IENvbXBsZXRlDQpbIDM1NDguMTUyMTA0NTc3ICAgICAgIDB4ZmY4MzJhZTE4XSAgIGV2ZW50ICgw
ODAwMDFjMCk6IGVwMG91dDogRW5kcG9pbnQgQ29tbWFuZCBDb21wbGV0ZQ0KWyAzNTQ4LjE1MjQ1
MjQ0MSAgICAgICAweGZmODMyYzgyZV0gICBldmVudCAoMDgwMDAxYzApOiBlcDBvdXQ6IEVuZHBv
aW50IENvbW1hbmQgQ29tcGxldGUNClsgMzU0OC4xNTI4NDI3MDIgICAgICAgMHhmZjgzMmU1NzRd
ICAgZXZlbnQgKDA4MDAwMWMwKTogZXAwb3V0OiBFbmRwb2ludCBDb21tYW5kIENvbXBsZXRlDQpb
IDM1NDguMTUzMjUwMTUwICAgICAgIDB4ZmY4MzMwNDAzXSAgIGV2ZW50ICgwODAwMDFjMCk6IGVw
MG91dDogRW5kcG9pbnQgQ29tbWFuZCBDb21wbGV0ZQ0KWyAzNTQ4LjE1MzY1NzI4NSAgICAgICAw
eGZmODMzMjI4Yl0gICBldmVudCAoMDgwMDAxYzApOiBlcDBvdXQ6IEVuZHBvaW50IENvbW1hbmQg
Q29tcGxldGUNCg0KDQpDYW4geW91IGFkZCBtc2xlZXAoMSkgaW4gYmV0d2VlbiB0aGUgcG9sbGlu
ZzoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQppbmRleCBlZThlODk3NDMwMmQuLjljMGQ2MWEyZGQ4MiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCkBAIC0yODE0LDYgKzI4MTQsOCBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3J1
bl9zdG9wKHN0cnVjdCBkd2MzICpkd2MsIGludCBpc19vbiwgaW50IHN1c3BlbmQpDQogICAgICAg
IGR3YzNfZ2FkZ2V0X2RjdGxfd3JpdGVfc2FmZShkd2MsIHJlZyk7DQogDQogICAgICAgIGRvIHsN
CisgICAgICAgICAgICAgICBtc2xlZXAoMSk7DQorDQogICAgICAgICAgICAgICAgcmVnID0gZHdj
M19yZWFkbChkd2MtPnJlZ3MsIERXQzNfRFNUUyk7DQogICAgICAgICAgICAgICAgcmVnICY9IERX
QzNfRFNUU19ERVZDVFJMSExUOw0KICAgICAgICB9IHdoaWxlICgtLXRpbWVvdXQgJiYgISghaXNf
b24gXiAhcmVnKSk7DQoNCg0KKElmIHRoaXMgd29ya3MsIHdlIGNhbiBzbGlnaHRseSBtb2RpZnkg
dGhpcyBsb2dpYyB0byBzYXZlIDFtcykNCg0KQlRXLCBpcyB0aGVyZSBhIHByb2JsZW0gd2l0aCBl
bmFibGluZyBvdGhlciB0cmFjZXBvaW50IGV2ZW50cz8gSSBoYXZlIHRvIA0KbWFrZSBzb21lIGd1
ZXNzZXMgd2hlbiByZWFkaW5nIHRoZSBsb2cuDQoNClRoYW5rcywNClRoaW5oDQo=
