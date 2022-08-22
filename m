Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF19C59C287
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 17:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236543AbiHVPWg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 11:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbiHVPWR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 11:22:17 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B49C3E769
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 08:16:19 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M8wShq022903;
        Mon, 22 Aug 2022 08:16:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=cabbLGZgsuo8IlNCbjAjuIfyhcFBve7aJPiU6eVq12g=;
 b=SoLwWjgXC67b7af0dMZSsQLh/9Z0kxGhTeoUIe9lod4Mf5ALR6Qa8n4GvNLl6jpySD2M
 +cdp4ITbXgOgGJpz37jTNSDdRM209pQJgBCjoP4Y2vSqT4O4TBEusY87/ozn5Jy+5j1W
 y6c2v+nJCxipLKtCNq4w1p5zuCpIuBwkZz9CvXIDS4rh4uJU2ZAK54C3PBsFobRgJwRc
 owhVt6mIcr98Y/mh/pxagW/ulduBdr9X/Z55pyx+9bz4+NGdxdVnAfFv3smHJt6/8XNj
 rCMHDfR0BNcQA7w6ddlTavWvCBbDA9kscI2RnDSyjEEbh5hslcYMb5cuk4OGSjXB1b+Q rA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3j2xmkqqnq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Aug 2022 08:16:14 -0700
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 373DF40052;
        Mon, 22 Aug 2022 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1661181374; bh=cabbLGZgsuo8IlNCbjAjuIfyhcFBve7aJPiU6eVq12g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bI4YpKreNFLA1Lemgj71HTddWJ2ynR5RdPfh8OSHIHhVB9R2VyGDKPpAgx4YZ5d87
         WVQl/3ACMVBA58MgqRfmYroPdc0PntHrtJPnLS+n7ijtB1COra32tb35DTY9uT40RU
         jfFx9ML04tEY9L1ZJrFpZdIzCyZQvSme8nBckgfV4V+nsZeN0V06Lx4sboyr3Gqa/x
         XOCSRJE+MrjJf8j4Cr1JaX4V7ZtM21NF8qqXLOIiFNT56pL3k2Xb8vmTZuqpFg62GH
         +DdEO/1HK/1AouB0tu6aAprVQRHJFsoh/bDUVNIm3rbu7haqHv37QD1QsXiz48pofZ
         SS5JYFeG7KHqQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id CFFBEA005C;
        Mon, 22 Aug 2022 15:16:11 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9374B800AC;
        Mon, 22 Aug 2022 15:16:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gcsc8ZfT";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S86c9Mlug3JunE/6n7Ot8KN2bNg3sNrnfOBLKZp3zTy3+V4hFX7zOrwebVCphJuiza5iTJCKNnaPkoFH2VO8dmTAEZgztDMRZtJ3qMEbrIZ3PYDp/VKdRfc7DZrUYuHMSm7LZlndn7s54LLSuyEToHUytjcLSKjxzSCROli1DZi35zEevpu68jazVLmpcCj4+PU2N6mhj4WXyvKTFCEEz53b7Nr7jCAzRqACdDZj7NNOxRzQmcD0/TfaQh4WNR4KfzoxxlrsmpwJJbBnjEV7Rl2/s9RIolP9TYVV67gMvIc5dTiyfEZJ24bbr1W5TTCmLfeJuxGNwfrt+C9b59wQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cabbLGZgsuo8IlNCbjAjuIfyhcFBve7aJPiU6eVq12g=;
 b=fWjpzLjDsHh+2JtGtkv16ZH65MP9yCg6B11P4nFpMRn0AypM9LzSn8MUsHDewvxoqPgek6PRCpimfEjhleM8+3WBOjKM0ANMqGQFA37PW+X//U2o0xq1hL0IJWpc8mOEK4a/erLR53/tApap0cdjhqTb9nTDjw2WEJVRhvrO779ihQx6Xe9q49wgQ7jh6rdZHIItqRoG6+YfhLzTJ1qEEG0hYyiix24Emc3YvNPh72XUEr3comZWdEjXAR1KnrQYTLGGmdpnUZS2dXKvzCE6XrK2Q4LXrGTbgdZQMuGXxEdRqcOLfW0xBqHXJzDDq4xSRucoLUPk3wwjd9MPX3cGWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cabbLGZgsuo8IlNCbjAjuIfyhcFBve7aJPiU6eVq12g=;
 b=gcsc8ZfTYJU6G+5jkcBLJmaIjo79llkkQzBdrJU05AM3R6KrsIU7xdAkTVcnCDuXcPkzbCSeiG8s1EUhi0jNXxWW2sKiKj8K7Rl62ZUHA5GEnhoSrFgIw1zHGkBaJxgdLg/wzZw6wR8U6AHH6Zq0kg6diRX/aC4glLgn8y1YUJ8=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CY4PR12MB1445.namprd12.prod.outlook.com (2603:10b6:910:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 15:16:05 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::6d63:11b4:5275:4ee1]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::6d63:11b4:5275:4ee1%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 15:16:05 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: dwc2: fix wrong order of phy_power_on and phy_init
