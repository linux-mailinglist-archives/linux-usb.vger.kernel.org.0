Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98C270CF68
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbjEWAjf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbjEWAa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:30:58 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A1BDB
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:20:23 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MNp93n017070;
        Mon, 22 May 2023 17:20:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Auv5bz3bWg5ojYa3GwOBoQB0PmcDOuL8Cj2GKrl7EBk=;
 b=SQTaehaQQci4D5evGzJ6lzyQ+J72GhlBNFeROWCjdT8J2S47LYUCgZKEbxLv9yO15uWm
 a0tz9RrDlzvuBs9eTBuB7lNpuMGBUUbTQ2WNrKBHm6JbXTa1PLkgq7BWlwRkbf9dr+3w
 oxex9i26D+3x+Ahn2Eis0EtutNkIK7iCiNzHfnOJy0ABGqKZGAtHBz6pWfUKQgEV/DKz
 t80+WakD+Z3FicyIMjxE5+gBw6uXcVvt1JHtcY+Mv2LreT0w5CyLxpUulHmapSGHAPr0
 dXGXthslKPk8HQdeq3nL/eddX583BqMN93MX6ckD847bhFa16reYbfxfETnYyqKtUYLJ hQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qpw7m8r4n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:20:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801217; bh=Auv5bz3bWg5ojYa3GwOBoQB0PmcDOuL8Cj2GKrl7EBk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DlJRTnEolCnWCvtsynCKPCpoTQevRdEh/8j6bT1fkhijsoJ0sJypDVQ//gaynGuHP
         LBTRY6VtjOmj0ZgtLwBTWiSiu1rE5YdE9OX8fG51njMS5xffbtSnOzyGURpyO8DFbg
         nZSpL4oeTKCdHVy7ai58s7Vr9ztACzVzNro8T1CsYZViCbHZhTldU/H5EVh/UcI5YJ
         KS32g5I0vM8E2qPab8KpHJTF30CdWaHLFtO1I925Yy9XCsVmVYK53nPTsf9DBQ+i8Y
         aok91GvqZSZdyVdTxSEhItfO0SO8nM5V9mQ+VeqHLvtCM7g9WRtwyVj3XByzIt+ehQ
         ywjg/vkFj0s+Q==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 965AC40637;
        Tue, 23 May 2023 00:20:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 67878A007F;
        Tue, 23 May 2023 00:20:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=K2mBpy5q;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CAC43404CE;
        Tue, 23 May 2023 00:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8mZKh8I+1fgu0KnQ0aaDD3vxZdonQ0K1FGLguEL+7j8DkCvKTtHllwxlg08pUi11O5yRUpjjZsUmUcP2mpY+UACxYC5PEQl3GCBCJe5pjXIufJznS1zPcx5GU+NO3f0yae5ywfdoxUb6bmJQXfxbJsrA+dsMC8Ddb9PxV+793Y0xsKHQEZDGKOxjtWGxbliwdYO6HhtowxuMcq2RzImhEsHy3thWqdfg55B6votw79yLk3AxruwGpaMnl1/WVAd0xweSn4OjRD1SfW7+jHHLVkxHOf8npEcTdJuwxoi29LgRTJZXHNA0vg8FUi2G/KoqCIweOs+6W+9Cnp0VTKZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Auv5bz3bWg5ojYa3GwOBoQB0PmcDOuL8Cj2GKrl7EBk=;
 b=nmNaCGKjJ9j4fOvjAzfONDanZ8rI0W6jQqEA7xUVmCY/EmfRHXb/C74xAa6Kve8MGsN3TxzZOrEi9pNOn7/CJ1T0lU7aA1tH7DDZtpBWI45cFXmHo53sNAHIEO7cW1kKRqHvKclsf2vU8p+HoJ5nZyJYgYSFSGMGNDS3WqoK5OnhtLQ43zflc2t8G78aXrZvCKVHV2PJQllBh+pTxEEB3jCD5uvQLeIRU7oCwO/e9jsMiuDAbPxHxfwQ7ZIbvEreEgUo+M9tSG5ghgD0rxsgNz9pMXW3jFMUdW6LHqc0NsSoWGAMWg0GC1zi/RKxuqS2MbRcWbUAOT1TlqFx4PTDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auv5bz3bWg5ojYa3GwOBoQB0PmcDOuL8Cj2GKrl7EBk=;
 b=K2mBpy5qI5MFrP/d3PJ0N75Di04uS1tK1cMJtmhXz7iYrPAYD0GeqWdLzh9s26FoHRuezSCgh1rrCk1iXjqoiLM97XAWaeIcq5FWTJRa9isNCFd+rpx1UpkBTqBV7uDLbgGhFaGKJlaObzk72TycSzvcXvRWURmQ6N8la/DIM+g=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:20:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:20:08 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 13/97] usb: dwc3-am62: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 13/97] usb: dwc3-am62: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO2GSOJ57JOrEWBNzxJ3tvfaa9nBnoA
