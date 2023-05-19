Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86839709822
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 15:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbjESNWz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 09:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjESNWx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 09:22:53 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E0712C
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 06:22:51 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J99Uqc023416;
        Fri, 19 May 2023 06:22:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Y3FljVgOz2Q9r/HwqCNl3tZdG+k33FuZktldkHPBm00=;
 b=JvyrD9FrKMMF/VLMg706iUyrqn+3mry30YQnpKtrf6NcPzd+nmy9DGJMb2bU5xBUVTXD
 67Z58EGreMtNOq5tv52N++xDpPJcwu5X27WRY1GKXy82Lf6b4sBUPEzFg4DZYpCNZAcD
 GkV0TqZcjvvr6aB8P9v3uOwED7D1zNwpvEHQMh66BIS+jAyFTjwXoKNDo5PvoPI1CJoh
 02L0MEJLgyie67vZGms3dHkA25wx3WlWQ6qUJawCpAneFX0EgqQ2MFuX/UX8r+PhY3am
 OIIjskdJAAzRFwSdCpmfJHPDhugptTz7Lze+S8+6+HE35+VJZNEdVyY0ZQbVfIX0xItN UQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qj9jmf1qy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 06:22:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684502565; bh=Y3FljVgOz2Q9r/HwqCNl3tZdG+k33FuZktldkHPBm00=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JcieRJLQlZjCw4NOjber3HIKNyPfTuLKofds2f0OahUeaT5FD8d7otzbNZ8yVAn1U
         gzoPi9vW/pPZQgNza81LbjXOkfWphQyxBkodk0nsbb+WCavGA44wR0vkQv0i4lRtTr
         1rrH6H7M4HT/cUvy+amQg/7FaJvT+1jqFN7HcOp5xACKqA/K7d6CtMpldGyPgcXfWJ
         7wTmGMPB3vrqUrk54NnKPPbEBNHUF73sbRo3sJtfNtzaemGkTWhN6igKeh6vVDyfKu
         aocqmkddUb62BBgDu354owRcxj+EXhCyQsmRPYRbaxFytMYmKlqtfviM7osWlYKe2w
         ZZXU3BamGOwUQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A23B4048F;
        Fri, 19 May 2023 13:22:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2525FA0076;
        Fri, 19 May 2023 13:22:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ljjO3Qd9;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6D113403EC;
        Fri, 19 May 2023 13:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMMzLe+pHBnGkkwvStA3JjpWwltSkhjGlAAtayu0B/Si9FTXdIAOHsx2Kh0HF7B/rSnGxmN4en+Bp43tKgNlFqY6noGRbtQuMfRCsTALsS921dKPkkC5uXIOBGkC2OWwEMkpIajSNtyGEjebi/Yjk5a9t2yHELtGJ7fZ3uD6ThgB9ALTRbDCjmvPOGJeHAMRD++CYt7JRJmaTbHKu+37yj1WIZEeE2+BVcn+jtdNBDRhTnAAmHVCFXc43IWpO4SeCeL1ibfx5RSkmpEUp7NmjeJtdsvaW7KoJ9yf/4X2HhlBvqDMUyUde1B6cW2itbx9Tw1/w2/flsY5DHXlA5Mlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3FljVgOz2Q9r/HwqCNl3tZdG+k33FuZktldkHPBm00=;
 b=XRVmvfy+CHOUGMGfOw+xzSrhvGT3s5KTzcJQo8nwNtWpUF8eAYqnnaEApmRYRB4ADI3ihWePsjYRhSgu3+D5vvliiGuS6d4KpD7okAGbVi1dyrxHNxKIlcZzDZ0y8doSN9wgnGg5LbD9vVTlMngei/FqttKnWHxdkBouB3TMwGqDBOCtnbdPYV4y2PGrUFUy9zmZLQGRNjM6OdFHtG0eSO37PoPa9NtymQLFuD/M1DEU+8TuVwrS/lGFFj8lwHca6M15P1WV90ZlJckSSKtGM+jDVb/zlDdBa9Jl/Xgp/sVqx0lYKM3pOQiQWBz/adIivSAyP5UOg73I+pU4GlX49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3FljVgOz2Q9r/HwqCNl3tZdG+k33FuZktldkHPBm00=;
 b=ljjO3Qd9ha8KApX6/5g48xIUjVHF9pXqrZs/ZKLs/cgtTdOkECCNPrs3qRPZHrk5d1RX/n8C5l0LBJ0HbNTx4zVPWX88merg5IsWiesgbLqPr8fXDwJ7NAMhGND/T+8vMfY9zLWooBtXccK1vaqbo+7r/X+XC7uS032rZAJqvOA=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 13:22:41 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8%4]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:22:41 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     PALAK SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8l67bcCYwgACjvICAdTpx0IAAvFDpgABzRADRMq4GAIAHf6GAgADY0ICAAJzGAIAA2WQAgAER1gCAAHgBgIABO90A