Thread-Topic: [PATCH] usb: dwc2: fix wrong order of phy_power_on and phy_init
Thread-Index: AQHYtLy7Sk7VmSLfV02fAY1easYTaK26rKIAgABYRICAAAXRAA==
Date:   Mon, 22 Aug 2022 15:16:05 +0000
Message-ID: <0c01b814-3390-6bc0-1fa6-9302eb45233c@synopsys.com>
References: <f5632bde-0c34-9696-e979-497ef4fc9556@gmail.com>
 <f03187fc-59a5-a174-691a-687598c903a5@synopsys.com>
 <85ba1e59-de83-e3c9-1025-28b4642f66b3@gmail.com>
In-Reply-To: <85ba1e59-de83-e3c9-1025-28b4642f66b3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8475add8-c782-4dfc-75ae-08da84513be0
x-ms-traffictypediagnostic: CY4PR12MB1445:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: txbv4HFqS70wstic4h7qd1U6d9okdc5KrE4JGq5MPRmJzh0OoHSMQa3V+ijTQCX4qEjYTKNqNw6x9V5v5TIHa25aEgEGx+9QnRfVFDwvYHt9FKSgUHbn7RP/3fpCQO1O2UIgGQpr/n7xJlIE9iPUAxn/kzZOIKthYcYCqwWHrJHuqa8ms24SdjwdUnUb/CnPFm1p4CONU/DJccSowbpIC0U/7oeKBMw9gWh2qXJYzpvA5ecypeC6zDOZU9qrzPBDlX4SHcjzdpaIVhKwAOlQhyuPNGgdFTZcoKVsJnitxP7w5+y5RpObeiQ+F9808wfKeyfCZE5uYSET6oLJKRc1uo4xDa9bCNOKToRxF0R3hKo/XWPSy4vSRjeplPcR0f0ycQ9+wkOs46MncaK4gGCY8VvQiSezTGbE7b6QntH5y9qnu79TiF4k+w2IuPVz7zyDQc7EWpANCaVpbqwbkMF7/WNZbJnhT5otOF93v5nuLfmEBMnCEkAUFnsuluJ2UPx9v+kKDfNLBWAb+iywS5OXKMPPdqLRUI6DsQy6ymG1effJVT502EnndGq0ge0brTuwJBTp/yT1Qlz6RUlRxGTf/hqOlypJgs+nHBL6SqOW1sgMyewOaqkGZ2zWx/F5SJr07dx6cZW4QAdenLHrfF6x8kHw0fjjrtj6DyBg53PAb41CNt5f0xqTObUylCHH2N1I6wfq+V90B1lvFx0cbcw2iulM26LnIu9CgQkNxvXWWay2X9pMqn8L1bX2/Mt21FHv3mYxUzYJPumAo8kAeZ9bFSPZB0fP4h4jLfW4UGtqJ4HMJZ9aRgBQ1x+qzEqfLBkh+nOCLamMMtOohB+Z+PdIaA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(366004)(39860400002)(396003)(346002)(31686004)(6486002)(478600001)(316002)(6506007)(6512007)(5660300002)(8936002)(26005)(71200400001)(2616005)(2906002)(186003)(86362001)(53546011)(54906003)(110136005)(41300700001)(31696002)(38100700002)(83380400001)(8676002)(66446008)(4326008)(64756008)(122000001)(76116006)(36756003)(66476007)(91956017)(66946007)(66556008)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVAzYlhEWVcycUkxaUowWHJocTZTbFY0YnFPN2ltOGR0L3VJTE5RS1RaVnJK?=
 =?utf-8?B?a0tNZGR6Z0VwZkN1MG5PNU9aeGtXTDFCRE4vMGczeS9OR2s0UmNwU1lYVm1z?=
 =?utf-8?B?djVkRzBMMGdGM3hmNk1xRkFVUlZuTCtabU0yNkVWLzJZT1JRZ3IxaXBoVkw0?=
 =?utf-8?B?OGRqYU5yUzFZaWp5ZU1kNHhLMTVyd1hKc2FzamlTV0dDcFZPUm0vVG1OSFkx?=
 =?utf-8?B?K1FwWktXek5MVzl0Vmt1N0ZEdnVQdVphVzZiYld0SXNzMUtDSnJCckpvV2NV?=
 =?utf-8?B?Q3VCdldBa1liWGdNamsrZXRNbE9wZHFnMUNJNHpBOERaNVJoRVJCdVV4cU9B?=
 =?utf-8?B?aHZnYWJJdkgzS042SG95aHNqV2p2QlF2ZXROM05HYXREMENUbUdWMkRoUlR4?=
 =?utf-8?B?ZERXajdqbVk3bnFzcXVWV3h0QWVBbGdhcGhPM3lMQTlqZmVZNDFJd2R5emo4?=
 =?utf-8?B?cmpUT20xd1JPaWk4VkwwTjQ0bVdUdjRodDdHd1NJdjFjb3RkbHF0VGVmRHJY?=
 =?utf-8?B?dFpTSlRKcCtJY0kySVk2OWt5R1RRK1psYytDWHZCcWtNcnJtRnE5bTMycm9x?=
 =?utf-8?B?VnZkcVpKYTRYN0J5djNHWCtlTUt6R2pteWYrdC96cXlvNGJtbkFxVHlZZG1D?=
 =?utf-8?B?NnRiMCtLdFlldlFUY1lyd05UOTFLR1FwVGtEbWJCaERJRUUyNzN3N3dBQUpQ?=
 =?utf-8?B?R1JNMUMxQTFFQjNGdlNabWtkUkRlZHh2R3ZRUXQ2R3phb2RoUy9NR1Y3Rlha?=
 =?utf-8?B?RWRDRUVIbGVNQ3pRZXpOQkZIQkRFQjdNdTVBcm1CKzQ1dmtJSE9oOXM0U2Yw?=
 =?utf-8?B?MDE3S2tHOEJ1bDdSYWo2TW0yMCtQUmFReW5UT0JIZTcvVGVhT3VPTU1JUEY1?=
 =?utf-8?B?N2tSNmcrY0xRN1pKbFgzQ1l5cjlpczNGeXJsNUJ5Z0VXRXJYWFg5SXdqY0pZ?=
 =?utf-8?B?SEFYKzFZTUNjbjN6S1o3ZFc1Nm1Lcmc3NDQ1d3VmS2wwa245R1BsUFZuYy82?=
 =?utf-8?B?aHhHRWpGK29uQTFCdi9kbVNiZEhXTTEvUFExcU95bmFmL2tpdWl3b2pOYjEz?=
 =?utf-8?B?Rmk4Q3k4cGhRNGdQM3ZsNnE2V2g2VTVlK3ZHT3JQUUFwWGpPMlF0YzdkVG9w?=
 =?utf-8?B?T2N1MmF3QWlCVFo4dnkxbEdQQWxYbWE0VXV0Wm94SFV3cW03RitUa0E5a0hl?=
 =?utf-8?B?WjZTM29ObUN1QlExR2JrZm9lQndVcjQxNW4yd0szK3Q2WHdjdXZDWUY2akhl?=
 =?utf-8?B?TEVwYWZhTnFFQXRaZXA0ZG9odmJUa1NybzlJK1liaVNIdFpEclZPbVQrZVFW?=
 =?utf-8?B?OEx2MDhReXJUdW9KN2pjMVlFL09CdHhFa2NJMXc3NWY2U2dIU1d6UU5DQ3JL?=
 =?utf-8?B?U0gzbG9HQWI4RGRLSFdUVlRnZVZVSnJ0d0p0ZWVZSGg1M0RrbFppai9FcGY1?=
 =?utf-8?B?eGFhVWczWXZsTjlzN0ZHN3UvR0lCQnlGRHRrWSt2aUg4VmZtdEliUkNQSE8v?=
 =?utf-8?B?c2hzSklTRW5DUUp5cTYwbFdPMWRPWk42cWZSMU1MQjAxTlEvbHNCZG1ZT2pC?=
 =?utf-8?B?elcrU2puN2t0aTVob2xuMlh4eUtBcUh5b29qVG1MOTdja2c4WWZLcGZuS3dx?=
 =?utf-8?B?ZktHa1pRbTFENmU4V3o5UU9rT0hSbk41Y2RoY3V1OTZSbHdNYk9YUWdXQTBv?=
 =?utf-8?B?Mzh5clR0c05salJPUmNuNWorZEorZUxSbE84cGFEbGdtNkh3TnNMRTF2bXJz?=
 =?utf-8?B?UVFMbnlSdGQvbm9hZmdNV1lnWUZaalMwRjhXcHlrc2hscHpGWVJ4ZFRiYmNh?=
 =?utf-8?B?VS92TERGUDd1VEN5ZHcwL2JEWlYwNzd0ZnlPNTVWWWFuMjVneVg2OHpQTmhH?=
 =?utf-8?B?S0oyTjhzaEpNa2ZCcGN2bmVjZEFyTUNSbXpscXRZall2aDFhM1cvNVhCVWVh?=
 =?utf-8?B?SU5Ka2V1WitTdmI0dEkyS2VvMHJaOEhLc0hwWFA0MitkM09hMVhnUEtaRFl5?=
 =?utf-8?B?ZEFycnRhRG5idEIxbnZieWg1aHJScU9YWXVuTTNHV2REWDBBUGZRZ2JxVUZl?=
 =?utf-8?B?czA0WGtqTkp0MFF1ZDQ2azZaRmRpdk8vWEhtTGlvTEZENWJlQWVDa1dORFBV?=
 =?utf-8?Q?HmC0PpSpMXMrt5nEBhrl3zZzf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD163FAA3DA8C24C9E4AE1EC24358FEB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8475add8-c782-4dfc-75ae-08da84513be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 15:16:05.7817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6e4Dr630QOjpHHy1PROHNW3AqhXTGVq1RBBqV6mYDax+H9IJkoLrQAngV5mjW0siOlSGoZ0TghlFr6+GzEcbjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1445
