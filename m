Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478C26DE68C
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 23:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjDKVfw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 17:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjDKVfu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 17:35:50 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1440759F4
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 14:35:36 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33BIaBqu021828;
        Tue, 11 Apr 2023 14:35:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=aRLg15Zgl2mzk497M2a7pk/yaHPtkkRWv0GcqKixE98=;
 b=fwAgR8Ymo6JfPuG5rxYulH0D2yIa15uM4SR9aUBXK36Dy73evU2Sv76/AG2fFwLv0OBb
 CwPWTFv1XzrYRJYMTCkqcCxsMRIOxjg9I77NIKWbMAHMZm2yTXSxq7RgjyP0tDRpyu0Y
 /ik79zmsFPku83tTvy5JkOB2S9TAmi6BZKhPRlvqXFkAjZr2tM1Isa8vZjv0JUfb8NvI
 dB12HMdlZUpbYKg822sdab+Vpcw5olO90K227k5k5XehWVwxZf53Suuy/eJrx6ZSB665
 J7sRySesD2JcQAj6Te8jS+hTsbw6bNa9P/WSU0g6tJ/NwBrY0ZLl8QgQIBnKPzfgs+v9 zw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pu7h90pwd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Apr 2023 14:35:28 -0700
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 83FBBC0811;
        Tue, 11 Apr 2023 21:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681248927; bh=aRLg15Zgl2mzk497M2a7pk/yaHPtkkRWv0GcqKixE98=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=U3AuZDCUc3wqXum0CYUjiskETeg5OCf9u6lsgFwLUxhYr6aN9DlMbiBoMXDfXDIVX
         QLztHwFP3IdY9JqEKENPxkuGgwxfvyE5uKWh05ffpDWbe1SsnvViFN8wK34ZxBLEf+
         3TsIYxzXQIQYvDXsjn6VGpoxdNlfOlp+3hvwTlBYdKrCggIUYJyAJKkiNGygWdcjMS
         Q0EiUtyNXD5NVq/eI6+gwHCSov4y4iZF6dPZ+YG3tDtLeAUF8E3yiyE6rN2x5tK73q
         Go0PRCLmr3PmilP66GJUmQLibwrnzTi/gVRToLwnYLqPC7i9HEmFghIFuZFAQe1ysy
         eNWX9LnJR3cMA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1907CA005E;
        Tue, 11 Apr 2023 21:35:26 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 48D49800BD;
        Tue, 11 Apr 2023 21:35:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="dCnKuUf4";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgNSa1lnJIfw7wcZrw/0RC9HrglH1N0xwZQIrHJGocufz4mGYknwBoZNJRI5DsMuKw2KPrxfrGMoANi2i/wCDJCqkiUe3t+P6OASivDKzd1/RW9ZHejBu9HF+nFJqJcCTrBUdPpPpD5eh2zw/CSHcv3DloOT7qkhhkMRmAfYy2uTR3KXx+Oe3aRGA1vOeXU3DMa23RYzxVcoRE9L/D++rvX8VIU2V7jx2mTr2X0l8KIDAxD2SuaWmHccxQTaqE2WMbB4N+XQwziD/D3bXlUxiRFsHcBOIUK1oDvTbr0fOg/PP+8fQdeUT1uCt+9yBUeXblLQUIi1IDugSMuvcJLkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRLg15Zgl2mzk497M2a7pk/yaHPtkkRWv0GcqKixE98=;
 b=V/bz96/qI1pUvpZ451tL36rDLEwYi5PKB++lkXuiJKwmQsF+nf8wg+sD4B0DQdy3tg3/olEcKVH3t5bFLG5MEE0NeeFQjU+ELaeSfBSx7b9aFjWrpTSNzeusJcQJTkooiWwxgMKX3VrpqQgcsAO7ZN1mriVG/CzFKtLyN124KDrAashf0TAILUe3OB+E3iJSi7zuzHHO0J1LJvpcdkJx7f+0PSt8d/6m0D3NxSZAxbY9b5aGUF0yRwJn6BWGR0s4nFik7SyIi4xpfGYYTgR1wDyEYcsLGEiA1hvYLhtFLyxZRZTM6wRplv4rEZ9vkLePPbOvszx82tS+cDYEobdU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRLg15Zgl2mzk497M2a7pk/yaHPtkkRWv0GcqKixE98=;
 b=dCnKuUf4CMJNKuAmmWKlNzU7EUZSVcGq0+WBPehfgzbyV5pM2Gh1P/St8zhyrI4aYE1HERUcsIATTont3d2P/9lIM2xMg8OkoQh+vqt8DRC9ycutDJPO1/ssgt8s2WEMLMm/4s5kNw02UTJegFWf862nO2Sy5Odhah1075/cok0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 21:35:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25%4]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 21:35:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Stanley Chang <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,parkmode-disable-hs-quirk' quirk
