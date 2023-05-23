Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3222770CF83
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235387AbjEWAjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235466AbjEWAa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:30:58 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D981E43
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:21:24 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MNpfq9023701;
        Mon, 22 May 2023 17:21:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3Quy8yGJCGRNHDf9uExsn+yOoOGiTKXRi4Ovp09/Cyk=;
 b=QFndSg1VF/1ltOGsrgUAoGLjJ5bbh5bRFz5MdNOgyCpjTO0EjE6qRKND6oGXYtysFTkK
 mYmORrCpi8lMJSgOHZfRVcMsh54AJ4EZI9Ioe4TWRIjY/pr+/Vy/ZROQjRky1GK9UEYy
 N/LoZ7eNwUfucfWhfycw3YJa7iph3SxR0FhwcWLkvgO0/Eg/6Wf84RYneM3geeipXMrd
 kySEWWzjQFeokKCbxIuH9alK+M0NGOJ6NTyygAt/+lYd3757SZsuYcjfSCbQddtqPbMz
 Ghd8YcLNCD20xl2xbB4/bRuJenEySRyDm1XIEZibQkHa5lBtquuakVTFkLJ6jM806u5e yw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qpwf4rtn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:21:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801279; bh=3Quy8yGJCGRNHDf9uExsn+yOoOGiTKXRi4Ovp09/Cyk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=LBfX+d3d/E6LhyFHthaaW/aDm4AojONE7G7kmkqj/JgP2ZSAOAL+onDntD9ZCBOqG
         sUP02+9XWnDHcBzMlWWYBzSDJtwKnqi4s6FlRQcnVSoocS8kf5OurBpP79MzbeuVM4
         fRun4dkk/wjIrxUP0JwNTwecyBE6AOYWkJtDckQiSCA6SvI3CZQdVpg7ltX3XWNAub
         cMjqyxg7tizAiJi7JC7M1FDRWwfefOQ+peDPmzL5sNtmV7d57HckQAYmSiHYxpxJ2/
         rchhdjPGB+5znNucd3pYbxe01QBo+Yivbq0rbMx4osPUWfLD6tgQKwMtX5a1pTuTCE
         iNxosG6VavwZA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B815840638;
        Tue, 23 May 2023 00:21:19 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id CA45FA0071;
        Tue, 23 May 2023 00:21:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ITbPPkbg;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 656E5405C9;
        Tue, 23 May 2023 00:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9/7uPSvCf1Z/0OTeq0U+N3HWG2GTeqW6fOLHOPeTZ9dmHJ/QE6A2PyOzA+xaTslIHfDJLtOgwJwA+mo3tj9mhHdqCbo3s9o4RxBG3L9GYsO+yarx9KrUvcdsyCJ8Q64jRR8HHcnbY/6M79h8k+eGvMDu3fgeBtuefiDVDq0g2vueqAK4a3Tt0Qe6ASv6IoSvz83VgBEQ72a/ykImG3liPvzPy+estipu3A2ATMTaLdcmCsfIMZSghC+1/BFYWLNPeE2yKgBwJ0eKILJ1zfA8qO+j551InEA83MWKBJgXZSAqQyS8qfDDn4Zd5k0AE+elvDQ6+dTKzigKByPFvxVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Quy8yGJCGRNHDf9uExsn+yOoOGiTKXRi4Ovp09/Cyk=;
 b=n26jMtcXptBfPyplM07N50ObzaWuHrVvTsWf9r8xaHnKoTby/ru46nV1rS1xOhSnjQqclj4xxgGscqJ9n7FosUqnBE9VYMRq0LmHO9vQe++44tOOPfXI8LormjLcf9VzfOZ586NVNckqYywj0I4GIa/vN97z7wKq5WslTcx+F4rK0wLpfwbLSdi9l+VNYs6bv6HFgmquN8kw2MOZcpVO87DEPQpGDL6jJiOfjKoXVOwK1AfLfpsIExNjchtzwdRMTH0GNNuwwVYaXFBXWTcUUAA6hD65KAW3odU20M2H++tXKCUfQTBHAPiHsAzs6j6M4smpi8EFMAUsJVK3nQehdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Quy8yGJCGRNHDf9uExsn+yOoOGiTKXRi4Ovp09/Cyk=;
 b=ITbPPkbge62VBh3Xp03UQ+HPgI6B/Ztu75T8QnRRJJwr//3XFOaW+qex2FENNPzY1wBHTH2yaCGY7dXS6tJms0rz4c2hICcG2ghYTCBlohCijA35CtDo8MniuPfQLZvMZxCZ/4m1Tc8ul8WjaRrEjim7JJ1v+zlBVEFN/7F6Vfs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:21:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:21:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 16/97] usb: dwc3-keystone: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 16/97] usb: dwc3-keystone: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO3gYrGMs63j0WrjoTQyvGxja9nBsqA
