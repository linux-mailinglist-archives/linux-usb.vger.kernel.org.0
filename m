Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4428651AA1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 07:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbiLTGX6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 01:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbiLTGXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 01:23:54 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8384513E0B
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 22:23:52 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK5607k008799;
        Mon, 19 Dec 2022 22:23:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=iWAH9ZRZSxha4OPOoQu+ypyR6wihdNj5tduzr5H/Yec=;
 b=KmYCABUK6bzBxPqSHfk/Sg53nscpty9GZSMIEGVZR4S150wqjgrHFEZ9yJwO+ZKBl9tx
 s+uxu/Q0CHpbm97anJdLtL7n1RdiR3LnSNUVkoGIQ1B8+XmnvwLfWkKkYENspV44fKYx
 DzytSDz+6z1xZGkN5NwvswDwc9LPrKK555bYHpLuoLZxecjMipjQ584QcoxNflwa5AIW
 K5DBAeNaJ+XsHYnuIX9umqwbm33YcSwjifn3wSwl96bmsd0Fgz5Snh/XSxdqjRZpUj3d
 53Nh6shN5b1a90DvS4MMhYtR4gnWxRhPS6j1uX66PrBIlb7LTjaQFUE8aoMP7iToGhmV NQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3mhdwasykn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Dec 2022 22:23:42 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B396FC00AF;
        Tue, 20 Dec 2022 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1671517422; bh=iWAH9ZRZSxha4OPOoQu+ypyR6wihdNj5tduzr5H/Yec=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Wie6rUQsL0lkfBwVcVzOpF+PPEfxu8tAVy5lc4MxGe+fZ0+P/ygo0cUQxmmG/syFC
         Ek/buxGOBo9B7LAaYQ8SqqLeblDVkL8fA/4CUYI1Bn0Lr2UEm78rXb6w65AjMXNPTi
         lWzZzOPa0148KjS3UE/eFyBWCsWOj2Yw68379n4m5lJTkGkTU0HttyNG44RePSr+Th
         uvtl3tqi6Mx/GzVUkzXMXyCZe5vT5gyZyCwv2PYfnyhBpYACoXCTjqCx8IJIJ+NerB
         iDJJ+ZedF2USjBedd60GvEbzELLp2fPDPYvINMBGE+KSSFxhESrSry8FB6EKeB9Q7X
         VYceBCAqSbE2Q==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7DAD2A0062;
        Tue, 20 Dec 2022 06:23:39 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id EEC3F400BB;
        Tue, 20 Dec 2022 06:23:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="OiArYNr5";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBYoXyA8FokW0r9RVPE59/w2Lxn2nR18BJeeMpucJCKHgx9hpTZyO0GqDF4GJNbkzmuLZtoxBpD4KjXdjSDpL5CCs7Eqx1abTKFI/IUoh737PIDq7CZu90KFfyt81JCXr6tOT2/Yd5OlqWuFCldrNta8SLFtkyIuhDjfOmw2M0vi4LuCEqeAxIylnEaHK7YTv9RzMp+RkWDVCS7QTyQovCY51L4rKNtfY1itqFScYu+tJ50db6wrbl8P/ABTPrlKHO7HrsTcO0XxCU9mv0dwGE/gyXyVcubjAUT/pCxS+1d7We2oQ3W0ZVlTFCjSQgbQDaVSntMzwnQ33MyC5qHP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWAH9ZRZSxha4OPOoQu+ypyR6wihdNj5tduzr5H/Yec=;
 b=AE7fh+lnhxD+Qc8JIJBNOyO6dXAgHCc654cE5jhfjINd2eNfIDU8JR9SCKdKe0/WkFpDOK6raAVMzEasAnZePO0C0PlC0qc1mJZkzHiUbMyQ1SH1L9PQsqvxM1X5FwSpq2jgpZ4oduakSwR+5KtlE/SvOaiFi1zhCiR47RO9JauLn0No8yCIJFN+nJLe2EkQabfakxmgISIMFo9G7pWYnzzNZznymcUlEtqPDvhBVBnGHN8s+nLamDGZMsuR5EG0m8M/6xeGNDQzWfToVpuBXnqP8UFTJqLfr3VWK9KWpv8a22o8E0Q/db/qV/bdnjjTDaoSBVOcP3eSVjxFbqxYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWAH9ZRZSxha4OPOoQu+ypyR6wihdNj5tduzr5H/Yec=;
 b=OiArYNr5xDliYv6hM2M3MS4e/d6meEOXL1s8h0X9BYNZPYAqcggk7ZpSTUS5VpsrSH8mSH1WG6GdPdgEGvcZ9a08XWqNtKhWSXUhaI354Ryypr+pfUV9s+WOyHWR8n3Fgkiilwomg+vqei+r5eRrIlHMBvAFArD0UF8C7uLuUM4=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Tue, 20 Dec
 2022 06:23:33 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::72cb:134:53d3:289e]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::72cb:134:53d3:289e%7]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 06:23:32 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Jonathon Reinhart <jrreinhart@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Keeping <john@metanate.com>,
        John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: RE: dwc2: Application of DIEPMSK when reading DIEPINT
