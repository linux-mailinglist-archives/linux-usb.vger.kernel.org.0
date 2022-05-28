Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA9A53698F
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 03:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbiE1BGJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 May 2022 21:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbiE1BGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 May 2022 21:06:07 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F74265D05
        for <linux-usb@vger.kernel.org>; Fri, 27 May 2022 18:06:06 -0700 (PDT)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 81D42C06C8;
        Sat, 28 May 2022 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653699966; bh=a/Fq/ZxE4M8jbxW898QYsTlIKMTrqzY7x239xuePhBY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DMkt514yIBDv4CuC+k51ksuXH/++GktcznmO437grg8e40C/mQ3ZfNNqCy2mNf4S2
         MXCNnjEJ5NWubsVvR7FJnITpzQ6SfQFRjM4D+oOEmmrTTXwLxbuPK00uI3rBFygaMD
         oZZtexI991WWG216NnDWOllSE77/gJk1y7sz7LgZkSHvbSpX2x/2H6SvYHCKax6wHn
         y5bTN76uB983uRq/2uGuuXMi9HTBDhe9EZ+yTOSftTVlyZWYBrGQyQJKaWnLDYNKr9
         VmIeP75/DOKK4fbsYHfzXSwQ8OIIJ5VZ4Bq8gaK9mh1Z8mCSvedAk3tjZ/Piifydph
         TOQKU5CUsNwKA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 71057A008E;
        Sat, 28 May 2022 01:06:04 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 042FB40085;
        Sat, 28 May 2022 01:06:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="eAAzQypA";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6S9BWaJtGbBcxL0FlMgdvkLkcKbwQyXLbOe6hqFnCfsYP1YLRZiJzxGgxSvpDcc/uXYc87Ag0flXu81uTvTxO63YuCjvUxVJ9l/EXLmuzHdfS4uoLuoqhaPItoCIpQWnRWxv9d055z10uJn29lt5AM73m8z0mcXtKpykVO0C8BactZ/AgUeSNjnUEu6rY09IllnTH3Z69rqLCPleH/3gEm6L/xO5nRDES5M4IJBxpV+9leTFbK7hgzcB6agXaUsLzlwO2XVx1rMrKIIBMApKDBA85PPzEKMAAe2a+cm94fF+QOZwjewj9GiDcsZ+FNWQcBNyN2o1RgGwkqondnlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/Fq/ZxE4M8jbxW898QYsTlIKMTrqzY7x239xuePhBY=;
 b=dUANvcbYYmLLw1kYMveh98L6Tv9osAYB619NToxNTNM+CfPP+cAkhx7y6gN8JbAHzWv01pRQVFFAxEGQM9+DZYp4WGWm7H+HqkDvzECI/m4w9AIyuVNLNDvUftudMCj7C1yaua6NG9mhHS0WdofPfIexqo2nJx+H4BxkW1NmFxA7HFgfgF8zsumH77bz8ra8GzOhs/cK5liPpMphchiou0QN9hr6+meELbkMn9VdyDH8UFGc/JOPInKbsh5xGMKMCEZv7nf8Dbw3CCtLHyi8LfJhzoVh4jYId7KJx8fiSN5Dx3EJpK20rXqhsi+SXJRjlTRNA/3M/3vNUIKPGgN5gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/Fq/ZxE4M8jbxW898QYsTlIKMTrqzY7x239xuePhBY=;
 b=eAAzQypAb2Gt3USxtdQB7xFeu3aDjxoVnWFLjv7H2OGnUyNemUNA09Jw7EigKlAgPT8PZ8/AMBPic4KG/4qrrgkLcplj8wUQZYmaslTfVzcN7vx2L2gROMZekVcdn0DN+BgA6Vid1TNqJrnH1kDx7pAoOASDumFFkZdHUGvZ+3U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sat, 28 May
 2022 01:05:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5293.013; Sat, 28 May 2022
 01:05:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "jindong.yue@nxp.com" <jindong.yue@nxp.com>