Date:   Tue, 23 May 2023 00:21:15 +0000
Message-ID: <20230523002109.ooyk6rmgarmwvjls@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-17-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-17-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: faba44ee-f3ce-48b3-c063-08db5b239f5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STAxOWQp7pAAMTIHBldKWWVvBrpIusmJLfDP5jxJHfCKWLRrVvxE+9E5T7eJ1ekpu0wkpC3SUYMuU8KN3knCzjs85neNZrJdyA522VIho57Desd4oLvVPbmPz6cpn9t+ZOnsaRR2c7iAlkbhtp2ILnYm17bEj4dZidMMYHs5OCI3JoXgMLmzZe/zn0r5pJae0oW0kiEiqif8edB6YYA3MOQtwHGshJ4zhDvRlbu7qMHyxsT0RrewC3TLhN+S3yOAsy2GfozEmlWbvcgQ5sogGPdf4GQ5ISH6hb307K/+o+EsBoVCNwnNcI7j2HriCtXOKIbISDiUGFyoM59ALGrqfLmK9eWvZMcKd2DY+YHGX3gwT1A7MLmuTyraIh3SLKh3sdJB/EN9xGqmsjyVIVbWc1xWuCTEqAKVSs1LYesCTAfriWTuMoOmSHp0JjdGeHH3MRUlS+BltJ7MBerFgwd/WKa4kVkc9POAXE3sRpb7M4aE2TrWo8G1itJEmOVoLJOexpn7NC+gIn5CFlCrI/6jsoTjQFjZtW4OQNZBgIK/0G8tOdxg2jTwBpBmY7Em7wLi3hQ2403ZIOCkLlDoPWxzC41f/d5SgL4e6h39pSb2ebgpe3EaJAnoRsU9TV/Z83Sf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjdHM2R6SEJZZHMvOGhvM3k5bGxTcHc5SWhBa3BydWYvV0xVQmtYU21yMnZr?=
 =?utf-8?B?RnpJUHNxSXcrQVExanVPZCtkeTZCdEF5VXR1U29pRDNKMUN0UmVtRTVnai9x?=
 =?utf-8?B?bmNuVUViUjgyWUdwWUtqc2VoRzR4bjRvVDZuRm5YeW4rL2hXVnIyOTdrek9x?=
 =?utf-8?B?UTgyTURsV2YzSVhCTGVkWWJVK3o1ZnNtYWpSMjBLZ1VYTlZJYTdaWEJzSUht?=
 =?utf-8?B?V2JmeUNZdzNYUWFUTUtJeC9haUFmdUFwUnhJckh5cEFyYnRQTzh5UmtrN1Ji?=
 =?utf-8?B?czZodWdZSlRmUEgyNDVnN2JHcGVRazAwUEhYVytnOTF2VjcxUlI2bEpMU0hi?=
 =?utf-8?B?T3BmcnFlWDZCRUY2Z2JXWkdOaEZkcDJFT1RTTDhnemdXMmZmSkRHUHdsUHpC?=
 =?utf-8?B?UkNwNHdvNWo1VmJYT0h1a212RWdxMEkvbUtmalJKV1ZsaFN3Q1ZxWjJOVmU3?=
 =?utf-8?B?TENWOHhQWWdQWVBMckVjRDRVdU1IeDhZa0EyN1J5QnhvTXhkQkVpNkN5WXBY?=
 =?utf-8?B?OWhrZUNnZnNqSFk1cVliUElXOXVSM3pKbk1jZUQ3dkR3SE9QckZKS2xTaTht?=
 =?utf-8?B?eEplSjNGTGRVOUVnQmtIcC9HamVYUXZ4ZEJBcHVPWUJWRmJkOVhXMDBPU2U0?=
 =?utf-8?B?UWp2YVI2bXlwODdMWUdZa1NqZTR5cis0QWgyRWx4eW4rcEFDN2ZsRGxiQjFP?=
 =?utf-8?B?aWxyVE9wU00rQnF6ZmZlNnhmRXZjUC9aUkpXTXFMc1dWMERvZnREaDI3MWw5?=
 =?utf-8?B?NUY1cFA3YUZ1Y1NlUklTOW5CbVB0bXZjekVKUmE5UjA2ZFc5TkJGemphSE1s?=
 =?utf-8?B?dnFGMC9UMDJOdXplUlJwdUhxR3dSWmtuYnovVkwrUjAwcFdTTmNvaWdhWkZy?=
 =?utf-8?B?SjY2QmhvWE4zWklEalZtTUVrbGc3SXRINTU4RVlrSFRJQUVPYTFpbUVkMnJx?=
 =?utf-8?B?T1JlMzJpd3h3Qkh2WE5TaGpUS1BwWUhJczdRcXhPdzIwdEdzdmxJcUpKWlow?=
 =?utf-8?B?dlRKZG5wNFVKU0pkTm8xZi9YU1dRUStTUG5GYXNuUUxIVjFBaFFVcFArdy9D?=
 =?utf-8?B?VU1UMWtxSDJKZFBSWmFTd1pjbFJZejM5RHZiTTRualZGUUpRTTA4WUtjZ016?=
 =?utf-8?B?Q1BlS2RQY2ZhOHpqdUtKbjlwWnByN3paNWtkdmhObHh3Zjh1SU5ick8yT2w0?=
 =?utf-8?B?cVRacHFQcVExMUpBdzZubEVLZGM0ZklZK3ZiUVdoMzNMNjBqSDEwUXJnQmJ4?=
 =?utf-8?B?ZFM0QXczL2RvRmV4ZDRPcVE2K2hCRElxZ0RjbW5qU1FxS2tLZWV3eUNaUDFz?=
 =?utf-8?B?SXI2bFQ0Q2xTWTAyTHlIVmdQZnpVSVVaeDlZeDJRblRjMnVqOEttRDgxY05Z?=
 =?utf-8?B?dTdjd2NhK0trK0NzeWtiOGlUNnljdTJ3cG9PbHNzdWczaDd2akJ1Mmc0TTM0?=
 =?utf-8?B?RUdwanpUekZ5NEJVK0doZnhtbTgxLzdrZUxRTm9pSldnUURwVjhndEM2MXB5?=
 =?utf-8?B?QjVPK3hsNlJFWVV1dVp6OHRPTEdqYU5IanNKNUNXeGJCRHZiOFc4VG5jQmxY?=
 =?utf-8?B?VVMyQTlhbnFwbmlqR0lKaVFRU2hybWR5N3cvdHhEZCs5ZzhGYUZXZzJmZXpH?=
 =?utf-8?B?RkpTYXpWUkNOQ3k5YlJnTC9qQ0s1L2RTYUgxMFFDa2xJQzByQU10a2l0RTJj?=
 =?utf-8?B?ZitNK3ZNMVcwWEEvTkQxWEdTcjdud3VBN2JXaWg0bXFxUFNieDZBc1JtTHUv?=
 =?utf-8?B?a1dSeXhURy96VEJYUEIyckJaNWl1QzdDQ0ljOXd0Q1Fyci91S051ZWN3Z3p5?=
 =?utf-8?B?NkI1eFA2OFVaakllTjE3ai9lbDhVNHVuUnc5TEZ5N1c0bDVQbVg5TWJvbElS?=
 =?utf-8?B?Q2dxZEtWelQ1aVcxc1FrQXBidDJpdlJQQ2JqM1I4OGtIVjc5bWlwbDY4K3VK?=
 =?utf-8?B?bTVnd0pjbWJWT3BGN2V0K2lkNTBFbjFJN1ZZbDlsWmlmRWZDWjJRbUNlVVRH?=
 =?utf-8?B?R0NWRUFYMU94anNqd0ZvT09mbWc5Z3MwMkptcGVsWGxNMnV6STRRbGxCVXJD?=
 =?utf-8?B?akhkZy9xaVZWSnBVMm1CMGhiOEpDUTJNWVBNWjc4Tmx3MkM3S1A4VFBLdEdP?=
 =?utf-8?Q?cvwxh8kDOcOjDyfujRY8qmiWA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFF32BB061258A4DBEB50ED37B21F7D1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SB4hqmyLLTL5tpinwSi/KPQSoZNCiURXhwO/MrJvTSKu6Z4DPAgJewUDIguiCcE0XVWLeLuR4Ww6j4OS9zwqFICgLL2BL4+UG5otB3T084jgrgSfhDg83FowcV3ObdZfDWoGyYXIxAcObtg/yvAb3yXycAZdUO+QTZFssLos+4Y/JQyz+IVNlI4XsEYsIXgU71QYAK1wObcELoYmziUHUQmRTrP45pbYD7DuX99/C5fHrcQlpjUPGdSr9nE1n92a6syQEWSUKHNuuRj3r9Tdk91yAacfy/FXHMuEGmmCqhWCDZzIGLpnO0bLm4xLXmLjXlzRoVpa7N+Zdq6x/WdrFTmrm6+Md0kxllZpCv769qy0+4u1qL/wZYuvefrPc0K2vsmQPJoYzmqI4MUloJwJ7TGDzsax7kQJ6j185QqjFWe2PFjAKjcUUnDS1AdpwqVzjU7cQCYVH7uSl2QZ2vHsznbabXHq7l8cGjeKys6XSEqpYx8aBPC8RSnHzqbRwbFvN8yrDoJksJew1EJEPMPlFH/HIV3rw6DtghuIRCdQ83B+QxwQCdlhLGyJyKMJ0thpkAfdg/osTsgFnBFM9uzGkpQ5qDfcCXxqw+TDGzWi4Kc7B79hT+6JkvA7FMwfBS6xw7mg2Ib8P1km2YpQANXRbnqi3IbGeuYvkrWpf1Oyr7+MDPeuZxz0xBYzdiHi3KJjnNosMuk8U7JN68sN72x8/1kXdooiniwa4+JYlRXVgaXpsNXkVRxHVPnxKH6vU7eVWc+s5GzVTpHNolIRnGUasnfjeq1ja63ECIKphDQEWoBWwa63GmTgoezbIYZZYkrYjHgC/9i14qqF2ztcu8bv+vMGMwvBzXy7iwdAP3RSpudlang/tXG4BfxrNh6pnYDzruGctUh16jSABjmOd3AjiA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faba44ee-f3ce-48b3-c063-08db5b239f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:21:15.8515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiVI4j9TzGPV1LrVaDKoDx4gDtEjHXF/ckQjP0FtpXKTlRB2XIGs4vDAgW8CMkCNVALAY4P4JBQxOOVuf6HMAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: IpcpNOoeSpCzIIDcUOwsaCh9a0wtxala
