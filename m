Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3200C4D0D79
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 02:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244398AbiCHBYp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 20:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243937AbiCHBYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 20:24:41 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD75369D6
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 17:23:45 -0800 (PST)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A1B1EC0A26;
        Tue,  8 Mar 2022 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646702625; bh=lBwgZIy9PRqjWzxM81PyByQgHaeJSr97phJc0F9HujE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=a9Ii0iZTQvRaWboW9S5YhYjWj8IzT6SiVbjsHWTpDY4Dz2iSFwxa04Mq/Qv3FG8rA
         9MG1I6ma3NxTRzrDllFfjak3lVBJURTE7nwj+zjDb1lgvQxspe4fsrB034GOg4Rmcf
         weYVXqcmTYv6AB85YOdiot3Swgvm1ukkX9HqzT0UHMSSwQJYAFwaiozwCuiPEA27sC
         CCEMunxeNXOIJA8ho86gg2NmVlqKOh6UAD2jhdhgdFXRvcz+Kkj9mb3bFn3xFAoghT
         rAgnVP3pZvYLd0PYiJKXLktgY/swtJKj5cjlOkb/Oby9MryL2/bkoyOHk9cGfPQJnn
         YdVNZsJxJFGHg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6E18BA0083;
        Tue,  8 Mar 2022 01:23:43 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DDB9A400C5;
        Tue,  8 Mar 2022 01:23:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tCuQbQ7B";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC2fxnLgGwUkRCzBfHLgOZREy1+VvgsRDwdMEeHw2JaWifUPO2wkgOL2ewXycf6SbCmiAkSXzmJZk0HIp9GJ3okiwu+OJh+zpI4HUYDiY9I6dQPfA/BGbFFmRKimOTpvag1Owavmr6ba7/N0BOIHoq0tEA5R2LW93w3mkdk75QFNSp1vhGtcnhFPW3fQiC14ti2bMro72yH3W8Knp7XPL78bmHgV8OFA+Qq1z//x9R6niBwv60xtIlRMUod7VASyIePm0/yckwUYLknk2csrcezH0g3s2Ctf4GpYtoJbkS6URZzfVa2K9m0vrUqFehB2O9zTVXOjl0rsMdx+VuWtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBwgZIy9PRqjWzxM81PyByQgHaeJSr97phJc0F9HujE=;
 b=E6tHgBMI5a4EQqpahBAiMn/zuIakiKWsKU6dXjnCGUVcJBBmm2Uc4z4Y+Sq9z6heMiTx7DZr0nq1fkuphqGwDHS1of7vAi4IXfRkc4q3yLco5l7YWoAR7RfpXNCq4e9x2ZVpctfEdwZGLhpM5/kRpIXvfhm09xNT/zsPgpKIn9CjSpc54mz1+W42/XLkQzjkFU4tn2USc0V+67PHS8kzRyUdmmw1fn8t11P18tYU6nqdYimVd8De1P8dqkMumfjm2xJlREOYfLDbtyJkGAx+2I1lKKpBGdbl6yCDw/L13gf9dHLrvvbiW00pY1UeLGMs3dgSTQGoBAcnq0SLxUAqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBwgZIy9PRqjWzxM81PyByQgHaeJSr97phJc0F9HujE=;
 b=tCuQbQ7BepaBZ7sht8sVE/YmWROnDzH3IJO44gWsF84uXHBgfkCip/MzVAnS5Uk1rY+xpfxIkFA74qRRnHsKJPTSp8cI3ucBCtYy37SKrkTXdSQ5PSMZHLEcpvLh46zqxz9nujVA9geFilrKB5eTVauKF0A7ACreEqrAEmhnDgQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 01:23:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5038.026; Tue, 8 Mar 2022
 01:23:38 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: dwc3: gadget: set status of request on every
 completed trb
Thread-Topic: [PATCH] usb: dwc3: gadget: set status of request on every
 completed trb
