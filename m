Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B975B6479B4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 00:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiLHXTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 18:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiLHXTJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 18:19:09 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F589D89F
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 15:19:07 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8NBI3j010585;
        Thu, 8 Dec 2022 15:18:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=FxV0qBoVWpUFnNdPx1QVahQ1EL2DkWDHUo3hRMp3U1M=;
 b=I+yZAF9AEJUxOlF3figrap7mJr2LIKWNv00sKBYtS3bZx8PrSQYkAXjYSgODZhcxyzVP
 ILi2F7vqwtinK51cgV0bAovd5gTQgAq30G6JXFEpNF3heWMzYbmtHtU55K89PHYRU3RI
 rNeoRnUquu34j9MQjVB0zZpaSlyxme7WgnQP0ouqRNdGxqVay+fYM3jtSjbpCyq0pW8a
 JBNuiaRAHHwFu0IM2D6ESsvauJFO2RyFsRgUmJmOAN8r8IegM2lbdDNA/9BZ2DLHUhOu
 43NfbSuE/MooGWO8C6d5csFKum9AIOSaVsur10BbU3W+V41wg3jI+Ie+94Qd8uq4jbul sQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3m86kakpf5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Dec 2022 15:18:53 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 479E4C00B3;
        Thu,  8 Dec 2022 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1670541532; bh=FxV0qBoVWpUFnNdPx1QVahQ1EL2DkWDHUo3hRMp3U1M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YtqXVanskPF+kXuly/LK/B5KQraYQnq0N4hdaPqpzoRtmn9Klmq/1j9TDFVHABI/x
         QTK/Rrq5hWy5nVjmYcJMpqPXxZZHUNDhSZGIHd1ZPBv5nvBbAth8pzMQz7AMg91evC
         mKA8kYIohiXZVW4aX5AOkJhI7yrI9gkeUF17al9SR6L/vclGpADYWrYuf6goxjODK1
         pkNV6O5WF1zK5sr5P6eyzLkKu/ZchWQs7sZ6OI2amOIX9mTIGuuSNHDT1Tl3//QjuQ
         4p2km5bDbIHikFzzvFuZHaPF4Iyo50Wx2gFEZqCzBcbmbvA2hZY4ACdZjo8ofNg3i6
         l+0Wi9bC2R9Fw==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 89E2BA0062;
        Thu,  8 Dec 2022 23:18:51 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 42545A0089;
        Thu,  8 Dec 2022 23:18:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="n0nPLhSx";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9WzUS3qwwWLbm+1clmwBR8aUqG6xm/tHGajrdg7+K/yI5/SSzv0EARCYBciZvDVe1Zgww0wjbOzrTZs6Ebee1UpBFCuQAIg6TI5wfG/6Zbxl5RAcFoJ0Rw4O9p7OIOL8q8ZDMNm/e7i/0R/0uYhWhta5W7qnmgbtkyiWBvgaFfFW3UKiO4bsOW+FsRqhRcrKJFJPGMu6oEKv16+w3eOLWtX9yXXHIt4bMf50pd93sEwomb6O3pXI/JTA3i8bPO+//35duJoHA+komJ21QmuB2uprLRdyjNK4EviORwdP3Qgtz05kT7BHgUWRsEAVNVWePeNju9pxwIVkooNGgwzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxV0qBoVWpUFnNdPx1QVahQ1EL2DkWDHUo3hRMp3U1M=;
 b=XaN9GGCfYRzkbPQ2Qbud4SCyeJQ0fsqhpp4Nm0eaDGVMgtEa0WqGpgP0Fbd1kRaGmVoLy4uNoTowo5XhzBCcqjjNdzeNz3O5fqQdNsIHiQ67nfkDjnmI7LNqSwRJ/CoIFgY1s1B6LtRCKDlnr7Qj9qrcVWyHvhVPlxPDEopzWdiLKkyLAWU7cgnoiposPPTRrqPTTa0edKDw2Mg7QgsVScl5xis6fyLC7nusDOdij7HKpz6FVgZZarm0eBMIPWwKgitu+xthSeFDiyLVcMLIq3J/rxese/WppEXamD+k90U/56RtB//8pS+pxprrg9L3L4Qhc11GGTW/8RYc5I05TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxV0qBoVWpUFnNdPx1QVahQ1EL2DkWDHUo3hRMp3U1M=;
 b=n0nPLhSxDk9YdAVBmGqYXLIaRm0XPeqtuG58u/gHCKGkqFcoqw2f39THQl5ZmaKh9NnGUb0dM9FHiLWD7bz8enQjuLamF3yv1taf24KAi9e2XBaku1UhFPUfNCZvYhAxAQbF2jztlmZkeEyurpW9xoUQ6Ka/uX3liGtEleqZ1AA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 23:18:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 23:18:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: dwc3 38100000.usb: No resource for ep1in