X-Proofpoint-GUID: ODNuQPlc_FuLYwIYXITtZAC5hf5lDbQO
X-Proofpoint-ORIG-GUID: ODNuQPlc_FuLYwIYXITtZAC5hf5lDbQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_09,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=968 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208220065
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gOC8yMi8yMDIyIDY6NTUgUE0sIEhlaW5lciBLYWxsd2VpdCB3cm90ZToNCj4gT24gMjIuMDgu
MjAyMiAxMTozOSwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+PiBIaSBIZWluZXIsDQo+Pg0K
Pj4gT24gOC8yMC8yMDIyIDk6NDUgUE0sIEhlaW5lciBLYWxsd2VpdCB3cm90ZToNCj4+PiBTaW5j
ZSAxNTk5MDY5YTYyYzYgKCJwaHk6IGNvcmU6IFdhcm4gd2hlbiBwaHlfcG93ZXJfb24gaXMgY2Fs
bGVkIGJlZm9yZQ0KPj4+IHBoeV9pbml0IikgdGhlIGRyaXZlciBjb21wbGFpbnMuIEluIG15IGNh
c2UgKEFtbG9naWMgU29DKSB0aGUgd2FybmluZw0KPj4+IGlzOiBwaHkgcGh5LWZlMDNlMDAwLnBo
eS4yOiBwaHlfcG93ZXJfb24gd2FzIGNhbGxlZCBiZWZvcmUgcGh5X2luaXQNCj4+PiBTbyBjaGFu
Z2UgdGhlIG9yZGVyIG9mIHRoZSB0d28gY2FsbHMuDQo+Pj4NCj4+PiBGaXhlczogMDlhNzVlODU3
NzkwICgidXNiOiBkd2MyOiByZWZhY3RvciBjb21tb24gbG93LWxldmVsIGh3IGNvZGUgdG8gcGxh
dGZvcm0uYyIpDQo+Pg0KPj4gQWRkZWQgQ0M6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3Nr
aUBzYW1zdW5nLmNvbT4NCj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+DQo+Pj4gLS0t
DQo+Pj4gICAgZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jIHwgNCArKy0tDQo+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMgYi9kcml2ZXJzL3VzYi9kd2My
L3BsYXRmb3JtLmMNCj4+PiBpbmRleCBjOGJhODdkZjcuLjRkYjdhMThhNSAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4+PiArKysgYi9kcml2ZXJzL3VzYi9k
d2MyL3BsYXRmb3JtLmMNCj4+PiBAQCAtMTU0LDkgKzE1NCw5IEBAIHN0YXRpYyBpbnQgX19kd2My
X2xvd2xldmVsX2h3X2VuYWJsZShzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+Pj4gICAgCX0g
ZWxzZSBpZiAoaHNvdGctPnBsYXQgJiYgaHNvdGctPnBsYXQtPnBoeV9pbml0KSB7DQo+Pj4gICAg
CQlyZXQgPSBoc290Zy0+cGxhdC0+cGh5X2luaXQocGRldiwgaHNvdGctPnBsYXQtPnBoeV90eXBl
KTsNCj4+PiAgICAJfSBlbHNlIHsNCj4+PiAtCQlyZXQgPSBwaHlfcG93ZXJfb24oaHNvdGctPnBo
eSk7DQo+Pj4gKwkJcmV0ID0gcGh5X2luaXQoaHNvdGctPnBoeSk7DQo+Pj4gICAgCQlpZiAocmV0
ID09IDApDQo+Pj4gLQkJCXJldCA9IHBoeV9pbml0KGhzb3RnLT5waHkpOw0KPj4+ICsJCQlyZXQg
PSBwaHlfcG93ZXJfb24oaHNvdGctPnBoeSk7DQo+Pj4gICAgCX0NCj4+PiAgICANCj4+PiAgICAJ
cmV0dXJuIHJldDsNCj4+DQo+PiBTaG91bGRuJ3QgYmUgdXBkYXRlZCBmdW5jdGlvbiBfX2R3YzJf
bG93bGV2ZWxfaHdfZGlzYWJsZSgpIHNpbWlsYXJseSwNCj4+IGFjY29yZGluZzogcGh5X3Bvd2Vy
X29mZiBtdXN0IGJlIGNhbGxlZCBiZWZvcmUgcGh5X2V4aXQoKT8NCj4+DQo+IEluZGVlZCwgdGhp
cyBzaG91bGQgYmUgY2hhbmdlZCBhY2NvcmRpbmdseS4NCg0KQ291bGQgeW91IHBsZWFzZSBhZGQg
dG8geW91ciBwYXRjaCBmaXhlcyBmb3IgDQpfX2R3YzJfbG93bGV2ZWxfaHdfZGlzYWJsZSgpIHRv
byBhbmQgcmUtc3VibWl0Lg0KDQpUaGFua3MsDQpNaW5hcw0KDQoNCj4gU2VlIGtlcm5lbCBkb2M6
DQo+IA0KPiAgICogcGh5X2V4aXQgLSBQaHkgaW50ZXJuYWwgdW4taW5pdGlhbGl6YXRpb24NCj4g
ICAqIEBwaHk6IHRoZSBwaHkgcmV0dXJuZWQgYnkgcGh5X2dldCgpDQo+ICAgKg0KPiAgICogTXVz
dCBiZSBjYWxsZWQgYWZ0ZXIgcGh5X3Bvd2VyX29mZigpLg0KPiANCj4+IFRoYW5rcywNCj4+IE1p
bmFzDQo+Pg0KPiANCg0K
