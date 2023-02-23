Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A327F6A111F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 21:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjBWUVb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 15:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjBWUV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 15:21:29 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4858C5C170
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 12:21:25 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NJt2Ti032586;
        Thu, 23 Feb 2023 12:21:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=HKG51Ozuf7l9OO+SnwyfAwkTe1ivMj9KdHdCVzVyzlU=;
 b=i61IM1FgQkcI7c3Z2ZmXO8/N60YZPIwYduaIRGV1uDgpEE4Ylw0QE0bxHi5Qa2hpK5Fr
 Pe8Jx6ylQIi/GzKA42gpH1/aOqz4LRS7d9LU+ypbbMMl040cwNrlxQvzX27kCqFM5VOt
 TSOC8Lhs3zACF1GUXFUCBbnVmdk/TPwSnce21CB/FcjR5dpg0wwYhtYAyE/kyU8I6Pi0
 XDTvtVHMARkyw6WM1AVs5BRpH6IJ0G3r3JErDalPmaj8JDES/xYR/m5XEdg47VAF2Ci3
 7WevGzJopPZ1HTLXATVhtxN7TkqoZ/GTwshA0cb0goIIWlL4dZtVsZqSs1grLJrOdcR+ 1g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nwy6m7fym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Feb 2023 12:21:24 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A1DC5400E1;
        Thu, 23 Feb 2023 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1677183683; bh=HKG51Ozuf7l9OO+SnwyfAwkTe1ivMj9KdHdCVzVyzlU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=CA8J4vF0DsQJUyRB/gcIl3jNlSaWhoamghlREQxYbNdad2tpU+gKZUyMOaRIV44Cv
         YRGZuPBY5ljeeMxoBgFpZnW6ei+RGvc9Lln6ELFgoHwwRAGelBctHT2PVTjI2aSV4B
         j1idWt+WsfAXeGnck/idT74FZ2bRywA4GLBjZlaXtAtsJYAnhqNHJQkm4+W8c5mggr
         soX2HPGF4HlPnkpu3tY2hpl4082aqOgJg52YYcPF3f6UML9sfAOly1knwo2fcQ+S5P
         xoJibfel0ItSYUTo+o51YyJ6ipYrzYYcN4lmg0jbLHKCh+l/jbiQXFYOOWewEKj9Om
         Qi+4TawaioVMA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8A67DA006D;
        Thu, 23 Feb 2023 20:21:23 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id EB6A4800C4;
        Thu, 23 Feb 2023 20:21:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="hjl6XH+I";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9Rdon/4GOZ5fjrJuLQRWhAYqz6WUZh2wn3yR9BtwAroOgA5Hex+OiFB2JyZikgX+7mBmoNX70GnN172+IT0WCRmsVOMyAiUQaq37M1kRC7mz1ivt1Ogpt7iRDAD+WTotE4MPb1K6U2awMjg2pecgAwlD9VHtNpL8K7WQyepbIo84LdPzyyYvWWFKZdFV1azvBBX1AzP+3SlfZvZyT79+mSBms+Nz2qm4dWH/Kx3IH55XeGn3akfN5Ww5x507Kp9he7Lw1S7hNAytfVsn/iBj1omXQawPGViiOkfrm+mxvNXSyO4tKkRaFq5mEo1qG/w8yrjK2SbOF3GBEJ/VHeMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKG51Ozuf7l9OO+SnwyfAwkTe1ivMj9KdHdCVzVyzlU=;
 b=b9f5pq+66Hb8IWvTLMkFEY/d/ROWcANisEOBkEBpD+OOHJJW+6m4prmPcU/VmPYEp+5NNi8S8etBf/0CkV1+mjaRzrKqyDaodGsXVhgyu2IdRQyPWAD9SFecfILCnyCNeYhTciuU3Bx+OcODgP0FVaZcS4NFJ141GEMYsh1JX07sSoGtQsJo7QviuubdjK2ido1YNEyky1OWkOdhlBW5lNOQ1Knuo/sE6qkxkzlREVgH2LKi99AmqT9QWcnNfibbyzJih1WcyfpmZVFVMwBtoYQ2/YeI9d8xybiCUXgnPFF4t8ALu9Kh0SzkqYvxXhAjv9kPYdLh30UI1kEdH4alXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKG51Ozuf7l9OO+SnwyfAwkTe1ivMj9KdHdCVzVyzlU=;
 b=hjl6XH+INcehH8+lwy0+RWXwCZQZ6iUSTbzrPaAwNe8XXNUiNI3NnzLfBrMjQ6+EIKznr7x2F2Vqztt8J8BGjsmHSVL5Z3NwIE1Wgc4zyjzot7LdEuMgtizk77GceWN5XPbtibduCwId2uZkVwb7eu44QGIjVxPpXyg2lHU1FJE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 20:21:20 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 20:21:20 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] docs: fixing typo in the dwc3 struct