Thread-Topic: dwc2: Application of DIEPMSK when reading DIEPINT
Thread-Index: AQHZE8UxSDtyHqlYAku/SIbmmJSN9K52SjUw
Date:   Tue, 20 Dec 2022 06:23:32 +0000
Message-ID: <BYAPR12MB339955B0B6120647E09C9319A7EA9@BYAPR12MB3399.namprd12.prod.outlook.com>
References: <CAJJa5Hyw3yBL81zp=k1r4x8BaVqmGbMpK4dbPomQ81JZv6wZSQ@mail.gmail.com>
In-Reply-To: <CAJJa5Hyw3yBL81zp=k1r4x8BaVqmGbMpK4dbPomQ81JZv6wZSQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYUcxcGJtRnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RaREZpT0RJMFlXRXRPREF5WlMweE1XVmtMV0l3TlRRdE5XTTFaalkz?=
 =?utf-8?B?Tmpka05EaGlYR0Z0WlMxMFpYTjBYR1F4WWpneU5HRmlMVGd3TW1VdE1URmxa?=
 =?utf-8?B?QzFpTURVMExUVmpOV1kyTnpZM1pEUTRZbUp2WkhrdWRIaDBJaUJ6ZWowaU1U?=
 =?utf-8?B?TTNPQ0lnZEQwaU1UTXpNVFU1T1RFd01UQTJNVEkzTnpFM0lpQm9QU0oyYW5w?=
 =?utf-8?B?NlVFOUNhRGR6WkZoWmJFZERSSGwyUWtaVlEwNTZRekE5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGSVdVbEJRVUpzTTFSTFZVOTRWRnBCWlZkbWVsYzNNRVJ3TDNrMVdp?=
 =?utf-8?B?OU9ZblpSVDI0dlNVNUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZCUjBOQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVRKWE1DOXZaMEZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
 =?utf-8?B?VUZCUW0xQlIydEJZbWRDYUVGSE5FRlpkMEpzUVVZNFFXTkJRbk5CUjBWQllt?=
 =?utf-8?B?ZENkVUZIYTBGaVowSnVRVVk0UVdSM1FtaEJTRkZCV2xGQ2VVRkhNRUZaVVVK?=
 =?utf-8?B?NVFVZHpRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdk?=
 =?utf-8?B?QlFVRkJRVUZ1WjBGQlFVZFpRV0ozUWpGQlJ6UkJXa0ZDZVVGSWEwRllkMEoz?=
 =?utf-8?B?UVVkRlFXTm5RakJCUnpSQldsRkNlVUZJVFVGWWQwSnVRVWRaUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZhWjBKMlFVaFZRV0puUW10QlNF?=
 =?utf-8?B?bEJaVkZDWmtGSVFVRlpVVUo1UVVoUlFXSm5RbXhCU0VsQlkzZENaa0ZJVFVG?=
 =?utf-8?B?WlVVSjBRVWhOUVdSUlFuVkJSMk5CV0hkQ2FrRkhPRUZpWjBKdFFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJTalJCUVVGQ2JVRkhPRUZr?=
 =?utf-8?B?VVVKMVFVZFJRV05uUWpWQlJqaEJZMEZDYUVGSVNVRmtRVUoxUVVkVlFXTm5R?=
 =?utf-8?B?bnBCUmpoQlkzZENkRUZIYTBGWmQwRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVGQlowRkJRVUZCUVc1blFV?=
 =?utf-8?B?RkJSMWxCWW5kQ01VRkhORUZhUVVKNVFVaHJRVmgzUW5kQlIwVkJZMmRDTUVG?=
 =?utf-8?B?SE5FRmFVVUo1UVVoTlFWaDNRbnBCU0ZGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJRVUZCUVVGQlFVRkJRMEZC?=
 =?utf-8?B?UVVGQlFVTmxRVUZCUVZwblFuWkJTRlZCWW1kQ2EwRklTVUZsVVVKbVFVaEJR?=
 =?utf-8?B?VmxSUW5sQlNGRkJZbWRDYkVGSVNVRmpkMEptUVVoUlFXTjNRblJCUjAxQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZDUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVsQlFVRkJRVUZLTkVGQlFVSnRRVWM0UVdSUlFuVkJSMUZCWTJk?=
 =?utf-8?B?Q05VRkdPRUZqUVVKb1FVaEpRV1JCUW5WQlIxVkJZMmRDZWtGR09FRmtVVUow?=
 =?utf-8?B?UVVkTlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJRVUZCUVVGQlFVRm5RVUZCUVVGQmJtZEJRVUZIWTBGa1FVSjZR?=
 =?utf-8?B?VVk0UVdOQlFubEJSemhCV2tGQ01VRkhUVUZrUVVKbVFVaFJRV05uUW1oQlIy?=
 =?utf-8?B?dEJZbWRDY0VGSE5FRmFkMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVkZCUVVGQlFVRkJRVUZEUVVGQlFVRkJRMlZCUVVG?=
 =?utf-8?B?QlkzZENhRUZIZDBGYVVVSjZRVVk0UVZsUlFtcEJSMDFCWW5kQ01VRkhORUZr?=
 =?utf-8?B?UVVKbVFVaEJRV0pCUW1oQlJ6UkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVKQlFVRkJRVUZCUVVGQlNVRkJR?=
 =?utf-8?B?VUZCUVVvMFFVRkJRbnBCUjBWQllrRkNiRUZJVFVGWWQwSjRRVWhWUVdKM1Fq?=
 =?utf-8?B?QkJSMVZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRV2RCUVVGQlFVRnVaMEZCUVVoTlFXSm5RbmRCU0UxQldIZENjMEZI?=
 =?utf-8?B?YTBGWmQwSnNRVWMwUVdOM1FteEJSamhCWkVGQ2JFRklTVUZpVVVKbVFVUkZR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCVVVGQlFVRkJRVUZCUVVOQlFVRkJRVUZEWlVGQlFVRmpkMEoxUVVoQlFX?=
 =?utf-8?B?TjNRbVpCUjNkQllWRkNha0ZIVlVGaVowSjZRVWRWUVZoM1FqQkJSMVZCWTJk?=
 =?utf-8?B?Q2RFRkdPRUZqZDBJd1FVaFZRVnBCUW14QlJ6UkJaRUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJRVUZD?=
 =?utf-8?B?TWtGSFkwRllkMEp5UVVkVlFXVlJRak5CUnpoQlkyZENhMEZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBGQlFV?=
 =?utf-8?Q?FBQSIvPjwvbWV0YT4=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|CH3PR12MB7689:EE_