Date:   Tue, 23 May 2023 00:20:08 +0000
Message-ID: <20230523002002.rwvu32btscsbopaf@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-14-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-14-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: 4726ab90-84f0-409e-12e5-08db5b237750
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R/+NNPqlSHMiW5Ujvgu/OvlKO82Cz1bQXcE39aD7wh0XpP4HWF65fLnjLbjq9iKJKPo7jmrrHp6l+pAHUCrIzoDTYSaceEs4Xll9U0SbkcI9WZIehOGrRv8X+EWy4hKjsWoILS/KYCVbaDvGxsKJnHoEyJgaScH/swPXdB/2RTmCwqt4H+LgKyHyJ1JLDKa1W/QznJQqwIhSOFQ0c4s8HUIDU2UyIjBh5f9Q1Swh6d/3NU5KtGfOkjrzvHP8kiamxgFdRdk024n65bZeR/YRyd3X5SVvd3uijGske3qtnNauJgrMcYT2n0PiGC51HHrcNWcL6kW3M16SU02Zuq8eJDIPBKgxC1qShM05DWEAHv0B9LtoK+WXfLxJUkuI7uJ5CpPDOtCSMSXO3Alo7wJEOjRE/btWJSpwYDDL+E3LoIxDooYFYbBHL1FMGZW2n4xkoM8sX9K92uqOq33/WbUHabPvoOXGd572pc7f8Sf0U0C91R7xgbTqaTDeE+e2tPMPeh8DLKwl2q9Qi0joEF9O/dv+cbhX8QRgeovTF9LOus3ZmbILlTDZIDXAd1/N2RW7g1qjsfgTIM8qMij2N/lP60TIe+VDL5/K2K90AlXMpZnx12eG8RIaMdPPKGhT5lzs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXFpWE9WcXFCVzExQlN5WWpMY2xuSWRiTnZFRkp6a3BNMzkyT1NhRldBcWtP?=
 =?utf-8?B?M29JUU5HVUg0amZvN1ZtK3dQMGFQcDFiWm5OMWZHcFZuY3VGZjNFUkcxN2pr?=
 =?utf-8?B?bHJyNlQrMEJ1N1ZES2Y3b0lzSG1tNlNieG0wNkJJYUFXNU5hQnlLQUVIeWtJ?=
 =?utf-8?B?UEovMk1sVDR3alRLNTlrQlJsK2I0VlRWT0Q3Ymt1TFB0WmVVWk1KT0d4Uk5W?=
 =?utf-8?B?dGUyMVIyU2o2YnRsdGFNQkJJQkorL2hHYWZjWGQyQUp4cmNtaG43QjZuWFhG?=
 =?utf-8?B?TmF2V0YzQXY0VFVJVWpNN3FaRGVBWk8vSUgyT2pVSWZ3WTRQRWFOOTVZYU5l?=
 =?utf-8?B?MlRPa2hNd0U2WVJLTTNmcGsxUnRpKzFvUk83VmdVYnNYNlBlL1hpWGpHT2Rk?=
 =?utf-8?B?RmltL3NlU1lCNlRUUUhJTEFLMUdveXZlR1FlSmE1eDJUaS9NVTZFQXJpUWZH?=
 =?utf-8?B?NTVkZG5pUmZJcHdoL1hnZnNyS1lUK0lJTE5rSU9xU0tEK3hWU3g2UTdNOGEy?=
 =?utf-8?B?eFNzVTYyMEw4Si85dHl0WWhORk5PdnBFTzNEQk1Qei94ZGxDMkVkaDVyRUR6?=
 =?utf-8?B?VW5LWVEzd3NVZWo3bm83bnpvcHVzWXhsVmplaEM0eFNmdGQ2TGtEcUNqREd5?=
 =?utf-8?B?ZHNVMU0zSEZ4RUlrOEJScGp1b1hBZGdGcWxZaUdwemQvQTZjMUZOYTNVbEJj?=
 =?utf-8?B?Vy9PRDAzcUVscXg3eExqQzBKT0dZZGNDRUhWS05iVExIeXVvMm1GdU5LMGcz?=
 =?utf-8?B?ckVKTlUycVUwL2IwZEpRWDcrUnB6djNaLzZJNkg4ZDBQbWxaczhreXN6elVk?=
 =?utf-8?B?TjRCZjdKVzdSbzFkRGhHT0ZDaXc5aDkzbms4cTVMWEJ1cGNpVjFzUFBySW9a?=
 =?utf-8?B?R0lGVFVFcUxHK2hxYnArTHdXZElKSjEydDlGeWZlZFowWXFJQUtRcWUwSnZi?=
 =?utf-8?B?YlNxZ0pQUTVvQUtBYVpCSy84cHdsdG1hcXh0eERMenc3V2g3c2h0bjJpREYw?=
 =?utf-8?B?N09Dcnk1ZW9CbUxVSGhPd2U2YzdrVXI3TU1DaE5lRENPOWNNeFpQQWJVRjMw?=
 =?utf-8?B?UXZnTXpsZDNzd2UwcC9GOFhCdGhuM3NMTHF6WlBrVUxGTnJXME80Ym8ra2Vi?=
 =?utf-8?B?VEZ4OUdvQURwNjhFNHQvYkYxMnRqejhkcnNRQjh3TlZoR1dNYXhUYVVzdWFK?=
 =?utf-8?B?TDFZRHR4THE5QkdGQmR2Q3lweEUyQjdvM0tEY3Zoa1luTk5wV2Vzc1Q5SXdU?=
 =?utf-8?B?dGN6VE9PT2VacUNqbDNHeGQwd3BlTGN3UzhTNS9JUjE5STVSdDRyWUN4UzZL?=
 =?utf-8?B?YmlZOVcweC9LZ2tzSTdCV3lnKzdVa1lMWW1jZW1qakZSMmhmZTVSaU1WU2E2?=
 =?utf-8?B?MXUxU0ZNMG5aMHp0b3JDK3E4RnhRUXhncVNabUtDdlRZSUEvWktneXI1WFUx?=
 =?utf-8?B?T2RyU2s3ZmRjeWpiTlRJblp6ODBzY1J3bFRlbnBtWlVUdmR2N2dHTUVRbGR2?=
 =?utf-8?B?VElZZUUyeTFBcGJBckt3V1hIMjI3NUY0YjM3VGg5QysraVZob0xsZjFOL3Ra?=
 =?utf-8?B?d2VERVl3MzI4Qk54RkhXRkxwSmk3Q1N5VjJEekxrOHVrdXdJWXB0QWtYMmk1?=
 =?utf-8?B?UzVrZEFFSU9KWGhkRE1BOVEwWG05OWtFdmwrdzRlMVQ4b0hmVk1pMXJRNkxv?=
 =?utf-8?B?c01VTHNhaEw1OEJXbzVibTJvVS9wMHM2dnVWME1rMWkvYU9nYnZzK2ovYjRr?=
 =?utf-8?B?aGFjZTVKSnFmeVRtU09PMS9xb003MURIcTNVRzU1d0FHYVVZb3kzakx2YVkx?=
 =?utf-8?B?SnU2Um1GVUxDa0NaNysveW9wNm9ieWFuVld6QjB3SmtRN050UXBpdUFIbGgy?=
 =?utf-8?B?VGFmL1RYUTlVaXlvL3hmTzRScXl6bVk1SWFBbmkrSytDY3R3SXNoUC9pMzY2?=
 =?utf-8?B?QUZOZDk4c3p0a1dpVHNkN05Qd0g2elB6K0lnNWdrQlNWR3lZR3ZJR2h1UlRy?=
 =?utf-8?B?eHdCa3ZjMk0yempYZHVHMGdaVlZDV1ZzS0FmOGR4cXB6THJDcnNHQ3lGcHNB?=
 =?utf-8?B?Vm0vd2luZVQ1aDV2V0ZXSklDeDUwb1dIN0FNQlRzc0c5WlYwU0gwTEp0bXE2?=
 =?utf-8?Q?ahjWAFtblMehaULcPgSgKeULE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <785A15C9E1365747B966F0BAB175DAC8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: StmjzaF8XR0zYjsAKt0KyrePl/brk0A6R6gWtLwcF1R/6B0EAirDYi/ljPp8rm+l5gi5C7ffyOXTZG0xHgrUeF+8RTsuuBtp2Gk5qeBHSjlx9VMsXTzxrdgfIj2dkNUCj+4vUimY7yMtQrh+BMtMxM5fqkgArn2MzZiO7zxcqDkwmQdTUeGWqYu6kBxUKK+46s1GpKRo/1Fu1BWntUtXsPuerDX3ybGe+vMBVr/h5lj7w8Vz4oUWLsYWoJ5SmGCZUr1+ybYmJnw9+BgPKcZjO0LD2GdFyZuxBAul+anrLLMnXbFp84np4G1kAUE0ORskSIZCdS5fQa63RWIiqixF5p3LMr0Baq0ZK6U8ntO5ysUTAuT2aSMrIH8Q3w1hDogyHYHiQREd42Fu8/uGeaa0n4Ioy+ex8w9b7FYnXEhCaIVSuIqtkgk7XcTaVuWrvcmD8IvSNsS+cmDGUCDztANXk/GsVTuG6tDZfg3vF49m8v5koJ1oC8nrY6UkmkphSE8a1rCaLn5xULf7rhiNbQ/IwlAvvP9UD+KtEjzm0iWzKQ3BFQ3kwLiwGMwx2NLOrPKEpNsaggve0Z79bF1Cz6ILsYEx0SN5OcW0+H9d/ycdse1zrQUA1Ukk8oSMfpAcQHogngKUVDeG9G8fr/zSRGsJm07+yEaJRTJLl+KPueGxdPFwRr/nClajMY6VS5v9mddGTfgIEj/FmoW72k43/4K2/t2CQ0l96og47SR8S/jCL/1SA8Oa9wVuQIU6khJgiDKX6r7ACvh2XKxZdduAcHWqtMVsSr4iC3Xz2zw0UJ2GIVCq2WMWfPN+UE5Sn77R9VStDqPd+2osZ9u6QOpRSr7D09jXk2sChnRbO5tAgpLidfmxAgZp2VRXImAPg96d7Smapravq+8iOpuSiu3al2WATw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4726ab90-84f0-409e-12e5-08db5b237750
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:20:08.6638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g98fRlY82Tq6tKAQQVcvzake9kRYijmzNsO5+FgJ1qWRCeqJrI/VqciLTSlh1vySbJq1xyLSt4hawOHBfHHMKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-ORIG-GUID: iEVeB1sedy4uVhX-0ED8wJUvWnvXsfcB
X-Proofpoint-GUID: iEVeB1sedy4uVhX-0ED8wJUvWnvXsfcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyB8IDUg
KystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMNCj4gaW5kZXggY2RhOTQ1OGM4MDliLi4xNzU1ZjJmODQ4
YzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYw0KPiBAQCAtMjc1LDcgKzI3NSw3IEBAIHN0YXRp
YyBpbnQgZHdjM190aV9yZW1vdmVfY29yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmMpDQo+
ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM190aV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyB2b2lkIGR3YzNfdGlfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsNCj4gIAlzdHJ1Y3QgZHdjM19kYXRhICpkYXRhID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7DQo+IEBAIC0yOTQsNyArMjk0LDYgQEAgc3RhdGljIGludCBkd2Mz
X3RpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXBtX3J1bnRpbWVf
c2V0X3N1c3BlbmRlZChkZXYpOw0KPiAgDQo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
TlVMTCk7DQo+IC0JcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gICNpZmRlZiBDT05GSUdfUE0NCj4g
QEAgLTM2Miw3ICszNjEsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkd2MzX3RpX29mX21h
dGNoKTsNCj4gIA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM190aV9kcml2
ZXIgPSB7DQo+ICAJLnByb2JlCQk9IGR3YzNfdGlfcHJvYmUsDQo+IC0JLnJlbW92ZQkJPSBkd2Mz
X3RpX3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldwk9IGR3YzNfdGlfcmVtb3ZlLA0KPiAgCS5kcml2
ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJkd2MzLWFtNjIiLA0KPiAgCQkucG0JPSBERVZfUE1fT1BT
LA0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