Thread-Topic: [PATCH] docs: fixing typo in the dwc3 struct
Thread-Index: AQHZRSTjGDxjBqWKLEe8LJZ4UORZu67c/nkA
Date:   Thu, 23 Feb 2023 20:21:20 +0000
Message-ID: <20230223202116.43fh3oq5l5f77a4t@synopsys.com>
References: <20230220121408.111541-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20230220121408.111541-1-vincenzopalazzodev@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB8306:EE_
x-ms-office365-filtering-correlation-id: 81156d4a-ee73-4cc3-aa06-08db15db8672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oa+ndz2dtqzgEKaAUKZrDJctt33xHqjHp3V8kSub2/bAz8qeLwo/CDelsjxtQkLf1B6OjqL8DROGLL7zrMLW11ee9x2Ok1MX3fbLgTQZwgh3dsxtc12BjUWw5HPniwCgHF8HxpAWs58HvOabcrqKjnElAmQeZeENRluPeBEC7n8YWIUHG8vwpG52wouZqF7DFLvXE7UwaoVgy+0FP7zyopkqG6thg9TsgdHw0o7JMxKKVeoX1VroTr8rEpMzspa7kyaUVnsgVqnENm2KPIxlvguLdHOTa11picGTe762vFdsK4r0qx2m8iM6VJJ8LrUWhm8yyt/ZZ9qrEYA50aAfSvhEilDJYWt6YPaJF9jVEBP0MR+YZLH8JFbyWiJF+QkED1nNMfr8dWZK/1R1q4UcIlGxjmXqglyW3Cl/ekH3/vvpXgNhlWoARt4ZjcxTgLuhltYuZvY9GTG6dJnMD7jswLmOZNtr4ZR2MAj/392OdsNkaYn395tNFFrwDrRoznIab0IrlRF6LnNHLfb95vz5AWg2kwEnSg59k/4TMvj1J6oU2RJLTMuawuoO5jUbz+mmbEf8fQZQBqAvvxDhRkk4AqvS3PKX5BUUAP5HwdmF3pSPsfTQJLsoP8bfTDr4wa1Kj40mKpRxNFjvf6ww9PCI3ckZp0fVFrdjjHXi4TT2l9FXSBrBbNachOXEMAyhmkRL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199018)(2616005)(41300700001)(83380400001)(5660300002)(478600001)(186003)(26005)(8936002)(86362001)(38100700002)(8676002)(4326008)(6916009)(38070700005)(66946007)(6512007)(76116006)(1076003)(6506007)(316002)(122000001)(6486002)(71200400001)(966005)(36756003)(66446008)(64756008)(66476007)(66556008)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUNkUGVsVmZ6RzMvZ0pVZ3NJTkRWdzVYV3kxb0t4dnVBMkwrNWFnditha3Ba?=
 =?utf-8?B?TkVSUXhQeURHRDRORS8zNm1UUWMwc3lPd25uTkJtd1Q2U25DM0tTdTFaSXhw?=
 =?utf-8?B?b0g0ci9xQUtIbldDMmIya09wZTJrNi8rVExndThmVnhsV3d6Z3BRVUNaUkdW?=
 =?utf-8?B?aE5tdGdvMDZxZVFmWGxHbWRnWXo5M2ppRDBsdStncU1pU0FTMi9GVEpZVDhr?=
 =?utf-8?B?Nm9WSGZDMy80ZFIwSTBJQkpCaTNQVUhRcXJlYTc0Z0FNK2pmRUl5MHcrTDlz?=
 =?utf-8?B?MW80SUtobExoN0FEdlRTOEZWaGtwSmRhcDM5ZU83RVZEZ2NoN01pSHVMcjZT?=
 =?utf-8?B?cjlTVWF4TFNXTHRsaHFCMnNzeG1ZdG9PZjVVckNhQ2hUc0NrbHZvRERQcFQ5?=
 =?utf-8?B?dDFwWnl5WUpac1pLVGtQTEoxNUpEeGx5VkJ4bXZTblk4TFdUNFZwRUJRdEhX?=
 =?utf-8?B?ODZScUJpREtzcTkvZFJDVnJaaUMweW1hMjYxbENnZ3RkSitTLzBSdXVRMEZo?=
 =?utf-8?B?Y1E3ZGlZVXcwZnM3Z1AyR2FXS09ZaGVLVkNjREE1ZkQ1SENob3RLc0NPRG02?=
 =?utf-8?B?cG0wM0xSeWtMSTYyZmdxZmd1K2tCaTdSSERrNUhHMkFJRnVuTW4rQkVMSEtS?=
 =?utf-8?B?c1I1SW1RYXdTK21Xd2tlanA2c2I4VzZFT3kzYVB4ajRQeHhtaExMMmRjQmg5?=
 =?utf-8?B?SWV1N01VRXpSN0plOU1vb3RwcjBGZlB6VkZBbkpTRDFWaHA3akVreFRiamVj?=
 =?utf-8?B?YkNNbmZzMXpLbVA3ZjdWT2dhZEpvbXMxL1NJQkJjQmFueVlJU3lCWjlaZWh1?=
 =?utf-8?B?K2F1SjMvM1RuZnk5WjVWVFFSdG1KaVlUaWphR0RvTkZ2N1NOQUVxdmZSRzFw?=
 =?utf-8?B?WTBPVHNvajRPd1J1b2dUNjl1N3BUaUFSUldYV2RpdTdzWHhHdGNGaHpaZUd0?=
 =?utf-8?B?S2ZkZUVxV0t4MFl2M1ZvbVhNWnRzcU8vZ2JzVjVnZTFvOFFYRzErNGttS0d3?=
 =?utf-8?B?bTA1VjVPQnYyN3NtMFBtcGhQTXp4aHNDL1FFcE1oWEJMbno1cUZOeFJzQytX?=
 =?utf-8?B?K3JUWDI1OExlVGt2bVJkNEV1UyttNm5Ja1o2N3BiV1NvcmdDTXB0cVNpeFYw?=
 =?utf-8?B?K3VYckQ3cEdLYm03cUkrKzJSTkwwWnY4dkNOMUpvUG5aUFk5UzdkekE3d0Fi?=
 =?utf-8?B?cjhuMkdXV1ZoK3EwckM2ZUZhV3RaVmw5QkRRNkVhMGJpeGxOWmQ5eDY0a0gz?=
 =?utf-8?B?TklDOHRMeWtlZlo2WkxNeGtZcmhKYStRQnBPdmdRSWFyczhIdkpRYXVhQVVv?=
 =?utf-8?B?dWVhb0xYNk1sY1Myb3VZTVVaVmxabnJhSW5oajJWYUZjNmpJMTRPOUFMSU9s?=
 =?utf-8?B?eFoxbWNsSUttRnByL2V2Nk4rR1FGQitZV2p1R3JnQUZURDBOMWs1YnR6a2p3?=
 =?utf-8?B?Sk1ieklUM2lXUW1NVzYwR2JNSFlVaWp4Z202OWJjdnJIUmJzSjBVdElqaC9N?=
 =?utf-8?B?S21TZVFManBkVE8zKzhXTFgveVM4VXpvTjJkdUZqbm1ucGEvSGF6cFVCdzZy?=
 =?utf-8?B?R1AvcHhzSFpFemo3NmxQSkovbXRPelZ6VlQ1dmFPb1djNDRzNGQvZ3pqc3Ar?=
 =?utf-8?B?eFRoNVNMN1M3Y2ErakhUUzJQekpwR0dVRG96Q01VdnhsMnpENlFBQlJuSTB5?=
 =?utf-8?B?WDUvOXlDdkZuR1l5RzNZOUxCUXRpOFhTcE5mTUxuK3pTbGlsU3VkYU81d2Uy?=
 =?utf-8?B?SStBTDV0NWVPNHVIbUR5MUg1R2hDUDFXOFY1U0VvNEh0YzRJY1dPVENsQUxk?=
 =?utf-8?B?aUJScGxlOTEvSWFLaTlmQXNiUFZuQ2hMTjFGRlE3V0ZzVyswNGZNS1QvV3Br?=
 =?utf-8?B?eTI3cmxzNitCR1pHbEZGQ1N0TndDaC8vZ0JURm9NdGR6ZnA4Ujl4OU5ESlN0?=
 =?utf-8?B?Z3RPdUo1ckVvMjQzUDhDUEVuNlhmVGdvL1VTbGpWRE5tbVhkSlY0TUxWMG0x?=
 =?utf-8?B?and0T2lsS1pYQ25zL0lOWFdJekNBQVlxaXBUakJVOWczT3pYYS9pYVNUSFor?=
 =?utf-8?B?NUhiSG85L0k2ZTNmUVVmUGJTWGJJRTdCZjZOM2xhRVVrWU4rTXRPVWNjbzFx?=
 =?utf-8?B?RE8yenJJL2RzR0dydXh2aDQxY2NzK2tmakdvV1RadWtIcDZnSXNicWtkWi9D?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <218810154D5FCB43960919CAFBAABA23@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WvTQAMVI8quZQybJ3wr32y86tZuOfk1dRH+RvXGJi3cJp3/9whAo9JVYH6WtWzL9/o+WqujPxXxkRoKQuDUh1qJeNiQYBHZcQfSXhk2u5uc+Bk3zZOGgqRU4SO0VnJ+novEJB6wqEeOFloyEOS2FQP1wfOJi26SkmJ3dH36DZHztxDLN7vQ48J09xsiWW7IJLCHqf0MMzTIp0pjYQJZf/LwUdg3G6kwn6FRFZdpxPgaMYhLoIiCS+Mb4kthH++7XNKPhfVbkBP0FqIh1Q012l+ZViGQ2e2hhVEfCJJ27rLOLw13Y6EmmK+TbO6+LpgQvGKcaxnAoGNOzUAXT/lWCAZfjp8egShrt3Cl1erpVndq/0coR+9iTehMbBRYj05h8uTOujmfbTQZnqduqjCJMSdex7FaK1Fq8FVHnVedV3FQWp/6mjD3gqqmNFuFU3eQbuHxbSlhUzcj6iOymx79RiMymu5c+57YIwfAHorQ83xyNVJBKBA6RAnzkdboWT20KBZ5xw6usRoOtk5RAq6bPmFfNPGPUoTv+7ljrc1dX43dv2EZ65kx0oBo3cJS/IvVir1dQ5V5XxgcnNt+bP24iDS40MSkyCiFRN+7Z0LXkYoPfaMbEMQe2RsI78FOrBd7BUUok5yfVlBi6tClkAyqrPg2BXJisliBEXq6HzQCMJcx70XcrV0jGdB2L752L4WHtscRea1GdrpQBlz60b1H+9kHnaAYA4NCkEoixcIPaX+/hTbOnDM282yERcFvHknoK/QcYoeARqrsVv6Uig7wmEItK20GUS9nsEOJ8IT0JmOxt3CcukXWzluACb9A+JxBICD7cRHDi6E1sAlNC4nZh6Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81156d4a-ee73-4cc3-aa06-08db15db8672
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 20:21:20.0739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1EASLi0L49AUifiu6qxhUnthSIxdO9AeOFWuXzfaGUuR8RCbmZt1GkPwpeqP+oeOCSU4VCP2T8T31vzc6j+RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306
X-Proofpoint-ORIG-GUID: IzrtjzBW3Nen5gMQ05dV6TMUYQSzK04X
X-Proofpoint-GUID: IzrtjzBW3Nen5gMQ05dV6TMUYQSzK04X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 mlxlogscore=618 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230169
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgVmluY2Vuem8sDQoNCk9uIE1vbiwgRmViIDIwLCAyMDIzLCBWaW5jZW56byBQYWxhenpvIHdy
b3RlOg0KPiBUaGlzIGNvbW1pdCBpcyBmaXhpbmcgYSB0eXBvIGluc2lkZSB0aGUgZHdjMw0KPiBz
dHJ1Y3QgdGhhdCBJIGZvdW5kIHdoaWxlIEkgd2FzIHVuZGVyc3RhbmQgaG93DQo+IHRoZSBkb2Nz
IGdlbmVyYXRpb24gd29ya3MuDQo+IA0KPiBIb3BlIHRoaXMgd2lsbCBoZWxwLg0KDQpZZXMgaXQg
ZG9lcywgYnV0IGNhbiB5b3UgY2FuIG9taXQgdGhhdCBjb21tZW50LiBZb3UgY2FuIHJldmlldyBo
b3cgdG8NCndyaXRlIGEgcGF0Y2ggZGVzY3JpcHRpb24gaGVyZSAoc2VlIGxpbmUgd3JhcCBhbmQg
ImltcGVyYXRpdmUgbW9vZCINCnZvaWNlKToNCg0KaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbA0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW56byBQYWxhenpvIDx2aW5jZW56b3BhbGF6em9kZXZAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCA4Zjk5NTliYTlmZDQu
LmFjODFkNTIzNzEwZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTEwOTgsNyArMTA5OCw3IEBAIHN0
cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPiAgICoJCQljaGFuZ2UgcXVpcmsuDQo+ICAg
KiBAZGlzX3R4X2lwZ2FwX2xpbmVjaGVja19xdWlyazogc2V0IGlmIHdlIGRpc2FibGUgdTJtYWMg
bGluZXN0YXRlDQo+ICAgKgkJCWNoZWNrIGR1cmluZyBIUyB0cmFuc21pdC4NCj4gLSAqIEByZXN1
bWUtaHMtdGVybWluYXRpb25zOiBTZXQgaWYgd2UgZW5hYmxlIHF1aXJrIGZvciBmaXhpbmcgaW1w
cm9wZXIgY3JjDQo+ICsgKiBAcmVzdW1lX2hzX3Rlcm1pbmF0aW9uczogU2V0IGlmIHdlIGVuYWJs
ZSBxdWlyayBmb3IgZml4aW5nIGltcHJvcGVyIGNyYw0KPiAgICoJCQlnZW5lcmF0aW9uIGFmdGVy
IHJlc3VtZSBmcm9tIHN1c3BlbmQuDQo+ICAgKiBAcGFya21vZGVfZGlzYWJsZV9zc19xdWlyazog
c2V0IGlmIHdlIG5lZWQgdG8gZGlzYWJsZSBhbGwgU3VwZXJTcGVlZA0KPiAgICoJCQlpbnN0YW5j
ZXMgaW4gcGFyayBtb2RlLg0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpDYW4geW91IGFkZCBtZSAo
Y3VycmVudCBtYWludGFpbmVyIG9mIGR3YzMpIHRvIENjIGxpc3QgZm9yIGNoYW5nZXMNCnJlbGF0
ZWQgdG8gZHdjMz8NCg0KQWxzbywgY2FuIHlvdSByZXZpc2UgeW91ciAkc3ViamVjdCBwYXRjaCB3
aXRoICJ1c2I6IGR3YzM6IiBwcmVmaXguDQoNClRoYW5rcywNClRoaW5o