x-ms-office365-filtering-correlation-id: 9f27af20-4ed0-44e1-1e3b-08dae252b7e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l15jd4BOtgDD1doaX7AwWCtVibTBIxeUoUVGyW8R1whBmwknxv1Lu7HveN+uXoSRH8ghmGWXBsEk8hoyjnazQMAwaeC6nxuf4kbXWTYdG88AKf/rvRvWkda1W41rni2qdC02ieEhx/HjztDy3WLc/RM8n9ag3chOJSYwK/9ic5GleBG3dbybvWOEVJhf1QE1G3TnHlOYgdJEnTZTlVXv319Q5xePvwR9fFN06cNHZNL+2W0iyVOCFaiT61L0efYVdiM8LsekFtTQqPh2uoGP9JsJdCaIsv4HXLoWt9RI4ksVF8y3rlo04eWoxiv4Dww9Bi2kEsnBw6bZ7uY6PBX689aJSe3APmUo5djNozDaBGdDZdwSOq3oE1hQJUH8Jsop2FrTw1+Zf11LADh9bSX6obI3oUz4KmC2YeaPHNwrg13qAZFOCJoYCmAGByM2BoiUWWhLTi0Tx2ghHA6MWNYlnF5q0JJ5gdthA0fgHHzD8VgJUE7DRxfWqM5XwCzUJ8fMuxw90QIxRAkJVK2Bye4cPmlqHHBRhLy1JpRI5ofnM6usaNwa6NA2OhcMEm2xHlM0IppOn5GN1z1JxcYQ3oLj0/kHKZMU/QRXZ5Eo9oTZKYsSfP4ysfCHun3HtIVtpOtrLcWqghUAGwzd7lmN/l70NyQY8r7GnfFh3A9/Ptl0ujcjEb/ebI9pEFy0ICw5yUrr+JJ8aApfXjhq3yG5BojZOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(316002)(110136005)(66476007)(38100700002)(52536014)(122000001)(41300700001)(8936002)(5660300002)(76116006)(8676002)(66946007)(64756008)(66556008)(4326008)(66446008)(478600001)(86362001)(54906003)(7696005)(26005)(55016003)(33656002)(186003)(9686003)(71200400001)(6506007)(53546011)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2xKdWZDT2UrV0Fpc045cWVUS213VUVZbWlTSWt2MzVhYkhEdTQweXBvcFNv?=
 =?utf-8?B?UTExL1poR3RjaFNGcVhyRXBaZGt4NHlxRXFZRVE2UlRpK3NWR0xCRVVRejdS?=
 =?utf-8?B?QUkxbWJNTEJMR0R6K3k3aEI5QzJQRDExRjd5aU4wWVg3V2QyR29uRVlBVlJw?=
 =?utf-8?B?ZDBYTDM1dE5JdStJeFlZenB2Q3V2UktvRTlDNkIwbUljRFIrcElsR2RheDZZ?=
 =?utf-8?B?ZlJtUFl5RkloZVVLNkJnL0tJS1hEVW1Ja0d5bU5zRnAxbURJVURKRUlzbFp5?=
 =?utf-8?B?RVh3RjJXbzkycUQrNytDZmtURDhINjdBM0FkK1VUcVAyakVCL3dRZkQ0bnFh?=
 =?utf-8?B?L1hna0FrQVowTzF4eEo1Z1BQK3N4MklHZml2cHlUYk1qR1pudklnNGRobDVa?=
 =?utf-8?B?ekVVMGV1V1psa2xocWFvSXlXQzI4Ym5NckJSZHorWXZnMW9JRFRiMzFVaGRw?=
 =?utf-8?B?aEVwWEh0Qy9ydWQyNXBMek9vSEd0dzNhcDduc1E5R2JCNklxc1dUWjNuRTNo?=
 =?utf-8?B?ZFJHN2VkSkJEM01CV3MzeDZSaFlZVlFWR3QxOEx4ZVM1S2hEWjZ5ai9WZElH?=
 =?utf-8?B?dVc5MkVIc0VGSjBEUndFU0M0N0JpRVFleGJuTlpiRVZpUURweGlTYlhWdnRM?=
 =?utf-8?B?eFFkV0ZwMU9Fek1xci9SY1IwZXNBYjFlUFVteStRMjNQa3pETExYWmV6akl4?=
 =?utf-8?B?MEhaZ0lsVDgvd0ZOa1Y3Q2RkZmpPcTQ4b2szK1FPWlV2dm9BOG5ZS3ZhUDE1?=
 =?utf-8?B?MTdBNVB2ckxuVkdoS05majBVTEFUdFVTQ3dMcVFzN1JtQzB5UUZGSnVWeS82?=
 =?utf-8?B?M0I4dkpJbVd5TkRzdm5LVEpQdlBlQVFha0xHNW9peFFxTnpIMkJ2Ny83L2dR?=
 =?utf-8?B?TWJPaUI4eFZ6ZnZUTUZiVDJhWFRYTWg1S0xRTXJQWDJ6Sk1NeFNiMVdUdi8z?=
 =?utf-8?B?aEg2c093WE1pcDhiVk03TkJJVHUxNm5BT0p1TjJJa2Z6WVJkVDl5T0xEWkFm?=
 =?utf-8?B?eEw2R0lnWndCSFBpZXFGRm0vWmthTnZhWHdDbTlwdjVDem5Bc0VsNFFIMXhk?=
 =?utf-8?B?blF3OW12aXdyZ213MkNWUDg4dm8vK3ZEamwvcDVyQ0RQeGlpMUw1VHN4UXZU?=
 =?utf-8?B?VnJSTGlvS0VxdzdqUzNtR3lJVGZkQnZrNWFXS3A3bWROWWdMVVFKMkFjejN4?=
 =?utf-8?B?dzZCWHBEM3dGS29raVU3TTlwc2lFYVJ2TGpWb1RWaWVoTlFwbGN1SGV0YTJS?=
 =?utf-8?B?VFVmbldOa1dsL1Mzdnd6YVljZEwwOWpqLzdveW1SUDZXbm51YVRubHdSdzhk?=
 =?utf-8?B?U3RFZXd5RFBPcDUyNmUyVWIzcVc4Z0w3T044c3JsMzlTeTdmS1BTWkV3U2hM?=
 =?utf-8?B?Tjg4Y2pUQ3BRSmdZSjRheEt2SEZBZlFYczIvelVqd2RReklJL1VBcW1WamJm?=
 =?utf-8?B?R3Q1RHgySWQveElEUmZrUVI4VW81UlJseFoxcWM0T3R5T05NVWdsRmJ3TTZR?=
 =?utf-8?B?elVWL0h5VUhYZFVNN1R1OTRSR3VNTlBlcUdoWUFSZVZuQ1NRVlpuamtWdStE?=
 =?utf-8?B?QkcrNHRrZWJ6aitVSFJHUzh5SSthODNpa2MxZEtnSWxQRmx3SzVNSjlMbE8z?=
 =?utf-8?B?UjZuWURzUStQbG9sZUZtQjlHdDVzNDRTUi93b1MvUTFhQkJYNGdPMm9yRHVr?=
 =?utf-8?B?N3VqRzVEYXpSNTMzVzg3MjZhSDhMaDJCWm5rY1h2RzUyb2xJRk5ETEFtaXBM?=
 =?utf-8?B?QWFTQnhTQ0lSZWMrNVJHOUtCTVRYaGxTMHk0K0krQTAxN2VBLy9DVkplbDFo?=
 =?utf-8?B?WjVobkFMeHI1bmsvOHE4RGdETEhFbk9Vbjh6YnZmdVRxemsxUEUzeldNSEhk?=
 =?utf-8?B?UGhRMHJaMDRqQ09FRGpLd3did09YMU5XUmJWa1dmalJIV1pqcGUrb3lweGlR?=
 =?utf-8?B?Ukp6WjR5V3VWZXg1a2J0c2M2S3B4NWtNblUxR0FpQnZuY1ZZMzNuSVFObnNt?=
 =?utf-8?B?cjJ6V1E2OHZlN0ZCOHBtclNzWDd2UEtNZmlnSitWZ2cyekF3d1RCK1pHSXl0?=
 =?utf-8?B?clJzeHJsMkNpa3Z3UnVaN2xMbTV6SFRoSTNhU2t5OEZ1dlFKRGtUdFZXVDhW?=
 =?utf-8?Q?qgD6zNua+aBRAdSoMqXKuCVJi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f27af20-4ed0-44e1-1e3b-08dae252b7e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 06:23:32.6425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBU87b8YN0ezXU2aku/sFA2FfIcsnaxKZXpSgs8UudrmqKiWZnFxKN6tjI2jyoiJJz0EeZ0/Vm1d37UjjtOgSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689