Subject: Re: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcapxfZzJHZZbuU6v/rtjLbC2Sq0zetYA
Date:   Sat, 28 May 2022 01:05:57 +0000
Message-ID: <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37cd58b2-80c0-4c0b-12cc-08da404638e7
x-ms-traffictypediagnostic: IA1PR12MB6162:EE_
x-microsoft-antispam-prvs: <IA1PR12MB61620C374375004EEE10F569AADB9@IA1PR12MB6162.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iSKVJsIgqvR/VE0h7ctHIuHUWKv4eNX3X13XXesZHbdJaOqHE6ad53maS/F0yFQ4KS91gZXJWuiQ7Adl0D6s0hWWNxNWpTaGPnteaVADRSEvm/hXUgdvpMHYcso12w3Tm2SVbbTLYlfhEYaaIQkZYoWr/Z7V9jbzOB2AsP9rPpsjvUA96BVHIC+/qMHjyltJjqewn0sKebktqTvz5LyIlm8Co2lh1iExE42DdWjXlpj72N60kojfxpI6cNU6KipJbh+f64ZMlvX2JJwhCUEOh2yU6e1Dxvh5NsvtUwdyldwbBPOmVIGs21RfKyXMzHNjucBX7+uIbVmmqgyHSyr/CQme/Jf49fkHazvIaGia5ACYwRpC0FYkTu9GHwFmdZ7W0p+19F9CmEAdglSJbhFcEX3PEcOLKvrteNwdPhIatML6fXoDQA4EyiMLS+WVUifh7xhrUoc5c5KaR9jkILa8pZ+dZNgNeW/+7v+mmnMTTBXbk/wOVSx4KKxS/cf5x0IHO7oG8Y4o6a6sj2lcA83qpvOzNC6sBY1QglvC1qJ+K2qqQVhCOSZYSnBmRZOEpOAiku974Db0zz0ZNI6cTpnpig9L7HJPVlnKs2uMg61iEB6H4Zf/g9xmUQ3BPiJtsxq+dSMvCpIQ8MeV4O9A/chgqzsKTPQhCt9Y8Se0VGwKqQyXKolej2vzU1ET2SlzhiSUbriaG05A3k99UaASx1cpAJtMlWoWMxx3G8o7mOAh98RJsfgHfLQl7Paafa9EMkqWbADNc69Zpdqb+yYUNdfpWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(38100700002)(316002)(6486002)(76116006)(38070700005)(31686004)(8936002)(186003)(4326008)(8676002)(26005)(31696002)(6506007)(86362001)(36756003)(2906002)(122000001)(54906003)(5660300002)(508600001)(83380400001)(66476007)(2616005)(66556008)(66446008)(64756008)(6512007)(110136005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUprWWJjTjM0cjZCbHp4YWp6d3pTK3JtckFITHE1NnEwaHdMTXVyRWhRbm1a?=
 =?utf-8?B?ZGxrQlMrK3dtWlREU1dNYjRzZXhSa0V6WWhhNlJtVlpaOEZ1NitrUTRiSjNp?=
 =?utf-8?B?VWFLRnFlY2pLR0tIeVdLTVJzdVd5OEJCYkJwRlRmNFFCb0NzMVg2UzFzRk5n?=
 =?utf-8?B?RXVOaEltNDRrSmpSMlN5cXBudS84UWs5TkhzSVNyRjhZYWx4Q0V3MGkxMkdS?=
 =?utf-8?B?VWd4N2ZzOUFpOHhZMnpzTXBPWC9nbTVPa0pKVVFUVkhCQ3htYXZhNm1XNlpI?=
 =?utf-8?B?a2NQcldHQld6alh4R1ZmbWdDTzFBOG93clNUcExGMmFqVGtMaktqU1dVUUJj?=
 =?utf-8?B?dThkZGNOYXIwSGpTU3JXbWRmblhKbVo2ZEZWeklMRHdZN0JDTHNCVExWd2py?=
 =?utf-8?B?eEoxNVBJbnowMDJNRFNzdno3V0I2d05WQVdUN0JzUUJxY1ZCTFNjNkFVOExP?=
 =?utf-8?B?aVVNQmVkYnREQUszR3d4UWFuMmJYS0NiaHV0dURGS0p0YWdIVnhKN3o2Y0Zp?=
 =?utf-8?B?ZjgvOTVoZ1JCK0Y4RnZzTUduZjJTSDl3dWh3eldJMDEvMkVEaUdLU0tlUDZv?=
 =?utf-8?B?VjNLSDVZakNEa3FiZ1poOVBDMjV6U0IzNkRzVld2VUNqNXFnT0tuNTY1VFlK?=
 =?utf-8?B?Yks3QWVWTnN5dFg1a2J4NGVOVVQxbG5qSVpIYkNUSVdsb2ZIQnJvQXRRU0lU?=
 =?utf-8?B?MHc0WjkyclZqVlpubk96Wk45bVc0d3NPK0dWMDdhaTlXckIrNW1DQXh0WmJQ?=
 =?utf-8?B?V3BkRUZTRjkzSy9WMVN1RHcraFh0RjdJMzZjb3JkK2VSc0Qxc1UwazhCcXN3?=
 =?utf-8?B?RlVWbXl6Ni9nUWk5VlZOWERFWXR2KzBVblJKbC9JRkVnQklQQTQ1azB0M1Vw?=
 =?utf-8?B?RmFmQy9GTzFSVkRGUDd4OEsrN0RnTDNMWnlacndWR1ZwUnM0Q2dIWFhGUnJ2?=
 =?utf-8?B?MElZb1lRZmswZ1gxaGxaWUlLTS8rNFpSSHVVK05EZ0pxdVJRdVpGMVFZMXQ4?=
 =?utf-8?B?blFhMjhCNkRnRElqL3ZwSHlzWHVXQVBOQ3RMaEFnRXl4cjVoV3I3a3ZSTUhu?=
 =?utf-8?B?NjJFRG5YOEZjZ2FKRWhxRUZhVUluRTYrZkQrZFl4R2JZZDZaQzlQY1c5NGk1?=
 =?utf-8?B?Y01aWUdMRzJuWDNsMDNaa3BNU3B5RmI5NXJTa05mbVoxaS9ndGlLMFU4eGFC?=
 =?utf-8?B?VC9uaG0weFc1SFNJeHBSZEZ4anlVMFgzY0c2dDZQVE9aOHJqejR5MkRMeTBJ?=
 =?utf-8?B?OGo2SEJNcThGOWp4aHpRYnhBdisxanI4RlVLaFNXVWpvTkRkbUJJSnV4TWVv?=
 =?utf-8?B?YTZyZWNDcGkvcXZWRmJMamFndi83aDY3Z3NER2lmcWZlcXN0UjVLcHp3cHF3?=
 =?utf-8?B?MmZONFVrK1NYVUhWc0QwRUlwQVAxb0tVODNTNnBPMkFoNnppUzU5YVZ6NVZU?=
 =?utf-8?B?RHR2UEplQ2huMXQ3OVVvSW1zZDM5aC9iTHpEK3VYVFlFNjkvZ2FhWFhVWTdT?=
 =?utf-8?B?ZnV4a1FlREx2Rkk3TThnc3hvRk10SVlmOU1qd0VuWWg3WitaR216M3RhS3kv?=
 =?utf-8?B?V1Y0anpRTXVtL0MvdmpnMjQ0ajUxa3Q5TktscWlNNUlzQVh6NjI0N2RyRFIv?=
 =?utf-8?B?NWxzRFNyUnlBdHNldlp0QWhQdkplYWY1VHFnZEJuMit3MDUvbjMxRGU3enVt?=
 =?utf-8?B?VmNROFFiOFcxbGtJOTdiMVVSS0JZZjgxdFNpUnB6ODFkdEhCRzlxdXRDR2xD?=
 =?utf-8?B?RjI1L2VSbXA2MUtkRnJjRk5SaDQrb2IzTjBhWkdWd2tNQUdRRUpJMzB4Zjdn?=
 =?utf-8?B?U1pPdUJudHBoNEViK0dzWDdleDlpeXpFTVlQU2RtK1dxMjRtQWx3d2R5b0FL?=
 =?utf-8?B?WVBhVDUzRXo4bDZwMWpJaE80V1lUb0tZczA3SmUyYlFIYlc3WHNVUVhkZHlN?=
 =?utf-8?B?bkVNRFVETGVUblNTdkZGTHNzaHlvdlZpTUZ2TFFQVDZ6TktSZENrbFBOMTJR?=
 =?utf-8?B?SXl0S2tJUStTT05POFp6dU92cjJDV0xJN3hDOUFTWGVaNGROMTQ1OGpOdmVl?=
 =?utf-8?B?S0hTK2ZrZm5Oa2VOMFk2SFJ6UmVqalFDRFB0SnBGVmlOOUdWaHNQVGkwbW5s?=
 =?utf-8?B?YTZON1VJUHRVZFgxR2x6c2JIYWRmbXNyQllURncrNTJRdXJxZElERW5GcGhD?=
 =?utf-8?B?Ui9ENDNpdW1JOXhpUTFUTURyRkhIUDBKZzgweVBFcTJsUE81Yko5a1NCNC9S?=
 =?utf-8?B?VWtJZzhsZkVsY2xZTW0wR2lVR0FzdWdwZGNNcXAyZHpSQ1RINjhwZzNSYTR4?=
 =?utf-8?B?T0NVNlUyazVrYVcwYU4rMTBxTU9hTDAvVkhsSVpESFJGYTdZQzNoZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EBC3CA027EE1B44B817A7030405287F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cd58b2-80c0-4c0b-12cc-08da404638e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2022 01:05:57.2590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kneuNufQJMazkyESUSynujHXkwTM3icu6nMfW5cuViqrMKAaPCGFgjO7EOno4llrSF6qvcJcI5dlj5EN06Z1Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMjIgKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAgMSArDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGUwMjdjMDQyMGRj
My4uMTZkNDQxZGJjMjhiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTAyOSw2ICsxMDI5LDI1IEBA
IHN0YXRpYyB2b2lkIGR3YzNfc2V0X2luY3JfYnVyc3RfdHlwZShzdHJ1Y3QgZHdjMyAqZHdjKQ0K
PiAgCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HU0JVU0NGRzAsIGNmZyk7DQo+ICB9DQo+
ICANCj4gK3N0YXRpYyB2b2lkIGR3YzNfc2V0X3Bvd2VyX2Rvd25fY2xrX3NjYWxlKHN0cnVjdCBk
d2MzICpkd2MpDQo+ICt7DQo+ICsJdTMyIHJlZywgc2NhbGU7DQoNCkNhbiB3ZSBkZWNsYXJlIHRo
ZXNlIHZhcmlhYmxlcyBpbiBzZXBhcmF0ZSBsaW5lcz8gUHJlZmVyYWJseSByZXZlcnNlDQpDaHJp
c3RtYXMgdHJlZSBzdHlsZS4NCg0KPiArDQo+ICsJaWYgKCFkd2MtPnN1c3BfY2xrKQ0KPiArCQly
ZXR1cm47DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRoZSBwb3dlciBkb3duIHNjYWxlIGZpZWxkIHNw
ZWNpZmllcyBob3cgbWFueSBzdXNwZW5kX2Nsaw0KPiArCSAqIHBlcmlvZHMgZml0IGludG8gYSAx
NktIeiBjbG9jayBwZXJpb2QuIFdoZW4gcGVyZm9ybWluZw0KPiArCSAqIHRoZSBkaXZpc2lvbiwg
cm91bmQgdXAgdGhlIHJlbWFpbmRlci4NCj4gKwkgKi8NCj4gKwlzY2FsZSA9IERJVl9ST1VORF9V
UChjbGtfZ2V0X3JhdGUoZHdjLT5zdXNwX2NsayksIDE2Mzg0KTsNCg0KMTZrSHogPT0gMTYwMDBI
eiByaWdodD8NCg0KPiArCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dDVEwpOw0K
PiArCXJlZyAmPSB+KERXQzNfR0NUTF9QV1JETlNDQUxFX01BU0spOw0KPiArCXJlZyB8PSBEV0Mz
X0dDVExfUFdSRE5TQ0FMRShzY2FsZSk7DQo+ICsJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0Mz
X0dDVEwsIHJlZyk7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogZHdjM19jb3JlX2luaXQgLSBM
b3ctbGV2ZWwgaW5pdGlhbGl6YXRpb24gb2YgRFdDMyBDb3JlDQo+ICAgKiBAZHdjOiBQb2ludGVy
IHRvIG91ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0dXJlDQo+IEBAIC0xMTA1LDYgKzExMjQs
OSBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJaWYg
KHJldCkNCj4gIAkJZ290byBlcnIxOw0KPiAgDQo+ICsJLyogU2V0IHBvd2VyIGRvd24gc2NhbGUg
b2Ygc3VzcGVuZF9jbGsgKi8NCj4gKwlkd2MzX3NldF9wb3dlcl9kb3duX2Nsa19zY2FsZShkd2Mp
Ow0KPiArDQo+ICAJLyogQWRqdXN0IEZyYW1lIExlbmd0aCAqLw0KPiAgCWR3YzNfZnJhbWVfbGVu
Z3RoX2FkanVzdG1lbnQoZHdjKTsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCA4MWM0ODZiMzk0MWMu
LjcyMjgwOGQ4YzBhZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTIzMSw2ICsyMzEsNyBAQA0KPiAg
DQo+ICAvKiBHbG9iYWwgQ29uZmlndXJhdGlvbiBSZWdpc3RlciAqLw0KPiAgI2RlZmluZSBEV0Mz
X0dDVExfUFdSRE5TQ0FMRShuKQkoKG4pIDw8IDE5KQ0KPiArI2RlZmluZSBEV0MzX0dDVExfUFdS
RE5TQ0FMRV9NQVNLCUdFTk1BU0soMzEsIDE5KQ0KPiAgI2RlZmluZSBEV0MzX0dDVExfVTJSU1RF
Q04JQklUKDE2KQ0KPiAgI2RlZmluZSBEV0MzX0dDVExfUkFNQ0xLU0VMKHgpCSgoKHgpICYgRFdD
M19HQ1RMX0NMS19NQVNLKSA8PCA2KQ0KPiAgI2RlZmluZSBEV0MzX0dDVExfQ0xLX0JVUwkoMCkN
Cg0KVGhhbmtzLA0KVGhpbmgNCg==
