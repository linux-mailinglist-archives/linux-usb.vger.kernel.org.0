Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22C16481CA
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 12:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiLILdF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Dec 2022 06:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiLILdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Dec 2022 06:33:03 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3711F9CA
        for <linux-usb@vger.kernel.org>; Fri,  9 Dec 2022 03:33:00 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B987vr8028896;
        Fri, 9 Dec 2022 03:32:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=HsvGzEKnnrLflkEpmNLsn24yfvVsB+pn5EMoTa9EI00=;
 b=VOdfvagjzCKXaz3xzEE7paRXwresxqQrgzvKJCeuHKPVEBDhHni6yQnRm+FZtcoKRq4n
 aAkz3zrUwBn89bCbYYewkJ0Wn4PSRIT8PWR5zRW3luEpRlFt2UO19YzeWUeMqreMiE0D
 r7qNUz90gQ8obZQspkxOWBs7byiCmuUutMxJvvzPcMb0VoDSj5qLnoRLEscqKpFrNFsj
 afsfKIe+b+WkmtAVMQuaDZ9aJWE4Fn58/i7sscEs6jIWhsq3xlZ9dMdkw5Ob1UvoikdH
 hxgVzJY20h4TXhLBBSssNqrtU3lOJSxaioTtvbmgrpqfxKwASdOoW/xW0v306HIxfhaW 2Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3m8690efu3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 03:32:56 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7DB4BC00B5;
        Fri,  9 Dec 2022 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1670585575; bh=HsvGzEKnnrLflkEpmNLsn24yfvVsB+pn5EMoTa9EI00=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dyv8f4pbgXqh31PuTCazR3iZWeplrRAkh4yQ80D5r9NaWW517HJhETA34UfpyXpkr
         X5fk1IFLpfaPY7mL4guDaGzXMsRgIo3/HE7tsrl+4VXxS6A4oqlFeVGDOEr3yM4mZs
         LXHoSRZyK24rSKLzrzwtyk+rr8A7o6xctMJEffWTZ4CtQogd2deuqys0KdwrLmGECO
         3OMpjq4LM4ffMJ0rY+vhupATO1npBbJWDcgxZAIsUPq6q/uhpI86uzXW/29G3Ju/s9
         UF7aejxMiI652uEjwU7/79trH0WIzAO9aEBubxNAiQVEzz3U/KHfmJy9yNly58vcjN
         4vAAnFGWMTwyQ==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id BC8BCA0062;
        Fri,  9 Dec 2022 11:32:54 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 23FF6A0085;
        Fri,  9 Dec 2022 11:32:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AO+Zt3kB";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYnwVED0vKrKOD/qVUTMu3SV11wM0aqfI6wPjFJqT+MsXNIsw1pNVQdfuvEb2/S8VQUXpHYzCp83jhPEpxNttkmAhUv3pHuECPebCkE9YwNrEWtv2FljGxPTDEwwF3UzGQDLrO2h88PzfaUBoY1RlPTZmL7Mk8mDmXuBdyqDwYH/UiqNfOomkYnte0BEagNxHKNmMDbUTFV6IFq34FKY3jzdj+fvWk1MsblQdWCWX/MHjblClPhuGNLN65NbFNIfATDQzFAiGRMR2eI/gLsjPc5+IRbx/z1E2jTb1QKwOY/dGrhhF7HliouWbpwEqZxNTpPiRURMUZnzq11Zkv0lhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsvGzEKnnrLflkEpmNLsn24yfvVsB+pn5EMoTa9EI00=;
 b=BqVnCm4vdIumHFp29Hxuiq0ahG/l0ZwlY7GzrrQz+cxyYp7hFUN0fJLM+laws+QCKZMm721lyzMcMYr06Hey5y7mJeYgzv/vUBLELd8NIgM/qQOmVm/jaRGAms9MdrDMXtFXQcArxhk4LwSuB84Sqw4GoW1ipqDlS9IkPzOnOvRyYk8Q1e22FwYS1x4tn2omcZMFXa7CSiMIZY5iTZzUOUJe9F0VHWU8OU72KdReXnqiBfuPRLerAVcPpw3Gn0Fl95wPftCoh5LtM7jsgyUtuHclyXVm827A17wb7dXeLHYHPUsoY0kZ2Aqp1SDC5EYConmjUjlBTuJeMOum63hwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsvGzEKnnrLflkEpmNLsn24yfvVsB+pn5EMoTa9EI00=;
 b=AO+Zt3kBkAY0jen/9EEgbfWBVFGjBNXanCmj3vGZcqHrahuIKBggqxpiCapmR6L9fOZ4vPmnfze91SBB/Ox3139wONU6b73xOhQZABZNaaJgT9195DUzK/qBlKLki2Cc2rRdyrkNsgGq0WmR6DrGmQN0yfyZMCIJ9ugynvDae+8=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 9 Dec
 2022 11:32:51 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::72cb:134:53d3:289e]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::72cb:134:53d3:289e%7]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 11:32:51 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Palak SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AQHZCyJ3ESXaGODhckOYxoo9OCtir65lbaoA