Thread-Topic: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,parkmode-disable-hs-quirk' quirk
Thread-Index: AQHZbDd+puWUUmWeVU+Pk3mZ2n5LYK8mopEA
Date:   Tue, 11 Apr 2023 21:35:16 +0000
Message-ID: <20230411213514.7ck6f4jinnpzl4xo@synopsys.com>
References: <20230411053550.16360-1-stanley_chang@realtek.com>
 <20230411053550.16360-2-stanley_chang@realtek.com>
In-Reply-To: <20230411053550.16360-2-stanley_chang@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB6603:EE_
x-ms-office365-filtering-correlation-id: b2a25000-01f7-4774-0179-08db3ad4a460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X/pA310TvlAzVaGM2LWt4PpF2jKEmALi9r1QhAumMIK6omhadFkjIJtiZEzTKARLd1Q48fhtYwONpi8/yeLxovEIaLHUJ5muP9+TZYgZdWHPZnDjMpTIWFfZ9kaz8mkGYJYHeHjmm1mycbFD+VCrimzgsdlW9NI4+UInrwKV5YPgTHlsj8IzpSo4duCO5OlXmU56piyHPAiUQ9FBpyV4ffOf8UWYuEgZK8mm+DM+Hh3dAGPS9HbRSOh0RMQRsAbyTtY3fqHAHvhWaQRXU1yTznrS0USdecFE9aEw7dO8qkjBPYx2LvVM7TFunkI8tZH8oOqsnHecIeRIRn/Du0sP7NDsoatwVM3W3Ol95+HjJEY1g5MtnUpVkED1n1JKE+EruDB2zaSNbqFdBPPRa1DZGdD/28C9Y5By35Ot4HhbAga1wTAOmHydV839CEK8oXCjjbrsgp2ljJiAHXPOH7zShQNsph1wp9LKc9R4A5HTCiIUjQ2Aq3nhn0pjR/ngQQe5Nsd7FIc6zR8EumK8wAWhKEM5+nfOSHQg4rG5X1s7M1UpQV3y6xfa7XHEarVeO+tOiaS0HSuieTtgAbEtPlNMLadaJTW4ayS9CNv9sUDHdlSNFh5WjH9ph10ku9K28ACc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(71200400001)(478600001)(1076003)(26005)(316002)(6506007)(186003)(54906003)(2906002)(5660300002)(66446008)(4326008)(76116006)(66946007)(8676002)(6916009)(66476007)(64756008)(6486002)(41300700001)(8936002)(66556008)(122000001)(83380400001)(86362001)(36756003)(6512007)(2616005)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmlPSXlaVFByemFCSVE2bVRxeG9HdnZITVRBSjQvNlJ0MGZDN3hYbUVUNG5Q?=
 =?utf-8?B?cGN0SUhBSWwvYnArMzkwN3NjbWF6VjVzVjJMc09vcGYwQzluUm4vRW1ML0di?=
 =?utf-8?B?WDVHelRFTWhCa0gwZkhPRFY5NDdVeER0eVhvbXVvY2lCdk9QWFNTMmV4Uys5?=
 =?utf-8?B?Y283MWo2d1FNaFZqV3JWcUhHUlMxV0szVllqN2FURVl3VEFZSm9hWVdBS2NV?=
 =?utf-8?B?cldiUGtjeUdYUkJObWxmOGJHcFFaNkZsMzhoMXpWRG5DbzZBYTZVeWFETi9O?=
 =?utf-8?B?QUVZUmpoOCtqQVhvR01IMzFOV0ZPVUpEWlNJdE1kNGZNN3JRbVJuWjJobTk0?=
 =?utf-8?B?SmJ5SVR0eGpnT1VpbjVMUzZubklONk9BSWhiS25nQjNBMW1NcVNFYnNrVnpT?=
 =?utf-8?B?N0Jza0RNS09NQ3BWeWlNZGxlRy9GSlpvMDBsZGtIMVVPY3I2VXRZNllCNGFk?=
 =?utf-8?B?T1FXekhPVEpiTHRaNUdmMUFXQXg5WmZKMDkxMWZxTUlqZTVNNnV0VkFsaVpZ?=
 =?utf-8?B?RjZMSTJ3SmNwczJpZVlSdm9rM09wRzNQay9heWNyZmpvY0F1RVhSeUJmNHF0?=
 =?utf-8?B?VFdyK1BPclFra0lib3J1QUlnYUZlTk55VXRHMFhLbDlaVGdiTTNvb3NYWTZO?=
 =?utf-8?B?eTZGRzNOTTUyNTYwYjYxWEVXN1E4S0ZpeHRERTB2K2VIbHA2M0JKZVBINE9m?=
 =?utf-8?B?Vnphc3JIK1Y4eEVMVW52Nm9aaU9GdXd1NDhkdlhJVll4V1p1SG44ODhmanlS?=
 =?utf-8?B?ZnpGdXZXZEZjanlTOVVYWWJ6WXFocVFPdHQ4SGVpZERTS2tMUms3T0w2ZHFC?=
 =?utf-8?B?Szd5U0FZWUlyazQycVVBU1hNbnZzQWluakx0dy96Yy9pcXdHazc4RVJ2QVBo?=
 =?utf-8?B?ZkpjNk43QndzQ2lHV041TWlmSldzbFdqeUdUeE9lZ2lxbmRYbjcrNEtnZ3Vw?=
 =?utf-8?B?SGhGek5uNDRWd2tuREFReXhySW9CQlIxRk1yN3c5ckZlQlFCdXBXcjJvY053?=
 =?utf-8?B?anFxTkxRSUdNUWY3eTdESWlnS1pRdFltVHY3MGhlVFF4citYL2hRYjlQNW1t?=
 =?utf-8?B?Y0lTTkM4SkFnemR1VWxVVnkycllFTkl0UVFkZWp2Mk1MeDkvQTBiL3p2QUVs?=
 =?utf-8?B?TEZFTlRzSGlIdVd6cFZHeFYrSXdBM3YvMklpUytFajJBN21yWnZnUzJxL2sz?=
 =?utf-8?B?d2R3NEFGVkxxTlJKZmV4L0ZDNDU5QXRaekRRSVQ3OFBiRkhKeDRRRmdPZXE1?=
 =?utf-8?B?RGVWOER5OFI3dGlkQ1Q3OEZmOHN5ampIVEZMZGphN3ZTL0dnZ3lYdjhBRE9w?=
 =?utf-8?B?ZWtSbitKakhEYWkzNGM5dFM4WFVIRGpua2JTSXFBTDR0Z2ZrVmJsZ0VqN2Rq?=
 =?utf-8?B?WFVIaDVxUXlmN2laNW5BejVnQjhjN0xjSEpRYVdzeU50TlppY2MrQyszMkpE?=
 =?utf-8?B?RTdCWmpMQmFFQkpsTWNvMUUvekJUbU9xTmh6YndWRmF4WDY1bS8yMnh3QjVu?=
 =?utf-8?B?Sy9IT0lRRXprL3dOaDdyOUFucmphTnNnenpRTnpKL1h2ZTlmNUFuL2x5d1gz?=
 =?utf-8?B?SEptM1AvS0dJdk0zZ1gyc3RnSW10QmJqRkVsL2V3SERTYmtiVEVnVjMwVW5i?=
 =?utf-8?B?ekFzRnhJUTdxT2xqeno3WEdOYTBrRVQrYW5WeHZQeG5qSUd2SmRGeXo3SDQy?=
 =?utf-8?B?MVpkQktyY2hhNlIrbTQ2Ykk2VTRFVXVJY1FieGJvdmNIWDc4MlozZHVteFlE?=
 =?utf-8?B?TW5HR2I0cGQrK0lZa2VkcjlySlYyZnNJSUtKMVkwbXUwNSs5Mys4QzlKODJT?=
 =?utf-8?B?aTNlTC9VMkRVYU0zbjk2WHJXdmF2K3RaMUZ1bmFOYW1uTEVheFZhbmJsVG5l?=
 =?utf-8?B?N3NKSTFzOU9hUzVFQys2TUZtVzVUc2Z5SWVZbFZZQVVDNlFPVTlYSS9KWmZN?=
 =?utf-8?B?a00vUTFteVRDUUdjeGJtSDdjL2cra2RqTHNKcktiZFpYa2xvSTY2Q3ZWR204?=
 =?utf-8?B?NG9pSytyeCsxN3JIOXhwclc5bTYrMS9CZnByM2lJdkpLaGJTclJ6YVUwWkho?=
 =?utf-8?B?TUxFN1d2NDAxNkVKTVNpb1MvaU8yMytZTWdRcU9FSUpja2Yyb2RubW01Wnlw?=
 =?utf-8?B?ZnR5Qm1KcDZIcGZyMm1vUlNNZkd5RHg3NXY0enZIRTJ3KzVKK2JBMEoxOUtD?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C59C01B3C30D44DBCE78AB4EC349E43@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6W1PZkj39epOKrBTpGjsfph5/eFcftQA4qep1/TO9fX8elJBIJ3gdESWdjDO03onb6HVB8k9CLK0SAqusLrHVo/vjzl/rcmcMSETxi1rI7YHZnm8Obm6tGZ2AddaXbnmm4BRG3zcm09tcLgTkb4HzkD2yjlgWIZm2AjLZXnxuItFWb7+4/sbyci3TY/4Y2OaMtpxp+5ZyQ+2gDIAhk4NEMZ0FWaOQIlB/4sbG4UnPG3mj9mi6AKe3BFR+apzLTuDSjNWFr28R0RHStEKkMktuv+lNH6Vd30MPWfxBthVa/qvM6JW5qYfqvTo1LTYVUxXyN3Qy2XmdisYXMAK02CaXPiAHKjse37Hf23BvH+29nfhIqTJ0E/0bxH9m6I9zaxFVK4M+dJ2XM57+QWCOdocfYnh90rqX5t3HPYUWISvoX1icoyHGjsDYX+Y51z5KsXb6LfrQULRMLwJAl023Zj2q4W/6SGeYx4Y7GHsc9N/+d1db365SfrklU1AbyjFulaaugAVTYSfVROaGfYedj9SvFfEjFjRCqtf1k0cDqvhdXBiFXawjz452/8FJnbs3O1SasRskYrnAzPGdiQj9xesZSXP80ObH92QoF/yTRlHZvHBhv5YfSZc3S3dBFkAYVaQBNU/TLmxBJ52CNAX2HfoXrmAlVEkOW2J/pNogZauZi9A6BcHyVD6Ps+Dfm1wR1sIMixONB8YFvVRJRDHqVr+BGUgA0TlW8YYj6uO/IVyGn9g5zCE6JMaITQ/NeTPFKGhcT5jGESuAKW8zOSk7q6byZbi3CQnmghBHx4/cn11amSQHUBEzKVNbNYpOWpPcJDOk3oQ39t/61qC1kguJH+IKjJmih5vzEuOvNOZU9MKdjs=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a25000-01f7-4774-0179-08db3ad4a460
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 21:35:16.7764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FR+/V9NdLo+zUn46BXqYb4mqqsoOHDj5aftZ4Ub7X3aCJoqwkzlQGPbySoTGOrdC32r6wnnasJnZos33hqD60g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603
X-Proofpoint-GUID: u4xz7l8X9qQUQpLPXLenH_5-MDJ4YFTo
X-Proofpoint-ORIG-GUID: u4xz7l8X9qQUQpLPXLenH_5-MDJ4YFTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_15,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=831 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110194
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