Thread-Topic: dwc3 38100000.usb: No resource for ep1in
Thread-Index: AQHZCkg1Gzqyg8qb6EqnMIaYqEus0q5jgyeAgAAawQCAAQRSAA==
Date:   Thu, 8 Dec 2022 23:18:46 +0000
Message-ID: <20221208231836.jbe64o3yk4bv4tpa@synopsys.com>
References: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
 <87a63ymnlw.fsf@balbi.sh>
 <f7196abb-d92e-ab47-6c7e-bea686f402c4@ideasonboard.com>
In-Reply-To: <f7196abb-d92e-ab47-6c7e-bea686f402c4@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA0PR12MB8228:EE_
x-ms-office365-filtering-correlation-id: e49898b3-fe7e-4a90-275d-08dad9728e94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FO9R6m45FcqG6URKjWUnMcs1T1+BFLw0Y0Lrus8o8BXb0rOQ/qVXB6rlktpQB2DdM2l8rJ4+8mcWfEvFUbNPL4zJQxEjT5wGEdY16Rp5lqARSazIpusqKWCSuj2s4BAKaB1haP2BkPcVwVaxe0eZMIpSSJ/6hxP39dKuWGhqiiboCV2x2LwF/Rx4Rdk1wM1EUYChCy66VpDQadwKj3rINld7FYKb6k2vp4eabn4YXMO5L7UoH0Lbm75SgDFfxx6MrgSZd5DflBtwpFOIngtpQkogCOvkL03gC9ZIOzqbDIFygh/DXv/ZfjtSukDWkNdpC0IYL5sEQ1TQfjQEKWgSlnreXTRbfftwYvhr80PppDalQ0ONHhp0LTXOHPS0krMZ/9UUbxfL6mHSfLDPoEEvo3oa6AeEa3EZR0OOkQYGpa4gMslPdW/jR7ggknZBVY4ATsmr8WX/LLoTS2wfxll4lVySOhsCGiXXQaoHHX6V92JVuXg+1kfOSh3E6BCJQoHtUH9EvrxPXyD1ckH+VHQVbCQt1UPxbYz8E6VVK88mK34NETFskjGNoyoKqQmZK5VFcepfwQiwsxoWOI2tiO+U8HYMLqP3TwyugWynbuLPhdEXtsSuZlHH8EyarITnqpcysCBwDwQP9gkKzJ06yg6iznOcqVL50zTQq/OVwHbzSz563OyESpA2H+yyqJqcmVCMosoTMLywVWy+yDNCZAZQG/fN3BlnOH18meIS2bSxWPpT4QxtA6p3FY9yTYtEogdw79JuP0Ai/WbrtPQ/FJBqIqVgthJdR2l256uKFH+CaYs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(71200400001)(122000001)(478600001)(83380400001)(8936002)(86362001)(2906002)(38100700002)(38070700005)(5660300002)(4326008)(41300700001)(966005)(1076003)(64756008)(8676002)(53546011)(66476007)(26005)(6512007)(186003)(6506007)(66556008)(6916009)(45080400002)(2616005)(66946007)(66446008)(316002)(76116006)(6486002)(54906003)(36756003)(32563001)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk45Zm1COTJZaGFNL3NpS2RtM0l4emdZL0FFVXRWNnE5aGdjV0xuZmFnb3Nl?=
 =?utf-8?B?R2l0K2NJRDY4L2crWitXKzZMRmJGb0h6bmZvbzJjRnJKL1BRenhPaXJkZFNl?=
 =?utf-8?B?TEVJT0ZscFAxemV4aHZZajl1VHlWSUZBcEJYZTU0cXcvTTZCUTU2NnJ6MXYy?=
 =?utf-8?B?eDIxTXdsMGZvR01lOVdDTldBUFp0OTJZYTlrTjZVY3JERlNKNEZBQ2RGeUtn?=
 =?utf-8?B?Wm1XWnBtSHBkcHdOeU9IbmtEdS9jbVkxSEh6UldWSk83TkhxbWEySmFUTnB1?=
 =?utf-8?B?V2FSZk1rSDBJcnY3aDNiWjEwL1lPYm1hcjM4d1dHcUJmMnVqMFNOVFZHMnZ0?=
 =?utf-8?B?a2dlUElNYnZ5bjdiWGJwNWo1cmFGbFJqYmo1Qk5HQXpIY1lQUUV5UU5WeStk?=
 =?utf-8?B?NDFZN0d0WWhtbldVTTNyWjY3S1VyeDFZY3AwZVpGWkRWMFlCMS8zYU9sWnlN?=
 =?utf-8?B?ZEQvU2lQSXlvN1V4UExyVm1jbHordkhjM0VlTlZYcWU3QjkvQkp5ZHBTUGZt?=
 =?utf-8?B?blYwY1ZRcUUxVmtHV3hqQUg3bmF6c0doblluNzQ3YVg2R0tGTGpZcS9VN0o0?=
 =?utf-8?B?QUpBSzVDK1BlZW9YMzJ2dHNld2R3NzFZVXRBV3ZMK1BlVGx4b1RSZ3g5WXZq?=
 =?utf-8?B?b3pFeUV4R05pTjcxMjhDamxHUkNhdXlEaWdZQmNwOTBMQWJJekdlK3NVQk5R?=
 =?utf-8?B?R2xsTWJGL3BiQ0o1cTRpNmpldk5FbnNlZTdWWkloSkdhYUtWUWFvS1hBRTFE?=
 =?utf-8?B?aXFqdjkrL0lHMXlPSlVwdmR6U1pBMVhmVnY0TmVKanNRdVNZMStoVXVXRXpo?=
 =?utf-8?B?UEdxNnV6STNGK3JzcGFjRVEyOTlFdlpGOGNHUkc2KzVuaHNpRVIrdmdaTGIr?=
 =?utf-8?B?U2JtQUJDUGMvbnVlVGVJV0dJY1NkMWpBSEFyUU1lVEVhbkZ3TDM5MGpoWVQz?=
 =?utf-8?B?b2h4Rkw1YTlvakZOZ0ZNVnJiQVNXak8rK3A5U2ZGTkltdzlpRkdOVFc3NmZv?=
 =?utf-8?B?TnlvYUxrMklyU2FYbm9Ka1JmVk9tZHplSVhRL2NLMnVGWUtFSEE0amVpRHJ1?=
 =?utf-8?B?SzRRSW9lUE5qV1VwaTJ3K0NVR0hKdXEwZGNmYWdUZ0w1QzFmamdzalNYejcv?=
 =?utf-8?B?WmorUVJDeDJVOFY0VDdWQWFSYkttMFcrNlVRM2tJQzhtcWZpcG9yclJURnox?=
 =?utf-8?B?Qm1zNXZpT3JrcE1nY1R2T2lCMWcvcUR0K2x5K0pwcnBLRnp5NlN0L2VSOTdE?=
 =?utf-8?B?MHNHWVI4c00zeEFGaUE1bWlQWkpQU2tQdnAwNEFNc1N5cVUzT2Y2aWpXanBq?=
 =?utf-8?B?SUNKZElMZVlxbjB6N0hBMkVYK3dvODdPTGQyamxpN0RQSkRzcWdLTW9KU0w1?=
 =?utf-8?B?TVYrdDVXTGU5MFgyS0dFZnhSeUN0NUZvMXgxcnJpVzVqR0c3TzJscWI4ZjFL?=
 =?utf-8?B?L0pWY3RCU1J4Y05pUFlwMHJmbEdOVXRsZEtjOUxVZGlEOGZ3VDJFb0dFWExr?=
 =?utf-8?B?S0ZtRERMNXpwYVhvY2Fjb3c4dlRoR1MwZVNWZzJ4VHlNT0NXbW9XVjIxclh1?=
 =?utf-8?B?ZGlRcmZPNkNhS3VwbDcyVm44Uk5ZWlh3SWpVZ2ttTDdrY1ljdStTUVZXcmds?=
 =?utf-8?B?K2huc2wxVFFqVzRMcEZsYVpGTFczbUhRL2Z0YyttSzg5MUwrWERYYWdUd2pN?=
 =?utf-8?B?SnlvbitVTWFkRXEwRnBjMDF5ZU1hd0J1Y0dPWlM2YURNYUwwb3RHSTlpeTFB?=
 =?utf-8?B?MlQvUE1ZM1Jxek93NjEwTk9NOXN2bHgrRUNyS0t5RU9XNThDamhUdkVIYjhB?=
 =?utf-8?B?NSt1WW93REdQWHpXY2ZIeEJ0RlZHbjFIVG96UlZHZmJFcml4U2xuZEhKc3cy?=
 =?utf-8?B?MUduMUJ2MWVsUWlsV0F4MHdneGdCYjNLMmdIMnpaTUNwM3ZORWtxZ0lDbXZi?=
 =?utf-8?B?bXlmRkpSandSaVJReGdaK29wbFVzeE4zM2NHMVJFM3NINjc5MzVoYy9YckJi?=
 =?utf-8?B?STA1cFJrclVzdkZ0eEtuVlhTY1gzRFlFTGVZd0RCWFJZWDN2R3U0OFJMTGlM?=
 =?utf-8?B?WUtZYWJVR1BiWUpValViUDgxVGlIWlZJZ0ZiT2xOcTF5K1IvZlczdEFzSFBr?=
 =?utf-8?Q?jRWzjwO2o8HnBsE+mhWi/Lirl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31D436D51ED7274DBCE70E863EB0506F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49898b3-fe7e-4a90-275d-08dad9728e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 23:18:46.7607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BAc2IxeLsnl4WrYlbaCDLNtIAIRKg122/oE57T2i7K5Wj2tE/xPi0nB6kTwBnoPvuK7/hHm7kFbtLPu8DQxakg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228