Date:   Fri, 9 Dec 2022 11:32:51 +0000
Message-ID: <00381dbb-3f0d-a384-35a8-d81175ee162a@synopsys.com>
References: <HE1PR0601MB2586962582F222B5B889416A8D1B9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <AS8PR06MB7976A91E44D7DCDAACC723F7971B9@AS8PR06MB7976.eurprd06.prod.outlook.com>
 <HE1PR0601MB258625B74749B2DB1242E0048D1B9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <HE1PR0601MB2586E4A641ECA0D0D043A3798D1D9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <HE1PR0601MB258685C64D46C08C978C37EB8D1D9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR0601MB258685C64D46C08C978C37EB8D1D9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|DS0PR12MB6653:EE_
x-ms-office365-filtering-correlation-id: 14f2ea93-68fd-43d5-eadc-08dad9d91b28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k56RFTegslR5gK3awT6lo0LVBISzlq5n+dSsB8Y276e9PsVdPwyv+mEdYN511vQfZuL2vCFvP47oEunvH6CjFYPXQBUNbyyrUAy1S461sE8EMIINENZVJ5IH134WgxlLLQLaqs37pawcA24qH8/OvKXqgOlFkDOW22kgi5cQmKiYvIb0h5tBUPHOPerCmkLzO3JXb9Jf1vpTJHlASvd46baJOFYwTvzbs6rBrHMiwrNbx072Pv4MbZEl+KZnVWO9LznQnJD3P71bm9iWOkL2GgJtkHWxeeTk9JLAWGV3dHQ2iUIp7AKsQ5rqdvbeFxp6ozsnC3dZpxXWqGGGP9YzdmrvrGvCHlxh85rGY6bJlc4p4hYp+1f9Z/TPhWIarGjIA6i1J56PvdQE3ZGlT94gdv+Q4/n37p66FM586fDIwjDgTBG3byIO7PGLDjbA32B1oRq9wwtrWa6Pkc1vJHUwRKT4bRsKZYtldSEdkgRdmHfdQJ9DgAWhxJCsPVJmVoBXJklkI0+GY++uEwZthpRaLAgMzk6yYSnjYPDa13Ivefz1ii7pCLmRK0M4oMcpGdvqgl/Q9wY2yO6XYvTXYaKKC5umcrICHJZMUncWHQ24rpWRCuGor9d8rcAod4RfHEXqZ0yYcj6o6X6lwEyYgNBjkPrzMTwj/p/5qk6DEamsPTEaJkFCIQtILrCDZwfmQdee8CUjDiuKr8QsmoS6ZSCH7nQP9fHFhBYtGbWftPoV24ddwF+4SyTvTzXXLmGw2GTY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(86362001)(38070700005)(122000001)(36756003)(31696002)(6486002)(186003)(110136005)(71200400001)(316002)(478600001)(41300700001)(8676002)(76116006)(66556008)(66446008)(4326008)(64756008)(66946007)(5660300002)(53546011)(6506007)(38100700002)(2906002)(91956017)(66476007)(8936002)(83380400001)(2616005)(26005)(31686004)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2M3SitPcVhMUnRjQjZWYnRoVlVkYzJjb0J4ZGhjTEQyckhpNHF4dS9BQ0lW?=
 =?utf-8?B?UGpQVTliTUlqdkxlTm5NQ3lacFFtNDE4MXcxREptSUloUGpCV2ZSTlB5NjhT?=
 =?utf-8?B?aDJNQ1ErdjV3TmdTMmFTdnhOQWxaRTcyaGxKLzJRejBQdzU4K2JyUlFOSFhk?=
 =?utf-8?B?S2Q0aitGMlk0amdTcHpsUWhHTlVoRkQ0amRsbGJyOWtpVDU3WFV1VkpLaEdD?=
 =?utf-8?B?RTNFbHM2bWZtSk9PRDhveGMxSW9QK1BXVzh2MFZUc2pwdTRTdS9zVnpMbUNl?=
 =?utf-8?B?ajg1M2F2SUxtRjVuaHNZWXRlSkJJRUlqYUMrMm9pNlpBdEdkZlF0WEpRdkk2?=
 =?utf-8?B?bmpsbXA5SlJsLy9IVFZ0d25yT3lUaTMxZDVxRFZ2NVIycjBuamtmQW9BVkU0?=
 =?utf-8?B?cnAwMUI3VGJ3NWtPQnR3aDZMUHhabU5hTHhrbXZ4QWdhZHdqYXB5SWg4clNN?=
 =?utf-8?B?ZWtyejhGMHk3cHpvOExmc09nWU0va2tGeldYS3NrNW01aS93S2pOZzJ4VzE0?=
 =?utf-8?B?UnlDbnJDUmhaQ0Z0WlF0MUJ4bS9ZdjB0aFA1U1FyRXhFU2cwckFpZmRua0ZC?=
 =?utf-8?B?dFA3eEE5NzllanVOMjFOc0lKeHl0c3NXdE5GTVhyU0t2TTEyOWk1cHVlZ2NC?=
 =?utf-8?B?RHc5N3JEcERCaHVDeFA5cmN3NjNja21SVVlYcjZkSEI0WXh6Y3E1YVJtZkFj?=
 =?utf-8?B?WjdkUElPa3JMblphNGNSVklsV1U1RVFGL255QURXbzdhM1B4K0dpeGYrb1oz?=
 =?utf-8?B?S2RJdjFoalZXUWtCYm1kb2xWVExzeG1PSHBFd1pVNWpmUjVmb0hGYmNOMWMy?=
 =?utf-8?B?VDFSSlUwaTkzaHBxTjVDUEpSbndsWS9uWTF6S09BTnRxUU51dGtuREhLbHlU?=
 =?utf-8?B?dWt2WWtTWHJUaVpOYUY4NHQ3TlQ1SXVsakV2TjZteC9RaFJua3BYOW5rdXNv?=
 =?utf-8?B?WWhoUE1UQjUzYmQ4cm1tVUVtNmdxL1B6QkxCQXNTbTNCeGk4YlpEa3dZaDVo?=
 =?utf-8?B?eWN5RWN4VEkzVVNIaVF5Qm1FSm0vN3gvVHBydmJGUjJrTXJtd2FOeTlQQTRi?=
 =?utf-8?B?aWRqMXMwb2NsM2YxbGV6ZDVSajBsbkpiM3RmZG5EMVd2V25mS0NTY3pPYjBE?=
 =?utf-8?B?MmNYMnh0YXd5RUJtU295K2VqSXJRbGR0TjlvQkJhTHM1bFVkekdDY3ZSZU5H?=
 =?utf-8?B?aGlYQlJla0hQQlBuUVFBYVJpM253clZneFdJUzUveTZWbTkvbHJ5a3NmOFRl?=
 =?utf-8?B?TkxQYnNDNXhncHh3Y2NOVFhyNTVldzFFdXRMWWZpaCtJY3JJS1AvYTlMc2I4?=
 =?utf-8?B?V2g2azhnTmdHQ1ZoZElSUTlIc3ZWL1NMRmRjL01hRks1ckdrM2RRak41QTht?=
 =?utf-8?B?cnhIUVlWamdaQ1FmVVV1Y3EvV3RkL2JkRFd4ZzdrMGFmdWc1NnFXYm43cUJy?=
 =?utf-8?B?SS8wWUorRWNnbi90eGxSTmVuZ0JmRU1hMk8vY093VDlpV29BWnl1ekhpTXJy?=
 =?utf-8?B?THYxYXN0SnJiQmg2elNqL3ZBNXlYT24wMDNTQUdjc1FiSXdTWlc4Y2t0dGk4?=
 =?utf-8?B?cWF4UzA1ang2T3Q2dFcrNThVWHJtQnBDM3dnR0taWWRQRHZIdGROWXBpLytl?=
 =?utf-8?B?SFBDUE51R3pvMGwxZ0lHa2c3bGkyTExPL0RoZW9MaWFaYzkrOTJiMTRBSkF6?=
 =?utf-8?B?QkJzSjU3ZjJHcmViWDl6amVhTnhKWWcxb05PVml4cmVrbDdnUktJV0VKKzNY?=
 =?utf-8?B?UDZrblFnNWg4Sm9hdFVNajNtVDBOWGpabS8rRnVudCswcldqUUVRbmc4eGR4?=
 =?utf-8?B?MGtNeFVMMmYydzVOZGtYcTBoeUNZZURRYVRBeHczWEhkODhYcGtrdmtLdlpr?=
 =?utf-8?B?MngrLzlBclo2clBJZERTSXNpdGJsQWQ2cW5STVMydWZCWUc1WkNrVW16Q3lx?=
 =?utf-8?B?cFl4MTlYSjdRQlFSVHp2S1pkcEQzQ08yOGVpaUltK3lLOFFTZmdWcmtYSUhj?=
 =?utf-8?B?d1hyTGE4aVl2dm9Ub1cxTzRxbTZMZERscDRWdktoQldSNlJpblhOYktmNFB6?=
 =?utf-8?B?ZUFBcVFwN01razh3RkZ2SFJUb1hRNk9Nb3RvR3lTYVdKb3FkUHFML2puT3J1?=
 =?utf-8?Q?832g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <804C6D83A5F6134DA4608F11FA1FEA60@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f2ea93-68fd-43d5-eadc-08dad9d91b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 11:32:51.2831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgn6zJjWYPpyeknCpCfWNKfpgmSUfO0bfnZyQVhierc4lxhoqruYTqmk8aps2U35jihzVDFmJtqCeruxaWFJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653