Date:   Fri, 19 May 2023 13:22:41 +0000
Message-ID: <f3f95e78-20e6-41a0-fe21-ae2c78f305e4@synopsys.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
 <PAXPR06MB85319DCC50F69D0790D5F4198D719@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531E23298F9BA26C1E651AC8D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531BF29DA170252843DD5598D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531D31F642598C1D9B8555B8D749@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <BYAPR12MB3399F12C79131BE0BEC2B9B0A7799@BYAPR12MB3399.namprd12.prod.outlook.com>
 <PAXPR06MB8531AB0E54440379049AD5D68D799@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <0f75819a-cf35-d66a-4a66-bc2ffb0d9526@synopsys.com>
 <PAXPR06MB8531E462D0CBF0F2AF996BD68D7E9@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <8159bfe7-8c3d-cf85-a02c-95162a4407f2@synopsys.com>
 <PAXPR06MB8531CF37474902FAD1CBF6AF8D7F9@PAXPR06MB8531.eurprd06.prod.outlook.com>
In-Reply-To: <PAXPR06MB8531CF37474902FAD1CBF6AF8D7F9@PAXPR06MB8531.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|BY5PR12MB4321:EE_
x-ms-office365-filtering-correlation-id: c2ad48ef-63ac-4d69-9c2d-08db586c1fab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pAWzJHJTzDawzqIqNw/UyV30BUIdLJTr39f7IJXqmg/EJB5nDqQcfG2SqXOuHajmaTBg1R/kiIUFdAN/VBGhiwIfXJiaj1PLQr8cM3HokKhbUgvjU5H3C/ZGGj2ei0+Hg+roJzICvBpQ41kNKs1SyPwsc6redqrLzDic30QyPux/7u3R1xDvG4Aff+98zvPOUY7vhOV1E/Yu2tDbgrQS5tv1cof3LyYiQvaZpk655vjatWee514I6FgzG5R1xjDuT8BH7onLzSCI3B7vHGxbnyWWN0Tw+oh1BVxLZQAMQ3/fS7kpLWLMjE1ZKCg7hOLp+HikdJp4sR32DLWkU5kSLEUyOKExB7PlUp13AcUPwP2JC+Jss/5u/yjB1ogfn4WWRzExs6kkzx1xP53yhdYJtM0TFWFjJelbQmxTDDJrL80TyZTyTBkqzgA61KLws5/juW+RVHP+2eX67tLl7EI2UOfZmij7bEFmnqvg7krZKn+ZKvhf7tSVcHAczNLLdXP8WnuoDulWqUx9RH/dkamB+pWGrbc0nNcPQtlY5GQNVXXQfXfJwuo/nxERDWOq8mSt4IiyGUKRe5ATkAeIvRswCkBLzVOE9FYzep44fxRHy405rPiqcU0VnztjWQRCW+8rtvicbctbSgw0PHL6BmTk2EKhdoYr5gbQeMwZPK6D4XnJ4Yn8647nDssb2sQ13gvJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(396003)(39850400004)(346002)(451199021)(38070700005)(31696002)(86362001)(36756003)(110136005)(91956017)(316002)(76116006)(66556008)(64756008)(66946007)(66476007)(66446008)(4326008)(478600001)(71200400001)(6486002)(8936002)(41300700001)(5660300002)(2906002)(8676002)(38100700002)(122000001)(2616005)(186003)(26005)(53546011)(6512007)(6506007)(66574015)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGF0Vmp5MjNOUm1Rd1k0WktDa1l0RDNXU3cyYmdld05pUE15NXEwallBMUNC?=
 =?utf-8?B?SG1Mc252MUZXUlE5dDhMQkRWZzZiUEZuRU1uR2tDN0R1Kzc4VDRwQTc5eHYw?=
 =?utf-8?B?QUtnRjVFSW9aWnI3ZHk1dkl6Vi8zOVJHd1NhNG1JQjgwMlhqM3J0bGdocEpl?=
 =?utf-8?B?YkJIRVBob3F2eXg0TnJVdEtOUzNxMUtQL2Y2cTBxVjM1KzBNdEJ6YjhxazFx?=
 =?utf-8?B?QTd6OFAvS3pGbXJBaU1hMldScTFlUjZyRHIreWhrUG9aM1M1MWhFY1J2TmVu?=
 =?utf-8?B?dmwraGFVV2ZIZE1INmFmeDBOTlVNOXl2OHI1TkplckZEalpCTGovTXYxWDc0?=
 =?utf-8?B?b3lJdjNrU2MwakR1VnFKNHR6Z2Zwa2k2UWJ0ajg2Y1RMV1lPUXJKY2dDVlJP?=
 =?utf-8?B?ZkJZZUhEemNySEJjMGpaUXdRM2haK2RBakI4dmJUVjA2ZE9GVWl0V3RobXBY?=
 =?utf-8?B?NmQ3MVNSdDRJTHQ5MlZiaHk5U1dlNTBiYU9tcG5aa0cvWlBNMzNlVmx5VGV1?=
 =?utf-8?B?MnNsaVo4NmltVVR6TURpOWNuQlNpeUZmUHN4RlJZSWNwSUwvOWhLbjlkWURa?=
 =?utf-8?B?M2krRk9RVk9Bd3cycnZkR3ZQc05uSTlNK0ZKY2xjV1FCY2JNQ1F3QVVTN284?=
 =?utf-8?B?OUU3ZEpZRjYrQ3FncGJZbUVsbW9ybFNaZ3RoMEZnRC8vbjRmREVPZ0wxR0lm?=
 =?utf-8?B?SkF4Uk5VbWIveDM0bGk1M0RONjBvRlE5YU9GQWp6a2tTTlY3SXEzUmRyenF0?=
 =?utf-8?B?WWFLS3pTOUhWYi95UCtxaTRiVE1McytKTzc1Zk1UeHRody9SeVVoR0JITCtS?=
 =?utf-8?B?T1l3WDZ5S2FoN1lQZDdmMFNxL2hOWnlWWmNiNzhuRjd3NHFKaVZkRkJJVFdO?=
 =?utf-8?B?TXNtT25EUHU0YWpYSFpTM2VPVjM2NVYrTC9CRUMzUHVXZno1Vld0T3NSTEc1?=
 =?utf-8?B?VXkzU1ljQUtGSW45dXErenZaV01PWGFjYjY1c0NESm9UL0orOFh3Rm1LQ2N2?=
 =?utf-8?B?MzlQc05hL3JiMzErdDBmM0FaRWZidmcwci9NU3B5dDhkT2xHVm9HNUgyVDNE?=
 =?utf-8?B?R0RNcXZXbGtGTk5nZ1dlZGtOQit0MEg1TVhKc3ZueEhQb09TME5zZUtjOFN4?=
 =?utf-8?B?TUYyelZsQU1ncWJVdHczZzBqRW04M2JlWWJzR3lubEVmQ21NbVphNmVoVFBk?=
 =?utf-8?B?WUxZL1ovWkZLUmJXSmxpZW9BRWVwZG1mMXVlOS81ZmZselNUUUxFbEkxMWp5?=
 =?utf-8?B?R21KNExjUllUN1ptWTVWczg5bW1BcDRXVHNOUWozNVFUYnAwN2hkcFhnblhQ?=
 =?utf-8?B?ZGcxQ0tkSjlRd1lhRk9pZlFRQTJTLzVMVTZqRG9iek5jbkJBaU1IcHEzdi96?=
 =?utf-8?B?WDQ1TFYzSEdPMUxpTGhsV2pocmtUTG0zazBnbDJpVklaYTN3YkhQZ010VnlX?=
 =?utf-8?B?dDZzdFZZT25aZVpSdW10SVA1MGROTG11czd2U08yN0tkTUdJRnVIV0V0OU1r?=
 =?utf-8?B?OU9NTmo1SmJ3Tlk2cXhidStKT1NyRU1BeTlsbm8wMnFjOWdzVWRSMk45bFZx?=
 =?utf-8?B?c0JuV1ZtY1lFdGVkdy9rVFZpU0tySjBaK015ZE00YmFzZ1RzbG5kUi96anRj?=
 =?utf-8?B?QllEeW5hR2RQZnZSZlJMYmoyOUtKd09Mb2dCK3pHeVE5WTEzdTJ3b0lTOCtK?=
 =?utf-8?B?dmZJK2pib3RGdWxBanZ5bms0b2VXQ3N0eDBsaUpjK3F1T0dqV21lQzl3OERP?=
 =?utf-8?B?V3ZVVjdwSmh1ZXVDLzYrV0dRV1RaZ0x0dnNuMnVDdFRlcTZGMG1XSFB2TkQ0?=
 =?utf-8?B?S29FZDdvVGZTa3NRcUN2Y0F5Y3JJTVNuUGhSZW9UeWsxdzlZbjAzaDBOcnNj?=
 =?utf-8?B?Rkp5UFBSblZjL1UwR0h2UlFVd3RJWVlpR3BiOTBpa0FRT3VnVlNzVDNKbnBO?=
 =?utf-8?B?Z3k4RHU1OTdsNkhrTTBKSEUyTkVZUEV2TXpnRDhNdmJuLzZ4c1UydU1OeGJ5?=
 =?utf-8?B?WkorYjAvWWZaM200UEFSeGpqNy81azhpUlhvOXFTMXM4d0FCOXNudm0zVit4?=
 =?utf-8?B?TDBpV0N3UzBJNjJ5UFJLZS8wR0lpQlFUalhIbzllNEcwbGtEbHVJN1JSRFgw?=
 =?utf-8?Q?7ZhqrJUxz3KT8jiKM+XeWkNPx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E27E2CCFD702F4A9F246BFBA7A71CB4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eWOsASHu/Fa7a88QE5JgObx1H5ZQ5X04T/sOkFjRJM4VydZBqGFvc79DQ78YvUZNEV07hA11MeSULMTQll67SXua+FuCrzHQ3bhqjxfGXZRR/SYaqJPofsnlTBoVDn8hEwd4G54f/el+k3SOq6qVjjbxO7JhmagOVeXAYZOUBhlRR9V3lBeVXrUxPsWkpvpBnnigJpF0sfXGCQjdBMviRd5xS+XgOhZThLIqD2sX0elJ4SGY81iNtSRrRWGc0olu5z7idRBZvFbEGYZiuf7Bw/IhrosRdgDxQjYB5VwYETqDi1OwrlnBKTMUaF29/KbQ6lK319/b5aPYJJLhsNfYtoo8oBmH3OrcJMfE1J8TTcd+zMvlMiZY7l44+m40+OdBcWPZjAQ+3sRTWdBiELUU8MWxQxmeLm9udjlgez9CNKLjY4oOYeKwcMjwsaOPohrRtMr0Gd6nadE1KCqB8mwM8cq6gsQi0gyDbg3/Mw+jutej7Pz/oPYGsTJOKWhjdROnMBir9bckFRfDhjPbSNgv+qFhGMOSOKRmiPR3KneXb0o7gLnzLL6ACpWcxQ0BVbubLAuMo58QHIk25sDP4dgnx9gGMLDy0GpNGXWWDMrpgSALxapZxqCYjx+UykKagMdDvkgbG1UBetNcCXoU3oloxQ648ZjP9Nk+8gHTXoSJ4JLVDC59PRLZm35MaRwvC/+c9kMz0mvN4Iv/KjUJ4iSHcWXjFdGBQFigwwG7aGdjN4F2GVZWCfumuWFjoZbX2Ns6F/czgymz8P88nCmB7lfu+1DWncaRWKb6jB1dKtvIpp/RxfXNqJynKWpJWiSmTC2i8MgTpYu3+AxKowAni0ntXw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ad48ef-63ac-4d69-9c2d-08db586c1fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 13:22:41.3988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzcn/2tvd9x5ISQnb8K6y97ks4qO5xxjhp9fz58miP3qBh0XmVGuoSZAV3ebd1axsw67Cq/WGs44Dx56lDraoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