Thread-Index: AQHYMmzu6jgxboKnRUS4uY5ERl4Qm6y0sWuA
Date:   Tue, 8 Mar 2022 01:23:37 +0000
Message-ID: <1be4dcd5-c9df-6d09-e3da-ee3654ae89ba@synopsys.com>
References: <20220307214639.4164547-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20220307214639.4164547-1-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41ba8a58-504c-4be1-6d95-08da00a245ba
x-ms-traffictypediagnostic: DM6PR12MB4299:EE_
x-microsoft-antispam-prvs: <DM6PR12MB4299C968F2229B262639D025AA099@DM6PR12MB4299.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yu1LVkK+sx54l38w/u10/B8sKgNsArMfki+HdMUCHE0bwek1P01eOaGFz5SUvrzMKtymHR612gKpMipONB13srw9W7fpDq88nXfPISLJ2/15wsb5Ab5Lo1HHFEbZ3NWz52rXusnIvhNx7BAEG21pxYSI27zYGSxfF1UbBLn2TjiII6PkKpy1A+Fd4i7aLeZ4y26g3SmYMJbfJjL25F4gwVKTHtgXzZwY8V7wVRBpc1qy39N8IdEBDz7lmDN4rxaWxCK4/JaUL/ygrJkoarYc/a+AoX1LD50B/Vzs6rt86iatxC0AGY0WHHnG5oEJ4J2HhmpDwpG4k9cdLyp+FgotxQ2iFJSeaGQ+yuzTQs9NwYTyq5/NtuQ0B0A05dT3WEabXiQR1VptaQuptd+OlZfmeE3Ti+pwxBukeEtP6wzefYaONTDvIfmo1QP2uttTFM5ljgGc98/+WU6kYzqy8+dnwcLQVRNQiD2SjaPd3RXwHXY4Tn4vg/xwVQx7rtRPZde9Pu1xzp/SCPQWFYeETyjMh7Yu0DJeHvB8A3XehtTK6kfHj1nISpx/pv34B30mLIcUeywSNi0h+Zz9o8J2w6G3D9ylxubSLRYv2k/BN2rwhx1RJ/Ta5/MCI8aNw3KDD/t1MowxJgdO/gtpCYkVXTAu6i3CjUcq4ujdYHxTnvq3SsTLOXoz6CoK54Dv1kKMBwLZWBMT04imIegXySRcq9zaFOYVYPrvkksbNkx7D4fpz/OyGMUhYgy8++zuVnT9fnymLbeYAiUl0U4p4HomtncX1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2906002)(508600001)(66476007)(6512007)(122000001)(2616005)(26005)(186003)(8936002)(6506007)(83380400001)(71200400001)(316002)(86362001)(38070700005)(31696002)(36756003)(31686004)(54906003)(110136005)(76116006)(6486002)(4326008)(8676002)(66556008)(66446008)(64756008)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0dXSm4vWXFSNVB5RWVDaU1vY1VWYkkyWDNxY3VYV0hML3VqK3NvdDRUVnNm?=
 =?utf-8?B?UGVITWZVSWh0MWw3V1BwV1Rwcy81emVsb0RwZ3BaZW9aRkRSVXlFK3gzb0pO?=
 =?utf-8?B?c1IrOTVhOURMRUs3QWRETW9tUXFJOG54dnV2aG9ybDk2Q3k2VitZNXZrTHlx?=
 =?utf-8?B?SDdlTHpqM3JiQlI0UU84T2ZUVUJRMUVqNTVrYTllbUdOejU2ajhqZ1QxTG53?=
 =?utf-8?B?djNFdkJvY0tWekp1djFtRkZkQXJTUDFhVWszclF6VzVDaUU1TjVCU3pmY2lG?=
 =?utf-8?B?YWMzNFlXdnJmaWIzUzNEYlJjcTU5ZGRhaEhzNytIRVF1b1FOSzhGVC90TXcr?=
 =?utf-8?B?eFNZWGxZY2tMajRrOHQ0VXdTZjNXN0UrL0QxOWZUVEdBN3JxakdMT2dLQ2ZW?=
 =?utf-8?B?aGRIYWFsMHFsTWQ2SVVsS3JkZytRWnVTQ3ZzNDBncEJDVkg1MXhtaEJzU29X?=
 =?utf-8?B?aGU0MFZzKzM0WjdGQVduYUhzMzBESXdNSkxVbWZROGRpMzJHaWgyOVRyZW1Q?=
 =?utf-8?B?UVQ0dXFoWWpmVndmSGFXTlBjV2NRaDVyNFVPTm1LN0U4eWttRks4aUVidjdp?=
 =?utf-8?B?UDE0dkEzQ2x0QUk1QVdKVG9zK0QzTDB2ZkdHdW45N2gxY3hiaFVTTElpLyt4?=
 =?utf-8?B?dEIvRElGSjJEN3VoNEppODZhWnRmbXYwS1pLSHN2bkphWnZFSjJhd0xESlZh?=
 =?utf-8?B?ODczL2hpUGlvWnhHSVY0REhzMDJiT0NBUTBKMktzUCszdHpSdXMwVFNRN2Yy?=
 =?utf-8?B?QmlsNjdLWGJpSGNYZVR1MFZNVlZFemo2RGhMN2p2Z2E5TE9Xbk8xVTcwTmZT?=
 =?utf-8?B?dWVLbDhueDRTTmFsR3BXaE5SQ0EveUw2T0dXZ1p2ZGZvdHZVdW1wOUxmVFlZ?=
 =?utf-8?B?TUVGZ09INVk1N1M5SkxGU1BlZkxkSGpUR0kwSVlJc0FIdHh3cDBzTnFtbmxO?=
 =?utf-8?B?cnlrcXJNdlhqaUc5SzNhb3AvYXNTSVdtTGoxbFNPZXdvbTFKVTMra3crNzN5?=
 =?utf-8?B?MnBrb0g0Y09oTEZiN3pqcVlBZjVIc1RkK2tnYytDcVFOM3llK2srWkJnZzU2?=
 =?utf-8?B?Tkk3S0trUmRmMmhYUmRUSlJGazY1ODRKVzNvUzdFL0F0ZHFGVmRJVXNtcmxR?=
 =?utf-8?B?S2RpbSt0WkZZWXVQZlRmaWNTZWpaUzZOMkFJUjBmNGYxdmhZa2tyd0RBWEM4?=
 =?utf-8?B?M0IwYXFSSzFoNXpMcks5a1QxdmhDK1JvRzUyQU9rN3FRK2hTS1VmQ3grek1h?=
 =?utf-8?B?ZDYrK2lybm42VGhRcUdxVXByN0x5OW84R2pMUW0zeGJhWThtRVFjSXhVVEtY?=
 =?utf-8?B?SE1QMHlhN2NpQlVQY2g2REpXcy9yZ2lmMlBFdVYzQ0Z0Nnp3NmZjMml1eFlS?=
 =?utf-8?B?LzVnRytSLytiQk8zbm5VSFMxL3QyRTNHcEJEVTY5NzljVWloUHh2MUkzNFdp?=
 =?utf-8?B?anVHS1BJazlybFVHRlJFOGp3bUVFYlFEemJsK1NyVFVQTkw4L1hJUG1Jb1pT?=
 =?utf-8?B?c2o1Z0pXcCt0ZTVBVjZ6VUpneG9CNWVkVjJkbWZQUXBBeldSQlNrRzRjRk5H?=
 =?utf-8?B?czFrUTc2UlBvTnhzdWpRZnJVQ0cwMFJHTGRnZk5uZnJWU0tFS3NrTi8raS8w?=
 =?utf-8?B?alh4MDByOGs5UmpacENNSGtvQ3A3TnZnb0hJRFk4TDR4N2tId3RaNnF3UDNh?=
 =?utf-8?B?cFNURmxpanVuMW5tcUJaNnVoaTZaUzJPSkhaMTV0WVhTTHVlcmZpa0t6S1Ev?=
 =?utf-8?B?WTBSQnhTOVpmUUVWeHZYajg5SE1KVkFsUHZZK1hweGRjajR6UUZxTTE2M0xW?=
 =?utf-8?B?eFM3SmNCU1B4RjkyYWxzUDB1WG92Mkg4Zysrd0YrMGEzQmU0UWM4Uldtb1dn?=
 =?utf-8?B?bUFPemZnc0ZMaElhVGlkNk9TclZvVThlTVhxbUd0R2FKQzdSR1NSYUtIcGFU?=
 =?utf-8?B?amRQRnMrZGhwNWZ5SDI2Yi8zVkhZbW1LQlptVUpaUGJESTNMbkZTUmtUbjRI?=
 =?utf-8?B?aE5sWGt5R25MSTFRNjM3KzJpdWpVMGdTVit5S0pQb1BzWE5naGtLUjFjdkE0?=
 =?utf-8?B?WExFWi9TeXNCbEV6bDkzV3ZkV2dHY2IvbHV1U3luMU9NdGcwdUd2SC9qRkJ6?=
 =?utf-8?B?eXM2MWtHVHZYczFGNWFnOFFqQ29JWGlmemQrazB3REtseWlvcmNXQ3VMQ0Vr?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6967E85AA32F042A5B04506D3536C94@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ba8a58-504c-4be1-6d95-08da00a245ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 01:23:37.8394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6/MXH3XAEOWvAZbJW6sCkxgjGh+dTs2AnXz+8iKppocYLnyZc61dzeF0ffuM+K8UPutXA0xOqRHQ04Da3uqoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IEN1cnJlbnRseSB0aGUgc3RhdHVzIG9mIHRoZSBy