K1JvYg0KDQpPbiBUdWUsIEFwciAxMSwgMjAyMywgU3RhbmxleSBDaGFuZyB3cm90ZToNCj4gQWRk
IGEgbmV3ICdzbnBzLHBhcmttb2RlLWRpc2FibGUtaHMtcXVpcmsnIERUIHF1aXJrIHRvIGR3YzMg
Y29yZSBmb3INCj4gZGlzYWJsZSB0aGUgaGlnaC1zcGVlZCBwYXJrbW9kZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFN0YW5sZXkgQ2hhbmcgPHN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20+DQo+IC0t
LQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFt
bCB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdj
My55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMu
eWFtbA0KPiBpbmRleCBiZTM2OTU2YWY1M2IuLjQ1Y2E5NjdiOGQxNCAxMDA2NDQNCj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy55YW1s
DQo+IEBAIC0yMzIsNiArMjMyLDExIEBAIHByb3BlcnRpZXM6DQo+ICAgICAgICBXaGVuIHNldCwg
YWxsIFN1cGVyU3BlZWQgYnVzIGluc3RhbmNlcyBpbiBwYXJrIG1vZGUgYXJlIGRpc2FibGVkLg0K
PiAgICAgIHR5cGU6IGJvb2xlYW4NCj4gIA0KPiArICBzbnBzLHBhcmttb2RlLWRpc2FibGUtaHMt
cXVpcms6DQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBXaGVuIHNldCwgYWxsIEhpZ2hT
cGVlZCBidXMgaW5zdGFuY2VzIGluIHBhcmsgbW9kZSBhcmUgZGlzYWJsZWQuDQo+ICsgICAgdHlw
ZTogYm9vbGVhbg0KPiArDQo+ICAgIHNucHMsZGlzX21ldGFzdGFiaWxpdHlfcXVpcms6DQo+ICAg
ICAgZGVzY3JpcHRpb246DQo+ICAgICAgICBXaGVuIHNldCwgZGlzYWJsZSBtZXRhc3RhYmlsaXR5
IHdvcmthcm91bmQuIENBVVRJT04hIFVzZSBvbmx5IGlmIHlvdSBhcmUNCj4gLS0gDQo+IDIuMzQu
MQ0KPiANCg0KUGxlYXNlIGFsc28gQ2MgdGhlIGRldmljZXRyZWUgbWFpbnRhaW5lci4NCg0KUmV2
aWV3ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhh
bmtzLA0KVGhpbmg=