X-Proofpoint-GUID: qoPaukvAUB5YUR2mafrheKn781jBmlML
X-Proofpoint-ORIG-GUID: qoPaukvAUB5YUR2mafrheKn781jBmlML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_09,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305190112
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGFsYWssDQoNCk9uIDUvMTgvMjMgMjI6MzIsIFBBTEFLIFNIQUggd3JvdGU6DQo+IEhpIE1p
bmFzLA0KPiBQbGVhc2Ugc2VlIGJlbG93IGhvdyBJIHRlc3QgLSBvdXIgZGV2aWNlIG5hbWUgaXMg
S1g0LTEwMQ0KPiANCj4gT24gSE9TVCBtYWNoaW5lLA0KPiBbcGFsYWtzaGFoQGxvY2FsaG9zdCB+
XSQgYXBsYXkgLUwNCj4gc3lzZGVmYXVsdDpDQVJEPUtYNDEwMQ0KPiAgICAgIEtYNC0xMDEsIFVT
QiBBdWRpbw0KPiAgICAgIERlZmF1bHQgQXVkaW8gRGV2aWNlDQo+IGllYzk1ODpDQVJEPUtYNDEw
MSxERVY9MA0KPiAgICAgIEtYNC0xMDEsIFVTQiBBdWRpbw0KPiAgICAgIElFQzk1OCAoUy9QRElG
KSBEaWdpdGFsIEF1ZGlvIE91dHB1dA0KPiANCj4gW3BhbGFrc2hhaEBsb2NhbGhvc3QgRG93bmxv
YWRzXSQgYXBsYXkgLWYgUzE2X0xFIC0tcmF0ZT00ODAwMCAtLWRldmljZSBpZWM5NTg6Q0FSRD1L
WDQxMDEsREVWPTAgcmV0cm8tY2l0eS0xNDA5OS53YXYNCj4gUGxheWluZyByYXcgZGF0YSAncmV0
cm8tY2l0eS0xNDA5OS53YXYnIDogU2lnbmVkIDE2IGJpdCBMaXR0bGUgRW5kaWFuLCBSYXRlIDQ4
MDAwIEh6LCBNb25vDQo+IA0KPiBMSU5VWCBERVZJQ0UgQVMgVVNCIEdBREdFVCAtDQo+ICMgYXJl
Y29yZCAtLXJhdGUgNDgwMDAgLWYgUzE2X0xFIC1EIHBsdWdodzpDQVJEPVVBQzFHYWRnZXQsREVW
PTAgdGVzdC53YXYNCj4gDQo+IHBjbV9ody5jIC0gZmlsZSBuYW1lIC0gL2Rldi9zbmQvcGNtQzBE
MGMNCj4gDQo+IFJlY29yZGluZyBXQVZFICd0ZXN0LndhdicgOiBVbnNpZ25lZCA4IGJpdCwgUmF0
ZSA4MDAwIEh6LCBNb25vDQo+IF5DQWJvcnRlZCBieSBzaWduYWwgSW50ZXJydXB0Li4uDQo+IA0K
PiBhcmVjb3JkOiBwY21fcmVhZDoyMjIwOiByZWFkIGVycm9yOiBJbnRlcnJ1cHRlZCBzeXN0ZW0g
Y2FsbA0KPiAjIGxzIC1sYQ0KPiBkcnd4ci14ci14ICAgIDEgMTAwMSAgICAgMTAwMSAgICAgICAg
ICAgIDgyIE1heSAxOCAxMzoyNiAuDQo+IGRyd3hyLXhyLXggICAgMSAxMDAxICAgICAxMDAxICAg
ICAgICAgICAzMjIgTWF5ICA0IDEwOjM2IC4uDQo+IC1ydy1ydy1ydy0gICAgMSByb290ICAgICBy
b290ICAgICAgICAgICAgIDAgRmViIDI3IDE0OjU5IGV2ZW50cw0KPiAtcnctcnctcnctICAgIDEg
cm9vdCAgICAgcm9vdCAgICAgICAgICAgICAwIEZlYiAyNyAxNDo1OSBmYXN0X29wcy0NCj4gLXJ3
LXJ3LXJ3LSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAgICAgMCBGZWIgMjcgMTQ6NTkgZmQN
Cj4gLXJ3LXJ3LXJ3LSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAgICAgMCBGZWIgMjcgMTQ6
NTkgcG9sbF9kZXNjcmlwdG9ycw0KPiAtcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAg
ICAgICAgIDQ0IE1heSAxOCAxMzoyNiB0ZXN0LndhdiAvLyBvbmx5IDQ0IGJ5dGVzDQo+IA0KPiAj
IHZpIHRlc3Qud2F2DQo+IFJJRkYkXkBeQC5XQVZFZm10IF5QXkBeQF5AXkFeQF5BXkBAXl9eQF5A
QF5fXkBeQF5BXkBeSF5AZGF0YV5AXkBeQC4NCj4gDQo+IEFzIHlvdSBjYW4gc2VlLCBJIGFtIHBs
YXlpbmcgcmV0cm8tY2l0eSoud2F2IGZpbGUgb24gdGhlIEhPU1QuIEFuZCB0cnlpbmcgdG8gY2Fw
dHVyZSBpdCBvbiB0aGUgREVWSUNFLg0KPiANCj4gQnV0IHRoZSB0ZXN0LndhdiBmaWxlIG9ubHkg
aXMgNDQgYnl0ZXMuIElmIHRoZSBlbmQgcG9pbnQgaXMgcmVjZWl2aW5nIGRhdGEgYW5kIHRoZSBh
cGxheSBpcyBwbGF5aW5nIHdhdiBmaWxlLCB0aGVuIHdoeSBpcyB0aGUgYXJlY29yZCBub3QgZ2V0
dGluZyBkYXRhPw0KPiANCj4gVGhhbmtzLA0KPiBQYWxhaw0KPiANCg0KU29ycnksIGJ1dCB0aGlz
IGlzIG91dCBvZiBzY29wZSBvZiBteSBtYWludGVuYW5jZS9zdXBwb3J0IG9mIGNvcmUrZHdjMi4N
CkJ5IGZpeGluZyByZXF1ZXN0IGNvdW50IGluIGZ1bmN0aW9uIGRyaXZlciB3ZSBkaWRuJ3Qgc2Vl
IGFueSBtb3JlIGlzc3VlIA0KaW4gY29yZStkd2MyLCB3aGljaCBjb25maXJtZWQgYnkgbGF0ZXN0
IGxvZ3MgYW5kIHVzaW5nIHRlc3R1c2IuIE9uIG15IA0Kc2V0dXAgYXBsYXkvYXJlY29yZCB3b3Jr
cyBmaW5lLiBJIGNhbid0IGRvIGFueXRoaW5nIG1vcmUgZm9yIHRoaXMgY2FzZS4NCkZZSSwgbmV4
dCB3ZWVrIEknbSBvbiB2YWNhdGlvbi4NCg0KVGhhbmtzLA0KTWluYXMNCg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1
dHl1bnlhbkBzeW5vcHN5cy5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTgsIDIwMjMgNzoy
MyBBTQ0KPiBUbzogUEFMQUsgU0hBSCA8cGFsYWsuc2hhaEByYXJpdGFuLmNvbT47IE1heW5hcmQg
Q0FCSUVOVEUgPG1heW5hcmQuY2FiaWVudGVAcmFyaXRhbi5jb20+DQo+IENjOiBsaW51eC11c2JA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiB1c2I6IGdhZGdldDogZHdjMjogbm90IGdl
dHRpbmcgYXVkaW8gZGF0YQ0KPiANCj4gSGkgUGFsYWssDQo+IA0KPiBPbiA1LzE3LzIzIDIzOjAy
LCBQQUxBSyBTSEFIIHdyb3RlOg0KPj4gSGkgTWluYXMsDQo+Pg0KPj4gTWluYXMgd3JvdGU6DQo+
Pg0KPj4+IFNvLCB0byBzZXQgcmVxIG51bSB0byAzMiByZXNvbHZlIHRpbWUgZ2FwIGlzc3VlIGFu
ZCBJU09DIE9VVCB0cmFuc2ZlcnMNCj4+PiAoYXBsYXkpIGdvaW5nIE9LLiBQbGVhc2Uga2VlcCB0
aGlzIDMyIHNldHRpbmcgYWx3YXlzLg0KPj4NCj4+IEkgd2lsbCBrZWVwIFVBQzFfREVGX1JFUV9O
VU0gYXQgMzIuDQo+Pg0KPj4gUGxlYXNlIG5vdGUgdGhhdCBJIGFtIE5PVCBET0lORyBBUExBWSBo
ZXJlLiBXZSBhcmUgY3VycmVudGx5IG9ubHkgdGVzdGluZyBTUEVBS0VSUywgbm90IG1pY3JvcGhv
bmUuIFRoZSA1LjEwLjEwMCBrZXJuZWwgaGFzIHNvbWUgcGFyYW1ldGVyIGNoZWNrcyAoZl9hdWRp
b192YWxpZGF0ZV9vcHRzICksIHNvIEkgaGFkIHRvIGVuYWJsZSBtaWNyb3Bob25lIChFUDQoSU4p
KS4gQnV0IEkgYW0gbm90IHRlc3RpbmcgbWljcm9waG9uZS4NCj4+DQo+PiBJIGFtIHRyeWluZyB0
byBDQVBUVVJFIEFVRElPIG9uIG15IExpbnV4IGRldmljZSAoYWN0aW5nIGFzIGFuIGF1ZGlvIGdh
ZGdldCkuIEkgYW0gcGxheWluZyBzb21lIGF1ZGlvIHVzaW5nIHlvdSB0dWJlIG9uIHRoZSBob3N0
IG1hY2hpbmUuIEFuZCBpdCBzZW5kaW5nIHRoZSBkYXRhIHRvIG15IGRldmljZSwgd2hpY2ggaXMg
dGFyZ2V0LiBUaGUgZW5kcG9pbnQgZnJvbSB3aGljaCBJIHdhbnQgdG8gY2FwdHVyZSBkYXRhIGlz
IEVQMShPVVQpLg0KPj4NCj4+DQo+PiBNaW5hcyB3cm90ZToNCj4+DQo+Pj4gQXJlY29yZC4gSW4g
bGF0ZXN0IGxvZyBJIHNlZSB0aGF0IGZ1bmN0aW9uIGRyaXZlciwgYmVzaWRlcyBFUDFPVVQgKHdo
aWNoIGZvciBhcGxheSBhbmQgaXQgbm9ybWFsbHkgd29ya3MpLA0KPj4NCj4+PiBxdWV1ZWQgMzIg
cmVxdWVzdHMgdG8gRVA0SU4sIHdoaWNoIEkgYXNzdW1lIGVuZHBvaW50IGZvciBJU09DIElOIGZv
ciBhcmVjb3JkLiBCdXQgdHJhbnNmZXIgb24gRVA0SU4gbmV2ZXIgPiBzdGFydC4gUGxlYXNlIHBy
b3ZpZGUgbWUgbG9nIGFuZCB1c2IgdHJhY2Ugd2hlbiB5b3UgZG9pbmcgYXBsYXkgd2l0aCBhcmVj
b3JkLg0KPj4NCj4+DQo+PiBBZ2FpbiwgSSBhbSBub3QgcnVubmluZyBhcGxheSB5ZXQuIEkgYW0g
dGVzdGluZyBvbmx5IGFyZWNvcmQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGF1ZGlvIGRhdGEgZnJv
bSB0aGUgVVNCIHRhcmdldCAoaG9zdCBtYWNoaW5lKSBjYW4gYmUgcmV0cmlldmVkLg0KPj4NCj4+
IEJlZm9yZSBjaGFuZ2luZyB0aGUgbnVtYmVyIG9mIHJlcXVlc3QgdG8gMzIsIHRoZSBkd2MyIGlz
b2Nocm9ub3VzIHRyYW5zZmVycyB3aWxsIHN0b3AuIFdpdGggdGhlIGNvdW50IDMyLCB0aGUgZW5k
cG9pbnQgaXNu4oCZdCBzaHV0dGluZyBkb3duLCBCVVQgSSB3YW50IHRvIGNhcHR1cmUgdGhlIGRh
dGEgdXNpbmcgQVJFQ09SRCBpbiBhIGZpbGUgYW5kIHRoYXQgaXMgbm90IGhhcHBlbmluZy4gVGhl
IGZpbGUgaXMgb25seSA0NCBieXRlcy4NCj4+DQo+PiBCZWxvdyBpcyB0aGUgZXhhbXBsZSBvZiB3
aGF0IEkgYW0gZG9pbmcgLQ0KPj4NCj4+IEhPU1QgTUFDSElORSAtDQo+Pg0KPj4gUExBWSBBVURJ
TyBVU0lORyBZT1VUVUJFLCBERVZJQ0UgU09VTkQgU0VUVElOR1MgU0VMRUNUIExJTlVYIEFVRElP
IEdBREdFVA0KPj4NCj4+DQo+Pg0KPj4gTElOVVggREVWSUNFIChVU0IgQVVEIEdBREdFVCkNCj4+
DQo+PiBBUkVDT1JEIC1mIFMzMl9MRSAtYyAyIHRlc3Qud2F2IC8vIHRyeSB0byBjYXB0dXJlIHRo
ZSBkYXRhIGNvbWluZyBvbiBFUDEoT1VUKQ0KPj4NCj4+IEV2ZW4gdGhvdWdoIEkgYW0gc2VlaW5n
IGRhdGEgb24gRVAxKE9VVCksIHRoZSB0ZXN0LndhdiBpcyBvbmx5IDQ0IGJ5dGVzLg0KPj4NCj4+
IEkgaGF2ZSBhdHRhY2hlZCBVU0IgdHJhY2UgZmlsZS4gVGhlIGxvZ3MgYXJlIHRoZSBzYW1lIGFz
IEkgc2VudCB5ZXN0ZXJkYXkuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gUGFsYWsNCj4+DQo+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogTWluYXMgSGFydXR5dW55YW4gPE1pbmFz
LkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4NCj4+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDE3LCAy
MDIzIDI6MDUgQU0NCj4+IFRvOiBQQUxBSyBTSEFIIDxwYWxhay5zaGFoQHJhcml0YW4uY29tPjsg
TWF5bmFyZCBDQUJJRU5URSA8bWF5bmFyZC5jYWJpZW50ZUByYXJpdGFuLmNvbT4NCj4+IENjOiBs
aW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+PiBTdWJqZWN0OiBSZTogdXNiOiBnYWRnZXQ6IGR3
YzI6IG5vdCBnZXR0aW5nIGF1ZGlvIGRhdGENCj4+DQo+PiBIaSBQYWxhaywNCj4+DQo+PiBPbiA1
LzE3LzIzIDAwOjQzLCBQQUxBSyBTSEFIIHdyb3RlOg0KPj4+IEhpIE1pbmFzLA0KPj4+IDEuIERl
cGVuZCBvbiB3aGljaCB1YWModWFjMSBvciB1YWMyKSB5b3UgdXNlLCBpbmNyZWFzZSAyIHRvIDMy
DQo+Pj4NCj4+PiBJIGNoYW5nZSB0aGUgI2RlZmluZSBVQUMxX0RFRl9SRVFfTlVNICAgICAgIDMy
Lg0KPj4+DQo+Pj4gV2hlbiBJIGRvIHRoaXMsIHdoYXQgSSBzZWUgaXMsIHRoYXQgd2hlbiBJIHBs
YXkgYXVkaW8gb24gdGhlIHRhcmdldCwgSSBkb27igJl0IHNlZSB0aGUgRU5EUE9JTlQgc2h1dGRv
d24uIEhPV0VWRVIsIHdoZW4gSSB0cnkgdG8gcmVjb3JkIHRoZSBkYXRhLCBJIERPIE5PVCBSRUNP
UkQgYW55IGRhdGEuDQo+Pj4gVGhlIGFyZWNvcmQgZmlsZSBpcyBlbXB0eSB3aXRoIG9ubHkgNDQg
Ynl0ZXMuIEkgc2F3IHRoZSBzYW1lIGJlaGF2aW9yIDIgbW9udGhzIGFnbyB3aXRoIHRoZSBvbGRl
ciB2ZXJzaW9uIG9mIGtlcm5lbC4NCj4+Pg0KPj4NCj4+IFNvLCB0byBzZXQgcmVxIG51bSB0byAz
MiByZXNvbHZlIHRpbWUgZ2FwIGlzc3VlIGFuZCBJU09DIE9VVCB0cmFuc2ZlcnMNCj4+IChhcGxh
eSkgZ29pbmcgT0suIFBsZWFzZSBrZWVwIHRoaXMgMzIgc2V0dGluZyBhbHdheXMuDQo+Pg0KPj4g
QXJlY29yZC4gSW4gbGF0ZXN0IGxvZyBJIHNlZSB0aGF0IGZ1bmN0aW9uIGRyaXZlciwgYmVzaWRl
cyBFUDFPVVQgKHdoaWNoIGZvciBhcGxheSBhbmQgaXQgbm9ybWFsbHkgd29ya3MpLCBxdWV1ZWQg
MzIgcmVxdWVzdHMgdG8gRVA0SU4sIHdoaWNoIEkgYXNzdW1lIGVuZHBvaW50IGZvciBJU09DIElO
IGZvciBhcmVjb3JkLiBCdXQgdHJhbnNmZXIgb24gRVA0SU4gbmV2ZXIgc3RhcnQuIFBsZWFzZSBw
cm92aWRlIG1lIGxvZyBhbmQgdXNiIHRhcmNlIHdoZW4geW91IGRvaW5nIGFwbGF5IHdpdGggYXJl
Y29yZC4NCj4+DQo+Pj4gVGhlIGxvZ3Mgc2hvdyB0aGF0IHRoZSBkYXRhIGNvbWVzIG9uIEVQMShP
VVQpIGFuZCB0aGUgYnVmZmVyIHF1ZXVlcyB1cHRvICMyNTUgYW5kIHRoZW4gd3JhcHMgYXJvdW5k
IHRvIDAuIFVTQiBzbmlmZmVyIGFsc28gc2hvd3MgZGF0YSBjb21pbmcgaW4uDQo+PiBXcmFwcGlu
ZyBmcm9tICMyNTUgdG8gIzAgaXMgT2ssIGRyaXZlciBhbGxvY2F0ZSAyNTYgZGVzY3JpcHRvcnMN
Cj4+DQo+Pg0KPj4gVGhhbmtzLA0KPj4gTWluYXMNCj4+DQo+Pj4NCj4gDQo+IE9uIGRldmljZSBt
YWNoaW5lIHJ1biByZWNvcmRpbmcgYnkgZm9sbG93IGNvbW1hbmQ6DQo+IGFyZWNvcmQgLUQgcGx1
Z2h3OkNBUkQ9VUFDMkdhZGdldCxERVY9MCB0ZXN0Lndhdg0KPiANCj4gT24gaG9zdCBtYWNoaW5l
IHBsYXlpbmcgYXVkaW8gYnkgZm9sbG93IGNvbW1hbmQ6DQo+IGFwbGF5IC1EIHBsdWdodzpDQVJE
PWF1ZGlvZ2FkZ2V0LERFVj0wDQo+IC91c3Ivc2hhcmUvc291bmRzL2Fsc2EvRnJvbnRfQ2VudGVy
Lndhdg0KPiANCj4gT24gcGxheSBmaW5pc2ggdGVybWluYXRlZCBhcmVjb3JkIGJ5IENUUkwtQw0K
PiANCj4gUmVjb3JkZWQgdGVzdC53YXYgZmlsZSBjb250YWluIGF1ZGlvIGRhdGEuDQo+IA0KPiBU
aGFua3MsDQo+IE1pbmFzDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiANCj4gQ2UgbWVzc2FnZSwgYWluc2kgcXVlIHRvdXMgbGVzIGZpY2hpZXJzIGpvaW50cyDDoCBj
ZSBtZXNzYWdlLCBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgc2Vuc2libGVzIGV0
LyBvdSBjb25maWRlbnRpZWxsZXMgbmUgZGV2YW50IHBhcyDDqnRyZSBkaXZ1bGd1w6llcy4gU2kg
dm91cyBuJ8OqdGVzIHBhcyBsZSBkZXN0aW5hdGFpcmUgZGUgY2UgbWVzc2FnZSAob3UgcXVlIHZv
dXMgcmVjZXZleiBjZSBtZXNzYWdlIHBhciBlcnJldXIpLCBub3VzIHZvdXMgcmVtZXJjaW9ucyBk
ZSBsZSBub3RpZmllciBpbW3DqWRpYXRlbWVudCDDoCBzb24gZXhww6lkaXRldXIsIGV0IGRlIGTD
qXRydWlyZSBjZSBtZXNzYWdlLiBUb3V0ZSBjb3BpZSwgZGl2dWxnYXRpb24sIG1vZGlmaWNhdGlv
biwgdXRpbGlzYXRpb24gb3UgZGlmZnVzaW9uLCBub24gYXV0b3Jpc8OpZSwgZGlyZWN0ZSBvdSBp
bmRpcmVjdGUsIGRlIHRvdXQgb3UgcGFydGllIGRlIGNlIG1lc3NhZ2UsIGVzdCBzdHJpY3RlbWVu
dCBpbnRlcmRpdGUuDQo+IA0KPiANCj4gVGhpcyBlLW1haWwsIGFuZCBhbnkgZG9jdW1lbnQgYXR0
YWNoZWQgaGVyZWJ5LCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kL29yIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24uIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgKG9yIGhh
dmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IpIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciBpbW1lZGlhdGVseSBhbmQgZGVzdHJveSB0aGlzIGUtbWFpbC4gQW55IHVuYXV0aG9yaXplZCwg
ZGlyZWN0IG9yIGluZGlyZWN0LCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRpb24gb3Ig
b3RoZXIgdXNlIG9mIHRoZSBtYXRlcmlhbCBvciBwYXJ0cyB0aGVyZW9mIGlzIHN0cmljdGx5IGZv
cmJpZGRlbi4=