ZXF1ZXN0IGJlaW5nIGNvbXBsZXRlZCBjb21lcyBmcm9tIHRoZQ0KPiBkd2MzX2V2ZW50X2RlcGV2
dCBzdGF0dXMuIFRoZSByZXN1bHRpbmcgc3RhdHVzIHdpbGwgdGhlbiBiZSBhcHBsaWVkIHRvDQo+
IHRoZSByZXF1ZXN0IG9uIGR3YzNfZ2FkZ2V0X2RlbF9hbmRfdW5tYXBfcmVxdWVzdC4NCj4gDQo+
IFRoaXMgYXNzaWduZWQgc3RhdHVzIGlzIG5vdCByaWdodCBpbiBldmVyeSBjYXNlLiBTaW5jZSBp
dCBpcyBwb3NzaWJsZQ0KPiB0aGF0IG1vcmUgcmVxdWVzdHMgY2FuIGJlIHJlYWR5IG9uIHRoZSBp
bnRlcnJ1cHQgaGFuZGxlciB3ZSBoYXZlIHRvIHNldA0KPiB0aGUgYWN0dWFsIHN0YXR1cyBmb3Ig
ZXZlcnkgcmVxdWVzdCBmcm9tIHRoZSB0cmJzdGF0dXMgaW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgR3J6ZXNjaGlrIDxtLmdyemVzY2hpa0BwZW5ndXRyb25peC5kZT4NCj4g
LS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgNSArKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IGEwYzg4M2Yx
OWE0MTdjLi43NjBhZjA5ZDZkOGVmNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0zMTcxLDYg
KzMxNzEsMTEgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9lcF9yZWNsYWltX2NvbXBsZXRlZF90
cmIoc3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gIAljb3VudCA9IHRyYi0+c2l6ZSAmIERXQzNfVFJC
X1NJWkVfTUFTSzsNCj4gIAlyZXEtPnJlbWFpbmluZyArPSBjb3VudDsNCj4gIA0KPiArCWlmIChE
V0MzX1RSQl9TSVpFX1RSQlNUUyh0cmItPnNpemUpID09IERXQzNfVFJCU1RTX01JU1NFRF9JU09D
KQ0KPiArCQlyZXEtPnJlcXVlc3Quc3RhdHVzID0gLUVYREVWOw0KPiArCWVsc2UgaWYgKERXQzNf
VFJCX1NJWkVfVFJCU1RTKHRyYi0+c2l6ZSkgPT0gRFdDM19UUkJTVFNfT0spDQo+ICsJCXJlcS0+
cmVxdWVzdC5zdGF0dXMgPSAwOw0KPiArDQo+ICAJaWYgKCh0cmItPmN0cmwgJiBEV0MzX1RSQl9D
VFJMX0hXTykgJiYgc3RhdHVzICE9IC1FU0hVVERPV04pDQo+ICAJCXJldHVybiAxOw0KPiAgDQoN
CnJlcS0+cmVxdWVzdC5zdGF0dXMgc2hvdWxkIG9ubHkgYmUgc2V0IGF0IG9uZSBwbGFjZSwgYW5k
IGN1cnJlbnRseSBpdCdzDQppbiBkd2MzX2dhZGdldF9kZWxfYW5kX3VubWFwX3JlcXVlc3QoKSB3
aGVuIHdlIGdpdmUgYmFjayB0aGUgcmVxdWVzdC4NCg0KWW91IG5lZWQgdG8gZml4IGR3YzNfZ2Fk
Z2V0X2VwX3JlY2xhaW1fY29tcGxldGVkX3RyYigpIHRvIG5vdCB1c2UgdGhlDQoic3RhdHVzIiBm
cm9tIHRoZSBldmVudC4NCg0KQ2hlY2sgYW5kIHNhdmUgdGhlIGZpcnN0IFRSQiBlcnJvciBhbmQg
cmVwb3J0IHRvIHRoZSByZXF1ZXN0J3Mgc3RhdHVzLg0KRG9uJ3Qgb3ZlcndyaXRlIGl0IHdpdGgg
c29tZXRoaW5nIG5ldyBpZiB0aGVyZSBhcmUgY2hhaW5lZCBUUkJzIGluIHRoZQ0KcmVxdWVzdC4N
Cg0KSSBhbHNvIG5vdGljZSB0aGF0IERFUEVWVF9TVEFUVVNfQlVTRVJSIGlzIG5vdCBhcHBsaWNh
YmxlIHRvIFRyYW5zZmVyIGluDQpQcm9ncmVzcyBhbmQgVHJhbnNmZXIgQ29tcGxldGUgZXZlbnRz
ICh0aGF0IGJpdCBpcyByZXNlcnZlZCBmb3IgdGhvc2UNCmV2ZW50cykuIFdoaWxlIHlvdSdyZSB3
b3JraW5nIG9uIHRoaXMsIG1heWJlIGNyZWF0ZSBhIHNlcGFyYXRlIHBhdGNoIHRvDQpyZW1vdmUg
dGhhdCBjaGVjayBhbHNvLg0KDQpUaGFua3MsDQpUaGluaA0K