X-Proofpoint-ORIG-GUID: ouCgoGm11XwJgXnzyF2JpB0gQF5uxBwe
X-Proofpoint-GUID: ouCgoGm11XwJgXnzyF2JpB0gQF5uxBwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_12,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=771 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212080192
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRGFuLA0KDQpPbiBUaHUsIERlYyAwOCwgMjAyMiwgRGFuIFNjYWxseSB3cm90ZToNCj4gR29v
ZCBtb3JuaW5nDQo+IA0KPiBPbiAwOC8xMi8yMDIyIDA2OjExLCBGZWxpcGUgQmFsYmkgd3JvdGU6
DQo+ID4gSGksDQo+ID4gDQo+ID4gRGFuIFNjYWxseSA8ZGFuLnNjYWxseUBpZGVhc29uYm9hcmQu
Y29tPiB3cml0ZXM6DQo+ID4gPiBJJ20gaGF2aW5nIGFuIGlzc3VlIHdpdGggRFdDMyB3aGljaCBJ
J20gaG9waW5nIHlvdSBtaWdodCBiZSBhYmxlIHRvIHNoZWQNCj4gPiA+IGxpZ2h0IG9uLiBJJ20g
dXNpbmcgdGhlIFVWQyBnYWRnZXQgZnVuY3Rpb24gdG8gc3RyZWFtIHZpZGVvIGZyb20gYW4NCj4g
PiA+IGlteDhtcCBwbGF0Zm9ybSwgd2hpY2ggd29ya3MganVzdCBmaW5lLiBPbmNlIEkgaGF2ZSBz
dG9wcGVkIHN0cmVhbWluZw0KPiA+ID4gaG93ZXZlciBhbmQgYWZ0ZXIgc29tZSB0aW1lIGhhcyBw
YXNzZWQgKHRoZSBleGFjdCBkdXJhdGlvbiBzZWVtcyB0byB2YXJ5DQo+ID4gPiBxdWl0ZSBhIGxv
dCBmcm9tIDEtMiBtaW51dGVzIHRvIDE1KyBtaW5zKSBJIGdldCBhIGtlcm5lbCB3YXJuaW5nIGxp
a2Ugc286DQo+ID4gQXMgR3JlZyBtZW50aW9uZWQsIHBsZWFzZSBhZGQgVGhpbmgsIHRoZSBuZXcg
bWFpbnRhaW5lciwgdG8gdGhlIGxvb3AuDQo+IA0KPiANCj4gQXBvbG9naWVzIHRvIGJvdGggb2Yg
eW91OyBmb3Igc29tZSByZWFzb24gSSB0aG91Z2h0IHlvdSBoYWQgdGFrZW4gb3ZlciBmcm9tDQo+
IFRoaW5oIHJhdGhlciB0aGFuIHRoZSBvdGhlciB3YXkgYXJvdW5kLiBUaGFua3MgZm9yIHRoZSBo
ZWFkcyB1cCBHcmVnLg0KPiANCj4gPiANCj4gPiA+IFsgwqA3MzcuOTk2ODQyXSBjb25maWdmcy1n
YWRnZXQgZ2FkZ2V0LjA6IHV2YzogdXZjX2Z1bmN0aW9uX2Rpc2FibGUoKQ0KPiA+ID4gWyDCoDcz
OC41MTk1ODJdIGNvbmZpZ2ZzLWdhZGdldCBnYWRnZXQuMDogdXZjOiB1dmNfZnVuY3Rpb25fc2V0
X2FsdCgwLCAwKQ0KPiA+ID4gWyDCoDczOC41MjYwNjBdIGNvbmZpZ2ZzLWdhZGdldCBnYWRnZXQu
MDogdXZjOiByZXNldCBVVkMgaW50ZXJydXB0IGVuZHBvaW50DQo+ID4gPiBbIMKgNzM4LjUzMjcx
M10gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+ID4gPiBbIMKgNzM4LjUz
NzY4M10gZHdjMyAzODEwMDAwMC51c2I6IE5vIHJlc291cmNlIGZvciBlcDFpbg0KPiA+ID4gWyDC
oDczOC41NDI3MTJdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDY0NSBhdCBkcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jOjM4NA0KPiA+ID4gZHdjM19zZW5kX2dhZGdldF9lcF9jbWQrMHg0NzgvMHg1ODAN
Cj4gPiA+IFsgwqA3MzguNTUyMzE0XSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gPiA+IFsgwqA3Mzgu
NTU1NDAyXSBDUFU6IDAgUElEOiA2NDUgQ29tbTogaXJxLzIwOC1kd2MzIE5vdCB0YWludGVkDQo+
ID4gPiA1LjE5LjAtMDAwMzQtZ2YwMTdjZTk0M2IzMiAjODINCj4gPiA+IFsgwqA3MzguNTYzNjAx
XSBIYXJkd2FyZSBuYW1lOiBQb2x5aGV4IERlYml4IE1vZGVsIEEgaS5NWDhNUGx1cyBib2FyZCAo
RFQpDQo+ID4gPiBbIMKgNzM4LjU3MDE0NV0gcHN0YXRlOiA2MDAwMDBjNSAoblpDdiBkYUlGIC1Q
QU4gLVVBTyAtVENPIC1ESVQgLVNTQlMNCj4gPiA+IEJUWVBFPS0tKQ0KPiA+ID4gWyDCoDczOC41
NzcxMjhdIHBjIDogZHdjM19zZW5kX2dhZGdldF9lcF9jbWQrMHg0NzgvMHg1ODANCj4gPiA+IFsg
wqA3MzguNTgyMTE2XSBsciA6IGR3YzNfc2VuZF9nYWRnZXRfZXBfY21kKzB4NDc4LzB4NTgwDQo+
ID4gPiBbIMKgNzM4LjU4NzEwMl0gc3AgOiBmZmZmZmZjMDBjM2MzOWUwDQo+ID4gPiBbIMKgNzM4
LjU5MDQzM10geDI5OiBmZmZmZmZjMDBjM2MzOWUwIHgyODogMDAwMDAwMDAwMDAzMTAwNiB4Mjc6
DQo+ID4gPiAwMDAwMDAwMGZmZmZmZmVhDQo+ID4gPiBbIMKgNzM4LjU5NzYxOF0geDI2OiAwMDAw
MDAwMDAwMDAwMDA2IHgyNTogZmZmZmZmODAwNGYzMjg4MCB4MjQ6DQo+ID4gPiBmZmZmZmZjMDBj
M2MzYWJjDQo+ID4gPiBbIMKgNzM4LjYwNDgwMV0geDIzOiAwMDAwMDAwMDAwMDAwNDA2IHgyMjog
ZmZmZmZmZmZmZmZmM2YwMCB4MjE6DQo+ID4gPiBmZmZmZmZmZmZmZmYzZjBjDQo+ID4gPiBbIMKg
NzM4LjYxMTk4NF0geDIwOiBmZmZmZmY4MDAzODcyNjAwIHgxOTogMDAwMDAwMDAwMDAwMDAwMSB4
MTg6DQo+ID4gPiBmZmZmZmZmZmZmZmZmZmZmDQo+ID4gPiBbIMKgNzM4LjYxOTE2Nl0geDE3OiAw
MDAwMDAwMDAwMDAwMDFjIHgxNjogMDAwMDAwMDBjOTljNDJhNSB4MTU6DQo+ID4gPiBmZmZmZmZj
MDhjM2MzNmI3DQo+ID4gPiBbIMKgNzM4LjYyNjM0N10geDE0OiAwMDAwMDAwMDAwMDAwMDAwIHgx
MzogNmU2OTMxNzA2NTIwNzI2ZiB4MTI6DQo+ID4gPiA2NjIwNjU2MzcyNzU2ZjczDQo+ID4gPiBb
IMKgNzM4LjYzMzUyOF0geDExOiAwMDAwMDAwMDAwMGMwMmE3IHgxMDogZmZmZmZmYzAwOWFmMWFj
MCB4OSA6DQo+ID4gPiBmZmZmZmZjMDA4MGM0MmJjDQo+ID4gPiBbIMKgNzM4LjY0MDcxMF0geDgg
OiAwMDAwMDAwMGZmZmZlZmZmIHg3IDogZmZmZmZmYzAwOWFmMWFjMCB4NiA6DQo+ID4gPiAwMDAw
MDAwMDAwMDAwMDAwDQo+ID4gPiBbIMKgNzM4LjY0Nzg5MV0geDUgOiBmZmZmZmY4MDdmYjJlYjA4
IHg0IDogMDAwMDAwMDAwMDAwMDAwMCB4MyA6DQo+ID4gPiAwMDAwMDAwMDAwMDAwMDI3DQo+ID4g
PiBbIMKgNzM4LjY1NTA3Ml0geDIgOiAwMDAwMDAwMDAwMDAwMDAwIHgxIDogMDAwMDAwMDAwMDAw
MDAwMCB4MCA6DQo+ID4gPiBmZmZmZmY4MDE1OGE4MDAwDQo+ID4gPiBbIMKgNzM4LjY2MjI1NV0g
Q2FsbCB0cmFjZToNCj4gPiA+IFsgwqA3MzguNjY0NzIxXSDCoGR3YzNfc2VuZF9nYWRnZXRfZXBf
Y21kKzB4NDc4LzB4NTgwDQo+ID4gPiBbIMKgNzM4LjY2OTM2Ml0gwqBfX2R3YzNfZ2FkZ2V0X2Vw
X2VuYWJsZSsweDRmNC8weDcxNA0KPiA+ID4gWyDCoDczOC42NzQwMDRdIMKgZHdjM19nYWRnZXRf
ZXBfZW5hYmxlKzB4NmMvMHgxNWMNCj4gPiA+IFsgwqA3MzguNjc4MzgyXSDCoHVzYl9lcF9lbmFi
bGUrMHg0Yy8weDFiYw0KPiA+ID4gWyDCoDczOC42ODIwNjddIMKgdXZjX2Z1bmN0aW9uX3NldF9h
bHQrMHhjYy8weDI2NA0KPiA+ID4gWyDCoDczOC42ODYzNjJdIMKgY29tcG9zaXRlX3NldHVwKzB4
N2VjLzB4MTk1Yw0KPiA+ID4gWyDCoDczOC42OTAzOTVdIMKgY29uZmlnZnNfY29tcG9zaXRlX3Nl
dHVwKzB4OTAvMHhjMA0KPiA+ID4gWyDCoDczOC42OTQ5NTBdIMKgZHdjM19lcDBfaW50ZXJydXB0
KzB4ODM0LzB4OWUwDQo+ID4gPiBbIMKgNzM4LjY5OTE1Nl0gwqBkd2MzX3RocmVhZF9pbnRlcnJ1
cHQrMHg5OTQvMHhkNzANCj4gPiA+IFsgwqA3MzguNzAzNjI0XSDCoGlycV90aHJlYWRfZm4rMHgz
OC8weGE0DQo+ID4gPiBbIMKgNzM4LjcwNzIyMV0gwqBpcnFfdGhyZWFkKzB4MTg0LzB4MjMwDQo+
ID4gPiBbIMKgNzM4LjcxMDczM10gwqBrdGhyZWFkKzB4MTE4LzB4MTIwDQo+ID4gPiBbIMKgNzM4
LjcxMzk4MV0gwqByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KPiA+ID4gWyDCoDczOC43MTc1ODJd
IGlycSBldmVudCBzdGFtcDogNDEwMjENCj4gPiA+IFsgwqA3MzguNzIwOTk4XSBoYXJkaXJxcyBs
YXN0IMKgZW5hYmxlZCBhdCAoNDEwMTkpOiBbPGZmZmZmZmMwMDgwODI4NTg+XQ0KPiA+ID4gZmlu
aXNoX3Rhc2tfc3dpdGNoLmlzcmEuMCsweGU4LzB4MjY0DQo+ID4gPiBbIMKgNzM4LjczMDUwMV0g
aGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoNDEwMjEpOiBbPGZmZmZmZmMwMDhmMTUwNTg+XQ0K
PiA+ID4gX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSsweGM0LzB4MTcwDQo+ID4gPiBbIMKgNzM4Ljcz
OTc0N10gc29mdGlycXMgbGFzdCDCoGVuYWJsZWQgYXQgKDQxMDE0KTogWzxmZmZmZmZjMDA4YTI1
YjkwPl0NCj4gPiA+IGR3YzNfdGhyZWFkX2ludGVycnVwdCsweDFjMC8weGQ3MA0KPiA+ID4gWyDC
oDczOC43NDg5ODhdIHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDQxMDIwKTogWzxmZmZmZmZj
MDA4YTI1OWRjPl0NCj4gPiA+IGR3YzNfdGhyZWFkX2ludGVycnVwdCsweGMvMHhkNzANCj4gPiA+
IA0KPiA+ID4gDQo+ID4gPiBlcDFpbiBpbiB0aGlzIGluc3RhbmNlIHJlZmVycyB0byBhIFN0YXR1
cyBJbnRlcnJ1cHQgRW5kcG9pbnQgdW5kZXIgdGhlDQo+ID4gPiBVVkMgc3BlY2lmaWNhdGlvbiwg
d2hpY2ggaXMgYmVpbmcgInJlc2V0IiBieSB1dmNfZnVuY3Rpb25fc2V0X2FsdCgpDQo+ID4gPiBh
Z2FpbnN0IHRoZSBWaWRlb0NvbnRyb2wgaW50ZXJmYWNlIChtZWFuaW5nIGEgY2FsbCB0byB1c2Jf
ZXBfZGlzYWJsZSgpDQo+ID4gPiBmb2xsb3dlZCBieSB1c2JfZXBfZW5hYmxlKCksIHNlZSBbMV0p
LiBUaGUgaXNvY2hyb25vdXMgZW5kcG9pbnQgdGhhdA0KPiA+ID4gZGF0YSBpcyBzdHJlYW1lZCBh
Y3Jvc3MgaXMgdHJlYXRlZCBzaW1pbGFybHkgaW4gdGhlIHNhbWUgZnVuY3Rpb24gKHdoZW4NCj4g
PiA+IGNhbGxlZCBmb3IgdGhlIFZpZGVvU3RyZWFtaW5nIGludGVyZmFjZSkgYW5kIG5ldmVyIHNl
ZW1zIHRvIHNob3cgdGhlDQo+ID4gPiBzYW1lIHdhcm5pbmcgYW5kIGFzIGZhciBhcyBJIGNhbiB0
ZWxsIHRoZSBvcGVyYXRpb24gb3VnaHQgdG8gYmUgc2FmZSwgc28NCj4gPiA+IEknbSBzdHJ1Z2ds
aW5nIHRvIHNlZSBhbnl0aGluZyBpbiB0aGUgZl91dmMgY29kZSB0aGF0J3MgbWlzYmVoYXZpbmcg
dG8NCj4gPiA+IGNhdXNlIHRoZSBwcm9ibGVtLiBJIHdvbmRlcmVkIGlmIHlvdSBtaWdodCBiZSBh
YmxlIHRvIHRha2UgYSBsb29rIGF0IHRoZQ0KPiA+ID4gdHJhY2UgYW5kIHJlZ2R1bXAgb2YgdGhl
IGR3YzMgKHdoaWNoIHdhcyB0YWtlbiBpbW1lZGlhdGVseSBhZnRlciB0aGUNCj4gPiA+IHdhcm5p
bmcgaXMgdGhyb3duKSBhbmQgc2VlIGlmIHRoYXQgc2hlZHMgYW55IGxpZ2h0IG9uIHdoYXQgbWln
aHQgYmUNCj4gPiA+IGdvaW5nIG9uPw0KPiA+IEJlc3Qgd2F5IGZvcndhcmQgaXMgdG8gY29sbGVj
dCBkd2MzIHRyYWNlIHBvaW50cywgc28gd2UgY2FuIHNlZSB3aGF0IHRoZQ0KPiA+IEhXIGlzIGRv
aW5nLiBGb3IgZGV0YWlscywgc2VlIFsxXS4NCj4gPiANCj4gPiBbMV0gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8va2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvZHJpdmVyLWFw
aS91c2IvZHdjMy5odG1sKnJlcG9ydGluZy1idWdzX187SXchIUE0RjJSOUdfcGchWmI1Q3g3cjNN
Y0oyRkNiSF9vSzE0TXFJTnJ6b3I5U2lodnlBOXFGeHJsbXpVLWRfVmNCaFpZczJqVHBXTU5FOG94
aElIOFBNSWRrME5ocWo4eEJFbWtFd2U5SDYkDQo+IA0KPiANCj4gQm90aCB0aGUgdHJhY2UgYW5k
IHJlZ2R1bXAgc2hvdWxkIGJlIGluIHRoZSBhdHRhY2hlZCAudGFyLmd6DQo+IA0KPiA+IA0KDQpM
b29rcyBsaWtlIHdlJ3JlIG1pc3NpbmcgdGhlIGNoZWNrIHRvIGlnbm9yZSBkZWxheSBFbmQgVHJh
bnNmZXIuDQoNCkNhbiB5b3UgdHJ5IHRoaXMgdG8gc2VlIGlmIGl0IGZpeGVzIHlvdXIgaXNzdWU/
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KaW5kZXggZWJjMGUxNDdjYzcxLi42NTUwMDI0NjMyM2IgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jDQpAQCAtMjAwOCw2ICsyMDA4LDcgQEAgc3RhdGljIGludCBfX2R3YzNfc3RvcF9hY3Rp
dmVfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAgKmRlcCwgYm9vbCBmb3JjZSwgYm9vbCBpbnQNCiAJ
ZWxzZSBpZiAoIXJldCkNCiAJCWRlcC0+ZmxhZ3MgfD0gRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVO
RElORzsNCiANCisJZGVwLT5mbGFncyAmPSB+RFdDM19FUF9ERUxBWV9TVE9QOw0KIAlyZXR1cm4g
cmV0Ow0KIH0NCiANCkBAIC00Mjc5LDggKzQyODAsMTAgQEAgdm9pZCBkd2MzX3N0b3BfYWN0aXZl
X3RyYW5zZmVyKHN0cnVjdCBkd2MzX2VwICpkZXAsIGJvb2wgZm9yY2UsDQogCSAgICBkd2MtPmhp
YmVyX3N0YXRlICE9IERXQzNfSElCRVJfRU5URVJJTkdfRElTQ09OTkVDVEVEKQ0KIAkJcmV0dXJu
Ow0KIA0KKwlpZiAoaW50ZXJydXB0ICYmIChkZXAtPmZsYWdzICYgRFdDM19FUF9ERUxBWV9TVE9Q
KSkNCisJCXJldHVybjsNCisNCiAJaWYgKCEoZGVwLT5mbGFncyAmIERXQzNfRVBfVFJBTlNGRVJf
U1RBUlRFRCkgfHwNCi0JICAgIChkZXAtPmZsYWdzICYgRFdDM19FUF9ERUxBWV9TVE9QKSB8fA0K
IAkgICAgKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX0VORF9UUkFOU0ZFUl9QRU5ESU5HKSkNCiAJCXJl
dHVybjsNCiANCg0KVGhhbmtzLA0KVGhpbmg=