X-Proofpoint-ORIG-GUID: IpcpNOoeSpCzIIDcUOwsaCh9a0wtxala
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
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
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWtleXN0b25lLmMg
fCA2ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMta2V5c3RvbmUu
YyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1rZXlzdG9uZS5jDQo+IGluZGV4IDEzMTc5NTkyOTRl
Ni4uMGEwOWFlZGMyNTczIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMta2V5
c3RvbmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMta2V5c3RvbmUuYw0KPiBAQCAt
MTgxLDcgKzE4MSw3IEBAIHN0YXRpYyBpbnQga2R3YzNfcmVtb3ZlX2NvcmUoc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpjKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50
IGtkd2MzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZv
aWQga2R3YzNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJ
c3RydWN0IGR3YzNfa2V5c3RvbmUgKmtkd2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsN
Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gQEAg
LTE5OCw4ICsxOTgsNiBAQCBzdGF0aWMgaW50IGtkd2MzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCXBoeV9wbV9ydW50aW1lX3B1dF9zeW5jKGtkd2MtPnVzYjNfcGh5
KTsNCj4gIA0KPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiAtDQo+IC0J
cmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGtkd2MzX29mX21hdGNoW10gPSB7DQo+IEBAIC0yMTEsNyArMjA5LDcgQEAgTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwga2R3YzNfb2ZfbWF0Y2gpOw0KPiAgDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBrZHdjM19kcml2ZXIgPSB7DQo+ICAJLnByb2JlCQk9IGtkd2MzX3Byb2JlLA0K
PiAtCS5yZW1vdmUJCT0ga2R3YzNfcmVtb3ZlLA0KPiArCS5yZW1vdmVfbmV3CT0ga2R3YzNfcmVt
b3ZlLA0KPiAgCS5kcml2ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJrZXlzdG9uZS1kd2MzIiwNCj4g
IAkJLm9mX21hdGNoX3RhYmxlCT0ga2R3YzNfb2ZfbWF0Y2gsDQo+IC0tIA0KPiAyLjM5LjINCj4g
DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoN
ClRoYW5rcywNClRoaW5o