X-Proofpoint-GUID: 6cqhXNxO3TZOonTDOxDPqeQhQPUWje0x
X-Proofpoint-ORIG-GUID: 6cqhXNxO3TZOonTDOxDPqeQhQPUWje0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=677 impostorscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200053
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSm9uYXRob24sDQoNCkp1c3Qgb25lIGV4YW1wbGUuIFRYRklGT0VNUFRZIGludGVycnVwdCBj
YW4gYmUgYXNzZXJ0ZWQgaW4gYm90aCBtb2RlczoNClNsYXZlIGFuZCBETUEsIGJ1dCB0aGlzIGlu
dGVycnVwdCBoYW5kbGluZyByZXF1aXJlZCBmb3IgU2xhdmUgbW9kZSBvbmx5DQphbmQgc2hvdWxk
IGJlIGlnbm9yZWQgZm9yIERNQSBtb2Rlcy4NClRoaXMgaXMgd2h5IHRoaXMgaW50ZXJydXB0IG1h
c2tlZCBmb3IgRE1BIGFuZCB1bm1hc2tlZCBmb3IgU2xhdmUgbW9kZS4NCg0KVGhhbmtzLA0KTWlu
YXMNCg0KDQpPbiAxMi8xOS8yMDIyIDg6MTUgUE0sIEpvbmF0aG9uIFJlaW5oYXJ0IDxqcnJlaW5o
YXJ0QGdvb2dsZS5jb20+IHdyb3RlOg0KPkZyb206IEpvbmF0aG9uIFJlaW5oYXJ0IDxqcnJlaW5o
YXJ0QGdvb2dsZS5jb20+DQo+U2VudDogTW9uZGF5LCBEZWNlbWJlciAxOSwgMjAyMiA4OjE1IFBN
DQo+VG86IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj5DYzogVmFyZGFuIE1pa2F5ZWx5YW4g
PG12YXJkYW5Ac3lub3BzeXMuY29tPjsgSm9obiBLZWVwaW5nDQo+PGpvaG5AbWV0YW5hdGUuY29t
PjsgSm9obiBZb3VuIDxqb2hueW91bkBzeW5vcHN5cy5jb20+OyBGZWxpcGUgQmFsYmkNCj48ZmVs
aXBlLmJhbGJpQGxpbnV4LmludGVsLmNvbT4NCj5TdWJqZWN0OiBkd2MyOiBBcHBsaWNhdGlvbiBv
ZiBESUVQTVNLIHdoZW4gcmVhZGluZyBESUVQSU5UDQo+DQo+SGVsbG8sDQo+DQo+MzI2MDE1ODg3
YjZhOiB1c2I6IGR3YzI6IGdhZGdldDogQWRkIGR3YzJfZ2FkZ2V0X3JlYWRfZXBfaW50ZXJydXB0
cyBmdW5jdGlvbg0KPg0KPlByaW9yIHRvIHRoaXMgY29tbWl0LCB0aGUgRElFUElOVCAvIERPRVBJ
TlQgaW50ZXJydXB0IHN0YXR1cyByZWdpc3RlcnMgd2VyZQ0KPmRpcmVjdGx5IHJlYWQgYW5kIHdy
aXR0ZW4tYmFjayB0byBjbGVhci4gQnV0IGFmdGVyIHRoaXMgY29tbWl0LCB0aGUgcmVnaXN0ZXIN
Cj52YWx1ZSBpcyBtYXNrZWQgd2l0aCBESUVQTVNLIC8gRE9FUE1TSyBwcmlvciB0byBjbGVhcmlu
ZyBvciBiZWluZyByZXR1cm5lZA0KPnRvIGFjdCB1cG9uLg0KPg0KPkNhbiBhbnlvbmUgZXhwbGFp
biB0aGUgcHVycG9zZSBvZiB0aGlzIGNoYW5nZT8gSW4gd2hhdCBjYXNlIHdpbGwgdGhlICpJTlQN
Cj5yZWdpc3RlciBoYXZlIGJpdHMgc2V0IHdoaWNoIGFyZSBub3Qgc2V0IGluICpNU0sgKGFuZCB3
aWxsIGJlIHN1YnNlcXVlbnRseQ0KPmlnbm9yZWQpPyBXaHkgc2hvdWxkIHRob3NlIGJlIGlnbm9y
ZWQ/DQo+DQo+VGhhbmsgeW91LA0KPkpvbmF0aG9uIFJlaW5oYXJ0DQo=