X-Proofpoint-GUID: JN1kyczQwhxMFW_HyT14z-_5ZyFz3MIt
X-Proofpoint-ORIG-GUID: JN1kyczQwhxMFW_HyT14z-_5ZyFz3MIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212090088
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGFsYWssDQoNCk9uIDEyLzgvMjAyMiA4OjMwIFBNLCBQYWxhayBTSEFIIHdyb3RlOg0KPiBI
aSBNaW5hcywNCj4gDQo+IFdlIGFyZSB1c2luZyBhbiBBbHRlcmEgQ3ljbG9uZSBWIFNvQyBGUEdB
IG9uIG91ciBib2FyZCB3aXRoIGxpbnV4IGtlcm5lbCANCj4gNS40LjgwIGFuZCBlbmFibGluZyB0
aGUgVVNCIGdhZGdldCBmb3IgSElEIChrZXlib2FyZCBhbmQgbW91c2UpIGFuZCANCj4gYXVkaW8g
KFVBQzEpLiBUaGUgVVNCIHdpbGwgYWx3YXlzIGJlIGNvbmZpZ3VyZWQgZm9yIFVTQiBnYWRnZXQg
KGFuZCANCj4gbmV2ZXIgaG9zdCkuDQo+IA0KPiBXaGVuIHRoZSBVU0IgZ2FkZ2V0IGlzIGNvbmZp
Z3VyZWQgZm9yIGF1ZGlvIChzcGVha2VyKSwgd2UgYXJlIHNlZWluZyANCj4gdGhhdCB0aGUgVVNC
IGdhZGdldCBEV0MyIGRyaXZlciBpcyBnZXR0aW5nIHN0dWNrIGFuZCBub3QgZ2V0dGluZyB0aGUg
DQo+IHRyYW5zZmVycyBjb21wbGV0ZWQuIFRoZSBVU0Igc3BlYWtlciBpcyBjb25maWd1cmVkIGZv
ciA0NC4xS0h6LCAyIGNoYW5uZWwuDQo+IA0KDQpDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IGJlbG93
IHBhdGNoLCB0ZXN0IGFuZCBzZW5kIGRlYnVnIGxvZy4NCg0KaW5kZXggOGIxNTc0MmQ5ZThhLi4z
YzAzNDMxMDIzYTggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQorKysg
Yi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQpAQCAtMjIxOCw2ICsyMjE4LDggQEAgc3RhdGlj
IHZvaWQgDQpkd2MyX2dhZGdldF9jb21wbGV0ZV9pc29jX3JlcXVlc3RfZGRtYShzdHJ1Y3QgZHdj
Ml9oc290Z19lcCAqaHNfZXApDQoNCiAgICAgICAgICAgICAgICAgZHdjMl9oc290Z19jb21wbGV0
ZV9yZXF1ZXN0KGhzb3RnLCBoc19lcCwgaHNfcmVxLCAwKTsNCg0KKyAgICAgICAgICAgICAgIGRl
dl9kYmcoaHNvdGctPmRldiwgIiVzOiBjb21wbF9kZXNjICMgJWRcbiIsIF9fZnVuY19fLCANCmhz
X2VwLT5jb21wbF9kZXNjKTsNCisNCiAgICAgICAgICAgICAgICAgaHNfZXAtPmNvbXBsX2Rlc2Mr
KzsNCiAgICAgICAgICAgICAgICAgaWYgKGhzX2VwLT5jb21wbF9kZXNjID4gKE1BWF9ETUFfREVT
Q19OVU1fSFNfSVNPQyAtIDEpKQ0KICAgICAgICAgICAgICAgICAgICAgICAgIGhzX2VwLT5jb21w
bF9kZXNjID0gMDsNCkBAIC0yODkyLDYgKzI4OTQsOSBAQCBzdGF0aWMgdm9pZCANCmR3YzJfZ2Fk
Z2V0X2hhbmRsZV9vdXRfdG9rZW5fZXBfZGlzYWJsZWQoc3RydWN0IGR3YzJfaHNvdGdfZXAgKmVw
KQ0KICAgICAgICAgICAgICAgICByZXR1cm47DQoNCiAgICAgICAgIGlmICh1c2luZ19kZXNjX2Rt
YShoc290ZykpIHsNCisNCisgICAgICAgICAgICAgICBkZXZfZGJnKGhzb3RnLT5kZXYsICIlczog
dGFyZ2V0X2ZyYW1lID0gMHglMDh4XG4iLCANCl9fZnVuY19fLCBlcC0+dGFyZ2V0X2ZyYW1lKTsN
CisNCiAgICAgICAgICAgICAgICAgaWYgKGVwLT50YXJnZXRfZnJhbWUgPT0gVEFSR0VUX0ZSQU1F
X0lOSVRJQUwpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBTdGFydCBmaXJzdCBJU08g
T3V0ICovDQogICAgICAgICAgICAgICAgICAgICAgICAgZXAtPnRhcmdldF9mcmFtZSA9IGhzb3Rn
LT5mcmFtZV9udW1iZXI7DQoNCg0KQlRXLCBjb3JyZWN0IHN1YmplY3Qgc2hvdWxkIGJlIGZvbGxv
dzoNCg0KdXNiOiBkd2MyOiBnYWRnZXQ6IG5vdCBnZXR0aW5nLi4uLg0KDQpUaGFua3MsDQpNaW5h
cw0KDQo=
