Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B2C6D8EA7
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 07:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbjDFFGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 01:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbjDFFGG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 01:06:06 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D7286A9
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 22:06:03 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3365539D010453;
        Wed, 5 Apr 2023 22:05:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=qUHaN9AeYsesaifBLK8pojWgWM7JwKbnQeGX7VKoKw0=;
 b=C/D96Yzk/WFaReGg3dnKGgUQ2JtbjnTaVDRX+srlG29jbYq1jUcetB+mS8mS6aLaQdnZ
 xv8ofjekOTvWyfa1HjhgIbIQfzCQwbF93fgldcMUxq4D3FlLj6wH/5Lup0VDNmAqGNXq
 pvbBgQ3XRVS7ddCEEmUwbARQLw4Icy1+sZTormNuKEd2BiJtfQQQaM8WIPlbGA0XpcWi
 52Tb3xII395GlRZ79jF4QpC3Uc2l9FeIY7DhLqNr9hq5pVE59YNpGPzHDXO7l2xFWG6i
 VsNea9g5+YZuh5YA289Xo3Rpq88ucnf/yWuFpmVCpNPdZ9PU8tIyIYf2ldddUEIxY0bY iw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkmrqvp6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Apr 2023 22:05:59 -0700
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BBC9C05B0;
        Thu,  6 Apr 2023 05:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680757558; bh=j9W9O/nNlypu4RvovqfG9Shy4S5ZTaGBbitw7d6Q2Fg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=i1Zs4IyIIUT/aKEJcLoBeWUZPjDXSsYayihky3nT4OcBVl4/5qi+46q6pArD39oWz
         hJNhbJfn9j3OVS1sWxVRq2Hspd5/jD2HGPGLuGN+SJBZzUgjHoUAKzP4ZhWIJ+d0iu
         ZpJ+DsAu028lfzgC5r2Yfm0g7K36Zmr5nsQZH2cxcmrsvfFPlpduTgL54MwWJPK01l
         xq2+SZBU1bEEIlZPymdBMobrRpM2xGKmTgNIF4tk8Gfr8Y8z5e+W4/xnBOyUmeGz3l
         zgFptTMACbOeLfDT4zAfigst0ZHU0oVstjerVt/qCYaCKrrcj6uht8IvEYmqWWCQZe
         NvmmZ5xQcnLiw==
Received: from o365relay-in.synopsys.com (unknown [10.4.161.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A37E7A0080;
        Thu,  6 Apr 2023 05:05:57 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8884180700;
        Thu,  6 Apr 2023 04:57:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iUNJ+9fX";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZhRNoLiyDX1eRdGjhV6b1GMvUW5Dsa+PWWAtpwfXHftxzxTd68y8yxrGrJaALZAXAb4WqZc/NFdBd5ITyrU6J3DBNs+U461MSXqqeJ6dON6rMH4Fnd4Pq3FiNjVXYwYViZvxgOHfCva3w2+VpORSoZLeQxFCM7/Cnbawc2uBaMKae1hHAJjCxCs0S7rsXXvBlHldc30nAtFwm+I9ze/rPe05Mv2Kair8FeSgAHmvOqRg8onR7iqtoVYvRZn+Fepa87inoQNJQKjW4wBifOIIPYoZeLltt1ogxAWCBp1Mrn/FRY5l1QbDHsrgHY/ua3z88jE9UoCfxPKJZnUNpg+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUHaN9AeYsesaifBLK8pojWgWM7JwKbnQeGX7VKoKw0=;
 b=SoalnWz6J6R7g97iuCqyfjodzoK4na0uhrOUlYCT2NKBA8meAe126FSZS1zP+n0UyOV1TQONnWrlo8iNJaO6oNwUp9k422uh5uBmZSx8a+gDH/ZAXxBAROosWJppRZ9Yyj0Hpwtog9eWCE3KE06aWa30FV3LSEnQgJkcDfwOKh1jDZTVWkg3FpNQVY5OiVkqLNao0jStVwU3sfFDrmRY3l1BU6HbwowIKIXo08Mc/NJA02YDEsY0imFggculACD1u6TCQhytqmM1CsFmYp5aKs/TC22HEmFoyIZXJGzGDwNmzwWLSlgjKQb78UwQ7/zkbr72UjgGBuGramSGatzQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUHaN9AeYsesaifBLK8pojWgWM7JwKbnQeGX7VKoKw0=;
 b=iUNJ+9fXeJEedJqtLDuP60Bnz2bFimlwa0ksl+NwTjE8lCa32uGcji0tiKLWeX1fsm/vwY6RK2WReQizmjfm34NbyV6qGTJPnBT4iAhB7dXHq565HpWpRHmpmCALE+M6QlE7DL8+WMtdmtxCW5A0DDCEJD1tmlx8qKrdbjJwQGQ=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 04:56:57 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::5af2:8180:bbe0:77a9]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::5af2:8180:bbe0:77a9%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 04:56:57 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     PALAK SHAH <palak.shah@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8lwFCGPXwACCHUYAAE8wZ4AAjH5gAABcrVVAAhfAYAAARNKXwABUtCIAAp8vQcACwBcaAABkFTnAAVp9FAAAZeARgAA2buwAAIr+94AU+unQAAAagqnA=
Date:   Thu, 6 Apr 2023 04:56:57 +0000
Message-ID: <BYAPR12MB33995212D56D06ECC0F4B3D2A7919@BYAPR12MB3399.namprd12.prod.outlook.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
 <HE1PR0601MB25868FC836C3CD2D07B342958DAB9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33990B69E647DC5128417573A7A89@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB25867DACFD232748FD194CEB8DAF9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339985F59077F180D10412D3A7AF9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586DB1CA3D0B4B45E7720A68DAF9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33993D83145BFE17DB53BF1CA7B39@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586C22FC9F24A7101E476728DB69@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB3399505268C0FE1AECDD9C8CA7B79@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586EC156A9A7AB4B268DC2E8DB49@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33998FFE1D1B011A18DD3A31A7B59@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586E21D0863851DC011BD3C8DB59@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33992177D65F76E4C2BA9516A7BA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <PAXPR06MB8531486338B7D2E4289324878D919@PAXPR06MB8531.eurprd06.prod.outlook.com>
In-Reply-To: <PAXPR06MB8531486338B7D2E4289324878D919@PAXPR06MB8531.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcaG1pbmFzXG?=
 =?iso-8859-1?Q?FwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0?=
 =?iso-8859-1?Q?YmEyOWUzNWJcbXNnc1xtc2ctNzMxNzAzNzMtZDQzNy0xMWVkLTlhMGEtYW?=
 =?iso-8859-1?Q?M5MWExODY0ZDc5XGFtZS10ZXN0XDczMTcwMzc0LWQ0MzctMTFlZC05YTBh?=
 =?iso-8859-1?Q?LWFjOTFhMTg2NGQ3OWJvZHkudHh0IiBzej0iMjEyMTYiIHQ9IjEzMzI1Mj?=
 =?iso-8859-1?Q?MwNjE0OTA5NzU1MiIgaD0ib0JMMzVqQ3U4cnFTTWo2Z1d2S0JHWW9FbWNN?=
 =?iso-8859-1?Q?PSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTk?=
 =?iso-8859-1?Q?NnVUFBSFlJQUFCUXdJUTFSR2paQVdsOFJoamx4RU1SYVh4R0dPWEVReEVO?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUhBQUFBQUdDQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUVBQVFBQkFBQUFGVmFXcEFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFKNEFBQUJtQUdrQWJnQmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2?=
 =?iso-8859-1?Q?tBYmdCbkFGOEFkd0JoQUhRQVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQU?=
 =?iso-8859-1?Q?FHWUFid0IxQUc0QVpBQnlBSGtBWHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1B?=
 =?iso-8859-1?Q?WHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFBQ2VBQUFBWmdCdkFI?=
 =?iso-8859-1?Q?VUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0JsQUhJQWN3QmZBSE1BWV?=
 =?iso-8859-1?Q?FCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhBZFFCdUFHUU?=
 =?iso-8859-1?Q?FjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QnRBR2tBWXdB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-rorf: true
x-dg-refone: =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0?=
 =?iso-8859-1?Q?FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFI?=
 =?iso-8859-1?Q?TUFYd0J6QUhRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFaZ0J2?=
 =?iso-8859-1?Q?QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxBSElBY3dCZkFIUU?=
 =?iso-8859-1?Q?Fjd0J0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFkUUJ1QU?=
 =?iso-8859-1?Q?dRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZFFCdEFHTUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR2NBZEFCekFGOEFjQUJ5QUc4?=
 =?iso-8859-1?Q?QVpBQjFBR01BZEFCZkFIUUFjZ0JoQUdrQWJnQnBBRzRBWndBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQ0FBQUFBQUNlQUFBQWN3QmhBR3dBWlFCekFGOEFZUUJqQUdNQW?=
 =?iso-8859-1?Q?J3QjFBRzRBZEFCZkFIQUFiQUJoQUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-reftwo: =?iso-8859-1?Q?QUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6QUdFQWJBQm?=
 =?iso-8859-1?Q?xBSE1BWHdCeEFIVUFid0IwQUdVQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFiZ0J3QUhNQVh3QnNB?=
 =?iso-8859-1?Q?R2tBWXdCbEFHNEFjd0JsQUY4QWRBQmxBSElBYlFCZkFERUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1?=
 =?iso-8859-1?Q?VBYmdCekFHVUFYd0IwQUdVQWNnQnRBRjhBY3dCMEFIVUFaQUJsQUc0QWRB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBSUFBQUFBQUo0QUFBQjJBR2NBWHdCckFHVUFlUUIzQUc4QWNnQmtBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFB?=
 =?iso-8859-1?Q?QUEiLz48L21ldGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|CY8PR12MB7145:EE_
x-ms-office365-filtering-correlation-id: a08f7aa4-a42c-44f9-4deb-08db365b5957
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: imbglFhySTKUXZinANqFFr1yyNlIg04u3kxHKLGxb2nGHaDXkXfLft6efoSwxHKyL2L+KHvhQtNokcNWWUxE+MTzLXiF9lIxxlu90StDMKzOlgDrp2ZIKeeqpoiKJ46TbIz1VBddWGpaQhh34xav5uzb7c94S7FHL/8n77mSK5gchMlRcNejrt7IXmnZakoPSBI6ODhlZGX7bZ13804ohu+gqDLhdweUmu570v+li68SOBLfwhZvvwlMQtUVEbVQZBMbGER2WBI+uiouc0z0W5MPkxQnpYq8OZe1J0X1OobIWZNsBEl4dixd/vtxH/mep2EV1Q3rh6OGqwUhbhTTcmfB6DfyVqlB0olMK3nNHW3xM+2xt1lxj3f2ofooWh/HHESXBzCyZJup19LwrVFJx1XGbr8DNqNBHCaQJji75CLeezN9P4mTk5ushOsSqkklM5M+Xd59eLQBpp5PLX4ND3HkP7zjcRT/2hNN+/+1I4ZFEAzcAJBoNG4px3VHJJg6ZUZYrGVLHBvHkYdFkY/KG3qjUJx+l+rr+ECqtQyiVWwmZ+QxnxN36Ek30CcKW0G4MPfLDlkvV8erJhruKO4oTWDxXiuPdH7Kg5s0+n4V/D+cmzOkXUvEo9b2tehCq24sLcmGkDwrXYsG2ScKEtqvZN3EQSiksFA0tjpniHyjx82/T13SxpeY2zWGLTxsevek
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(6916009)(66446008)(9686003)(66476007)(122000001)(76116006)(6506007)(26005)(186003)(8936002)(30864003)(52536014)(66574015)(33656002)(5660300002)(2906002)(55016003)(478600001)(45080400002)(38070700005)(8676002)(7696005)(66946007)(41300700001)(4326008)(64756008)(66556008)(71200400001)(19627235002)(86362001)(316002)(83380400001)(579004)(414714003)(473944003)(44824005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Eff4OtG+Dp/oXmcNCnXZwUpbmzUHweNvo+kL+BtCxQdBXVw7qaADgOVvsC?=
 =?iso-8859-1?Q?0Lsc5v2g9Z07sfLrY5UCev44otg1OGBN6jGn0skR5XIymqrO0z2R70oomg?=
 =?iso-8859-1?Q?akwpxUhKmwnuFYMh9ff29hQvA6ian2Kf7BwTcP1FRqio3HT6a3UvxQ9vLe?=
 =?iso-8859-1?Q?z0CNKwN0kFngNy/rcWKq9Cmppg37Dc/M2ALGko24RaoIYWuc0YQaWDcV7x?=
 =?iso-8859-1?Q?FjHaywBrpyLjGTBzlFqQ4oLStbBBfIFlF1FYJxAEP4zfpzgo1gOCZNh923?=
 =?iso-8859-1?Q?plOgysinBpWDsYysHn3Zm+YeGGAQiXpC1/FC5dgMGul/po1ikjVWAAMdzp?=
 =?iso-8859-1?Q?IbhxXEohfkSgDfKzXmog57JXE+r1P94H53qMFzpgEXd6hOcVmhCfj4xSPg?=
 =?iso-8859-1?Q?EsgCR0dPfvnJfxTjDhECFAOQ6kGn9vQwjtckHjqsLo2JjuoLN3uWfi+4S8?=
 =?iso-8859-1?Q?29rrjK7W+4+PmuXoqDlD3ouxQamPAzhR/5rtYk6l9NQaRJ4Eo1vTh52ERs?=
 =?iso-8859-1?Q?5nszEE9GnQsfT+sjo2m9Kj4egcYA3xWvq/WVIZh52lZckL966Gmfs1zg6E?=
 =?iso-8859-1?Q?LU+FMVWWJTsnPKOudzdGHAbHDHobzW9tP7FT7DrGc5fRA8TLlvcqIIJjQ9?=
 =?iso-8859-1?Q?R4+iAyheMzd/9EgCBDJWyx3oRMD9E7q/nKFmBBiwhaI+RSoUv6+G8DLvPC?=
 =?iso-8859-1?Q?QvTfyLUH8fSYnSMmLQKPR5EbhfIq/FuiO4ffXNlRDAxPEGuDTdbyIN5Bbc?=
 =?iso-8859-1?Q?AbBQpsm74a0a3h4tUTPI8vYlhA3hFKo37a68l/xmKBOZRGgJPENRX02UYJ?=
 =?iso-8859-1?Q?T9kArY9tvym1AAWVH2GaDYPABnrjy3Xsp3gl6ILjILLpi725MK0SbQOO6n?=
 =?iso-8859-1?Q?QRKyj8t6rOP4yiCudUqKmdqJx3Sh/1sjC1DjIO/+LIdpoEwhiStuEaG5h3?=
 =?iso-8859-1?Q?YJS1MFUeVd5Z0elKAwExP7k456IEcKXbEeQ9vybBtS6E0ThR89a49f5TSX?=
 =?iso-8859-1?Q?nRI6N9EWA5jw6jW8qpdUcdke9hsFXTxjECYZSAM3JWpbGlHNeqTDppkNZQ?=
 =?iso-8859-1?Q?ZV+FU/WByk9QCRHPtpH9y4et3OJgGCn9a2Z5v5PTLS87IV7U0Ci0hRdipE?=
 =?iso-8859-1?Q?WKWx9ddqaXUTC//E8sJMQvVbQdGwPH46igQa/SiiPXOvZtCaxZfzIfO96J?=
 =?iso-8859-1?Q?yAXPIustuCYZcy/3vQxDeZ0JMgAFNksBNz9PLVokrmQBl+ZGpHj++etHZO?=
 =?iso-8859-1?Q?Al7Rjrv7G9r1ZgIe7vn8RRhtaXbRzpG/IsXV92f7Aeb4O5qmSnTnqlRYNA?=
 =?iso-8859-1?Q?1g3gKP2kM5d5wMGgiL3JzDDOvjSCGaRjvYK0H5YsIC5/LM5OttYx8Vniwm?=
 =?iso-8859-1?Q?BaD+59VZKxpGKJsXmzykgPFcg1cGj4xxa7G5KRqdMTTiu5Axpw6NqbW1by?=
 =?iso-8859-1?Q?3fLxDIy6nKO+3ROWayUcAeyl2vh8yXoheHQv4zdSn76PsHaYQdyNvMuUTZ?=
 =?iso-8859-1?Q?IQrkS42FN/Y8mbOm4vrSY84Mp8UpDtIHm7txURJnYltHSj/KQtvK3AyLha?=
 =?iso-8859-1?Q?1qffPgX+F+TFiJdvAsjyWjzYAP+NFKKe13k2CNA1YAIKubfty41WNstlZ/?=
 =?iso-8859-1?Q?eURyXj3FuIg6gxHNRpJAJe9FsF3XH0Wwwa?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JuiNmD1Ec5eK1N4gJF099hJyWfF65dnI397Kc3gUmFbH2q9JDcR5VYoYwTeDi+8wX5Qiku2BGRPksusrkU01XtYD9XAgX5BefU6zCKhGIeRmSfKuiDFhoUmLJbsYY8r5s+Pj2ouOWSJt1dSDW8Dt8aLE26VfaAhqFqW76TqC2JgUFTPV2vPePQTY3njxVxIbJ9qlwUq1lLY7/TkxjBNN1t5n+C3z6YSZJPXaptkD9u/gSIa0Zz6Qnfm9bfdn9a6vGXsevvv0IhJau4HrUoc2kyDYCY/vzJGPQAVvjvNyWYckOLTldxCqqaJilRBrw5n5OeSYOpZt9p7WnMgej0AGpRsOBxzGhdZbjLJEjU3PAj4AGrvtSx8PT7L4UG6DpDAxkjyJH847nHlT6bMsC6WJHIsOe3F6oWAiAbLRVjHQtwWDD7wAXJ98WY6IeRKeZolyu+J3UC9rms8PvVQiU5qMtF9kHdIL6BFIkKErDloW+wkHVzRJvnGAIlPmiw0mzPfQqsNAVCL/u9go08ko9zta4/MTQm0ThCDKypMKmJZh39NXMyi01tj2bYb1U+507NjkTYxbjkUTTyTChRu8dLe3X/qAhbeZnpy0xRYfV6t69id4SsPX44/hkEE0Pm5uGIboZ789apyrUH21maqJCZCa0Fo/9n8dcYFEwIdtvu8HtMAapbwtXcWnxvD3VgjYjs2C8N0oYn7xf80ylrnUqucQcup4UypWg2mw6r1UT5Zoqn8rUhUGLNzRK4FDPIlqqnxf86TJmr3nlyHwpt3ljeIEpCV3HpaR6rxx9G4UWamqxx2kgT/YC53GXztF9uCvj17GHQ1CuPvyQPcVI9ufq4ibsQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08f7aa4-a42c-44f9-4deb-08db365b5957
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 04:56:57.1848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbjNVP5q1bVW0ESkcaPVlhmYz6TrixWcrN1gLcKQwhypuVg8st/hIyL9/Fcysb/xaKz7Usd0SzDZNTc48gbl4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145
X-Proofpoint-ORIG-GUID: uSEBuvabHxfS-t-o1XcitqxGa-lNbBJ6
X-Proofpoint-GUID: uSEBuvabHxfS-t-o1XcitqxGa-lNbBJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304060044
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Palak,

>On 4/6/2023 5:43 AM, Palak SHAH wrote:
>From: PALAK SHAH <palak.shah@raritan.com>
>Sent: Thursday, April 6, 2023 5:43 AM
>To: Minas Harutyunyan <hminas@synopsys.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Minas,
>Last week I was able to install g_zero driver on the device side. And I in=
stalled
>usbtest.ko as a static driver on the linux host kernel running kernel vers=
ion
>5.0.9.
>
>On the host I see -
>[palakshah@localhost usb]$ lsusb
>Bus 002 Device 002: ID 8087:8000 Intel Corp.
>Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub Bus 001
>Device 002: ID 8087:8008 Intel Corp.
>Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub Bus 004
>Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub Bus 003 Device 006:
>ID 0525:a4a0 Netchip Technology, Inc. Linux-USB "Gadget Zero" // g_zero
>driver Bus 003 Device 002: ID 04b4:0101 Cypress Semiconductor Corp.
>Keyboard/Hub Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root
>hub
>
>I ran the test
>[palakshah@localhost usb]$ sudo ./testusb -a
>unknown speed   /dev/bus/usb/003/006    0
>/dev/bus/usb/003/006 test 0,    0.000013 secs
>/dev/bus/usb/003/006 test 1,    0.216270 secs
>/dev/bus/usb/003/006 test 2,    0.096186 secs
>/dev/bus/usb/003/006 test 3,    0.216282 secs
>/dev/bus/usb/003/006 test 4,    0.096046 secs
>/dev/bus/usb/003/006 test 5,    2.870960 secs
>/dev/bus/usb/003/006 test 6,    3.055972 secs
>/dev/bus/usb/003/006 test 7,    2.872110 secs
>/dev/bus/usb/003/006 test 8,    3.059713 secs
>/dev/bus/usb/003/006 test 9,    8.601377 secs
>/dev/bus/usb/003/006 test 10,   26.794975 secs
>/dev/bus/usb/003/006 test 11,    4.006801 secs
>/dev/bus/usb/003/006 test 12,    4.002395 secs
>/dev/bus/usb/003/006 test 13,    4.874480 secs
>/dev/bus/usb/003/006 test 14 --> 22 (Invalid argument)
>/dev/bus/usb/003/006 test 17,    0.185385 secs
>/dev/bus/usb/003/006 test 18,    0.098154 secs
>/dev/bus/usb/003/006 test 19,    0.197473 secs
>/dev/bus/usb/003/006 test 20,    0.098188 secs
>/dev/bus/usb/003/006 test 21 --> 22 (Invalid argument)
>
>Atleast now I can run some of the tests, however I am interested in the IS=
OC
>transfer, which is tested using t15 and t16. But test 15 and 16 did not ru=
n.
>
>I put more messages in the code and I found that, it exits both the tests =
-
>                if (dev->out_iso_pipe =3D=3D 0 || param->sglen =3D=3D 0){
>                    pr_info("TEST 15: dev->out_iso_pipe =3D=3D 0 || param-=
>sglen =3D=3D 0
>Error condition!!\n");
>                    break;
>                }
>
>I put more messages in the code, and I realize that dev->out_iso_pipe is n=
ull.
>
>                if (dev->in_pipe){
>                        printk("dev->in_pipe is true\n"); this gets printe=
d
>                        rtest =3D " bulk-in";
>                }
>                if (dev->out_pipe){
>                        printk("dev->out_pipe is true\n"); this gets print=
ed
>                        wtest =3D " bulk-out";
>                }
>                if (dev->in_iso_pipe){
>                    printk("dev->in_iso_pipe is true\n"); // this doesn't =
get printed.
>                    irtest =3D " iso-in";
>                }
>                if (dev->out_iso_pipe){
>                        printk("dev->out_iso_pipe is true\n"); // not prin=
ted
>                        iwtest =3D " iso-out";
>                }
>
>Some dmesg messages that I printed, it prints in_pipe and out_pipe is true=
 for
>BULK transfer, but ISOC transfer is not set.
>
>[    2.051466] usb 3-8: New USB device found, idVendor=3D0525,
>idProduct=3Da4a0, bcdDevice=3D 5.04
>[    2.051468] usb 3-8: New USB device strings: Mfr=3D1, Product=3D2,
>SerialNumber=3D3
>[    2.051469] usb 3-8: Product: Gadget Zero
>[    2.051470] usb 3-8: Manufacturer: Linux 5.4.80-kx4 with ffb40000.usb
>[    2.051471] usb 3-8: SerialNumber: 0123456789.0123456789.0123456789
>[    2.053199] USBTEST.ko usbtest_probe!!!
>[    2.053200] dev->in_pipe is true
>[    2.053200] dev->out_pipe is true
>[    2.053201] USBTEST : Linux gadget zero
>[    2.053202] USBTEST high-speed {control in/out bulk-in bulk-out} tests =
(+alt)
>[    2.166449] usb 3-10: new low-speed USB device number 3 using xhci_hcd
>
>Any idea how I can test ISOC test?

To run isoc tests test 15/16 apply follow patch:

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index ac0d75ac2d2f..7736b0a98cab 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -187,9 +187,11 @@ get_endpoints(struct usbtest_dev *dev, struct usb_inte=
rface *intf)
                                continue;
                        }
                }
-               if ((in && out)  ||  iso_in || iso_out || int_in || int_out=
)
-                       goto found;
        }
+
+       if ((in && out)  ||  iso_in || iso_out || int_in || int_out)
+               goto found;
+
        return -EINVAL;
=20
 found:

Thanks,
Minas

>
>Thanks,
>Palak
>
>-----Original Message-----
>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>Sent: Friday, March 10, 2023 4:04 AM
>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
><maynard.cabiente@raritan.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Palak,
>
>>On 3/9/2023 8:21 PM, Palak SHAH wrote:
>>From: Palak SHAH <palak.shah@raritan.com>
>>Sent: Thursday, March 9, 2023 8:21 PM
>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>><maynard.cabiente@raritan.com>
>>Cc: linux-usb@vger.kernel.org
>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>
>>Hi Minas,
>>Yes I do have g_audio module loaded.
>>
>>This dmesg logs are from my device -
>>[ 1151.517385] g_audio gadget: Linux USB Audio Gadget, version: Feb 2,
>>2012 [ 1151.517401] g_audio gadget: g_audio ready [ 1151.517418] dwc2
>>ffb00000.usb: bound driver g_audio [ 1151.640143] dwc2 ffb40000.usb:
>>bound driver configfs-gadget [ 1151.808188] dwc2 ffb40000.usb: new
>>device is high- speed [ 1151.922374] dwc2 ffb40000.usb: new device is
>>high-speed [ 1151.982406] dwc2 ffb40000.usb: new address 24 [
>>1151.996762] configfs- gadget gadget: high-speed config #1: c
>>
>># lsmod
>>Module                  Size  Used by
>>usb_f_uac1             20480  3
>>u_audio                20480  1 usb_f_uac1
>>snd_pcm                94208  1 u_audio
>>snd_timer              36864  1 snd_pcm
>>g_audio                16384  0
>>usb_f_hid              20480  9
>>libcomposite           61440 16 usb_f_uac1,u_audio,g_audio,usb_f_hid
>>
>>This is my host -
>>[palakshah@fedora ~]$ lsusb
>>Bus 002 Device 002: ID 0bda:0328 Realtek Semiconductor Corp. USB3.0-CRW
>>Bus
>>002 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub Bus 002
>>Device
>>001: ID 1d6b:0003 Linux Foundation 3.0 root hub Bus 001 Device 023: ID
>>14dd:1010 Raritan Computer, Inc. KX4-101 // this is my device that I am
>>connected to.
>>Bus 001 Device 002: ID 14dd:1007 Raritan Computer, Inc. D2CIM-VUSB KVM
>>connector Bus 001 Device 005: ID 8087:0a2b Intel Corp. Bluetooth
>>wireless interface Bus 001 Device 004: ID 0bda:5411 Realtek Semiconductor
>Corp.
>>RTS5411 Hub Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root
>>hub
>>
>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/023 -t15
>>[sudo] password for palakshah:
>>./testusb: /dev/bus/usb/001/023 may see only control tests
>>/dev/bus/usb/001/023 test 15 --> 25 (Inappropriate ioctl for device)
>>
>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/023 -t16
>>./testusb: /dev/bus/usb/001/023 may see only control tests
>>/dev/bus/usb/001/023 test 16 --> 25 (Inappropriate ioctl for device)
>>
>>But still host cannot talk to the device.
>>
>
>On host side should be loaded module usbtest.ko On device side remove your
>function(gadget) driver, instead load g_zero (not g_audio) function.
>
>Thanks,
>Minas
>
>
>>Thanks,
>>Palak
>>
>>-----Original Message-----
>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>Sent: Thursday, March 9, 2023 5:03 AM
>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>><maynard.cabiente@raritan.com>
>>Cc: linux-usb@vger.kernel.org
>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>
>>Hi Palak,
>>
>>>On 3/9/2023 1:42 AM, Palak SHAH wrote:
>>>From: Palak SHAH <palak.shah@raritan.com>
>>>Sent: Thursday, March 9, 2023 1:42 AM
>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>><maynard.cabiente@raritan.com>
>>>Cc: linux-usb@vger.kernel.org
>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>
>>>Hi Minas,
>>>A while ago, I asked you if I can run a usb test, to test IP core,
>>>without doing audio test.
>>>
>>>You had suggested that to test usbtest program (see
>>>https://urldefense.com/v3/__https://eur01.safelinks.protection.outlook.
>>>com/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__https*3A*2F*2Feur01
>.saf
>>>e
>>>links.protection.outlook.com*2F&data=3D05*7C01*7Cpalak.shah*40raritan.c
>o
>>>m
>>>*7Ce899edf3108b4733963408db2085841d*7C199686b5bef4496087867a6b
>1888fee3
>>>*
>>>7C1*7C0*7C638139530054005175*7CUnknown*7CTWFpbGZsb3d8eyJWIjoi
>MC4wLjAwM
>>>D
>>>AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000*7C*7C*7C&
>sdata
>>>=3D
>>>efRKGkGDjq5OhK347*2B6r2*2FaXjZy4wysBzzl5XezhEZo*3D&reserved=3D0*__
>;JSUlJ
>>>S
>>>UlJSUlJSUlJSUlJSUlJSUlJSUlJSUlPw!!A4F2R9G_pg!fXoTRt1krMtYNUcU033cc_C
>Yw
>>>9 YrC_nUj99EXR4vAwT-
>hb3T78zqvyakXvx4elweFNfmoHxwarh2RDYX7L7rJqCcWz9z$
>>>url=3Dhttp*3A*2F*2Fwww.linux-
>>>usb.org*2Fusbtest*2F&data=3D05*7C01*7Cpalak.shah*40raritan.com*7Ccdc9
>cf1
>>>8
>>>d5c54
>>>b2c74fc08daf53d681e*7C199686b5bef4496087867a6b1888fee3*7C1*7C0*7
>C63809
>>>1
>>>94134
>>>5558693*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>2luMzIiLC
>>>J
>>>BTiI6
>>>Ik1haWwiLCJXVCI6Mn0*3D*7C3000*7C*7C*7C&sdata=3DOIiLXl6dlCHlfACx6Zx
>pLhQkp
>>>0
>>>7xIwb
>>>qAR3CtnqfsFU*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUl!!A4F2R9G_pg
>!
>>>f
>>>3GN6S
>>>P6NM--pKekkA-jG4RICPguFvb3DNeRO6jFDEhovrY3IEC2-
>>>aL0ay4g95j7BsdRM6JRGwjL6kPzTS8z13tShKOe$ )
>>>
>>>So I tried this program. I compiled it on my linux host, and run it on
>>>the host, which is connected to the Linux device acting as USB gadget.
>>>
>>>I am running test t15 and t16 which is for ISOC. Infact I tried
>>>running
>>all.
>>>I ran it on the host device. And I get this error -
>>>
>>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/019 -t15
>>>./testusb: /dev/bus/usb/001/019 may see only control tests
>>>/dev/bus/usb/001/019 test 15 --> 25 (Inappropriate ioctl for device)
>>>
>>>Either I get error 25 (Inappropriate ioctl for device) or error 38
>>>(Function Not Implemented).
>>>
>>>If I do, [palakshah@fedora ~]$ sudo ./testusb -a no test devices
>>>recognized
>>>
>>>I tried to google, why these tests don't work, but did not find
>>>anything useful. Do you have any idea?
>>>
>>
>>Did you modprobe g_zero module on device side?
>>lsusb command should show that connected device:
>>...
>>Bus 001 Device 002: ID 0525:a4a0 Netchip Technology, Inc. Linux-USB
>>"Gadget Zero"
>>...
>>
>>Thanks,
>>Minas
>>
>>>Thanks,
>>>Palak
>>>
>>>-----Original Message-----
>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>Sent: Monday, March 6, 2023 11:31 PM
>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>><maynard.cabiente@raritan.com>
>>>Cc: linux-usb@vger.kernel.org
>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>
>>>Hi Palak,
>>>
>>>>On 3/6/2023 8:26 AM, Palak SHAH wrote:
>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>Sent: Monday, March 6, 2023 8:26 PM
>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>><maynard.cabiente@raritan.com>
>>>>Cc: linux-usb@vger.kernel.org
>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>
>>>>Hi Minas,
>>>>
>>>>>I can recommend you:
>>>>>1. disable debug prints to minimize platform loading
>>>>
>>>>[Palak] I am working on this
>>>>
>>>>>2. change Descriptor DMA mode to Buffer DMA
>>>>
>>>>[Palak] Can you please explain this more, what does this mean?
>>>
>>>Core can work in 3 different modes to transferring data between FIFO
>>>and
>>>RAM: Slave, Buffer DMA and Descriptor DMA.
>>>
>>>To switch from DDMA to BDMA in file params.c file in function
>>>dwc2_set_default_params()
>>>        ...
>>>        if ((hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL) ||
>>>            (hsotg->dr_mode =3D=3D USB_DR_MODE_OTG)) {
>>>                p->g_dma =3D dma_capable;
>>>                p->g_dma_desc =3D hw->dma_desc_enable;
>>>        ...
>>>Update last line to
>>>                p->g_dma_desc =3D 0;
>>>
>>>Thanks,
>>>Minas
>>>
>>>>
>>>>Thanks,
>>>>Palak
>>>>
>>>>-----Original Message-----
>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>Sent: Thursday, March 2, 2023 11:35 PM
>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>><maynard.cabiente@raritan.com>
>>>>Cc: linux-usb@vger.kernel.org
>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>
>>>>Hi Palak,
>>>>
>>>>>On 2/28/2023 12:21 AM, Palak SHAH wrote:
>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>Sent: Tuesday, February 28, 2023 12:21 AM
>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>><maynard.cabiente@raritan.com>
>>>>>Cc: linux-usb@vger.kernel.org
>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>
>>>>>Hi Minas,
>>>>>I have attached the following USB traces and debug log.
>>>>>1) dmesg and usb sniffer logs during driver loading.
>>>>>
>>>>>2) EP1(OUT) - I play AUDIO on the HOST. And I do arecord on the
>>>>>linux device that acts as USB gadget. So the audio is going OUT from
>>>>>the host. So you will see EP1 OUT.
>>>>>I have attached logs and USB sniffer data, during arecord.
>>>>>
>>>>>I am not testing ISOC EP1(IN) yet. I am still seeing and debugging
>>>>>issues with Ep1(out).
>>>>>
>>>>>3) When I change UAC1_DEF_REQ_NUM 2 changed to 32, the problem
>STILL
>>>>>exist with EP1(OUT). ONLY log behaivor is different. In the log I
>>>>>see XferCompl, but I don't get any data in the arecord.
>>>>>I have attached 2 files. Arecord_command.txt shows what I run.
>>>>>Arecord_output shows what I get after I run the command.
>>>>>
>>>>>4) I sent you regdump, hw_params, params and fifo in the previous
>email.
>>>>>
>>>>
>>>>I'm not find any issue based on the '_arecord.txt', just again 7
>>>>second time
>>>>gap:
>>>>
>>>>[  228.173271] dwc2 ffb40000.usb: dwc2_hsotg_epint: At the end of the
>>>>function, dwc2_hsotg_epint() [  228.173271] [  235.536299] dwc2
>>>>ffb40000.usb: dwc2_hsotg_ep_queue, ep1out: req 777cd34b: req
>>>>len(200)@req buf(af65750d), # of int=3D0, req zero=3D0, snok(short not
>>>>ok)=3D0
>>>>
>>>>I can recommend you:
>>>>1. disable debug prints to minimize platform loading 2. change
>>>>Descriptor DMA mode to Buffer DMA
>>>>
>>>>Thanks,
>>>>Minas
>>>>
>>>>
>>>>>Thanks,
>>>>>Palak
>>>>>
>>>>>-----Original Message-----
>>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>>Sent: Monday, February 27, 2023 5:18 AM
>>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>>><maynard.cabiente@raritan.com>
>>>>>Cc: linux-usb@vger.kernel.org
>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>
>>>>>Hi Palak,
>>>>>
>>>>>>On 2/27/2023 6:02 AM, Palak SHAH wrote:
>>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>>Sent: Monday, February 27, 2023 6:02 AM
>>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>>><maynard.cabiente@raritan.com>
>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>
>>>>>>Hi Minas,
>>>>>>Please find attached the logs - regdump, hw_params, params and
>>>>>>fifo, taken when the driver is loaded.
>>>>>>
>>>>>>I will send the USB traces tomorrow.
>>>>>
>>>>>
>>>>>USB trace for arecord (EP1IN ISOC) and debug log.
>>>>>
>>>>>
>>>>>Could you please confirm that after defining UAC1_DEF_REQ_NUM to 32
>>>>>playing audio (EP1OUT ISOC) no any issue seen?
>>>>>
>>>>>Thanks,
>>>>>Minas
>>>>>
>>>>>>
>>>>>>Thanks,
>>>>>>Palak
>>>>>>
>>>>>>-----Original Message-----
>>>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>>>Sent: Friday, February 24, 2023 5:33 AM
>>>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>>>><maynard.cabiente@raritan.com>
>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>
>>>>>>Hi Polak,
>>>>>>
>>>>>>>On 2/24/2023 3:04 AM, Palak SHAH wrote:
>>>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>>>Sent: Friday, February 24, 2023 3:04 AM
>>>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>>>><maynard.cabiente@raritan.com>
>>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>>
>>>>>>>Hi Minas,
>>>>>>>I have attached the log where I connect to the audio gadget (and
>>>>>>>therefore, load the driver). We can do it using command line on a
>>>>>>>serial prompt or using GUI and connecting to Audio gadget.
>>>>>>>
>>>>>>>However, in both cases, I don't see any EP1(out) data and the
>>>>>>>register
>>>>>>dump.
>>>>>>>Ep1out comes out only when I play a you tube video and I do
>>>>>>>arecord to capture data.
>>>>>>
>>>>>>According your device configuration EP1(out) using when you play
>>>>>>audio, and
>>>>>>EP1(in) using when you record audio by arecord.
>>>>>>So, after driver loading these both ISOC EP's will not seen in log
>>>>>>until aplay/arecord will not run.
>>>>>>
>>>>>>>
>>>>>>>Please let me know if the log doesn't have the information you need.
>>>>>>
>>>>>>No, it's again dmesg. I asked for core all register dump which
>>>>>>available under debugfs's. dwc2 debugfs's under follow directory:
>>>>>>/sys/kernel/debug/usb/dwc2.2.auto/
>>>>>>In your case 'dwc2.2.auto' can be little bit different. In this
>>>>>>directory there are files regdump, hw_params, params, fifo, etc.
>>>>>>Just use 'cat regdump'
>>>>>>to get register dump. Please also provide me cat of hw_params,
>>>>>>params and fifo. These last 3 files need to cat just once after
>>>>>>driver
>>loading.
>>>>>>
>>>>>>>
>>>>>>>Also, I tried changing UAC1_DEF_REQ_NUM 2 changed to 32. I saw a
>>>>>>>change in the behaivor of logs, I got XferCompl all the time, and
>>>>>>>not
>>>>>ep_disabled.
>>>>>>
>>>>>>So, after defining UAC1_DEF_REQ_NUM to 32 playing audio (ep1out)
>>>>>>work without any issue? And increasing req number to 32 fixed issue
>>>>>>which we debug till now?
>>>>>>
>>>>>>>However, arecord behaivor did not change, meaning I still did not
>>>>>>>get the data. It only changed the logging behaivor.
>>>>>>
>>>>>>If you still see issues with arecord (ep1in) then please provide me
>>>>>>debug log for this case and USB trace by Ellisys.
>>>>>>
>>>>>>Thanks,
>>>>>>Minas
>>>>>>
>>>>>>
>>
>>
>>________________________________
>>
>>Ce message, ainsi que tous les fichiers joints =E0 ce message, peuvent
>>contenir des informations sensibles et/ ou confidentielles ne devant
>>pas =EAtre divulgu=E9es. Si vous n'=EAtes pas le destinataire de ce messa=
ge
>>(ou que vous recevez ce message par erreur), nous vous remercions de le
>>notifier imm=E9diatement =E0 son exp=E9diteur, et de d=E9truire ce messag=
e.
>>Toute copie, divulgation, modification, utilisation ou diffusion, non
>>autoris=E9e, directe ou indirecte, de tout ou partie de ce message, est
>strictement interdite.
>>
>>
>>This e-mail, and any document attached hereby, may contain confidential
>>and/or privileged information. If you are not the intended recipient
>>(or have received this e-mail in error) please notify the sender
>>immediately and destroy this e-mail. Any unauthorized, direct or
>>indirect, copying, disclosure, distribution or other use of the
>>material or parts thereof is strictly forbidden.
>
>________________________________
>
>Ce message, ainsi que tous les fichiers joints =E0 ce message, peuvent con=
tenir
>des informations sensibles et/ ou confidentielles ne devant pas =EAtre
>divulgu=E9es. Si vous n'=EAtes pas le destinataire de ce message (ou que v=
ous
>recevez ce message par erreur), nous vous remercions de le notifier
>imm=E9diatement =E0 son exp=E9diteur, et de d=E9truire ce message. Toute c=
opie,
>divulgation, modification, utilisation ou diffusion, non autoris=E9e, dire=
cte ou
>indirecte, de tout ou partie de ce message, est strictement interdite.
>
>
>This e-mail, and any document attached hereby, may contain confidential
>and/or privileged information. If you are not the intended recipient (or h=
ave
>received this e-mail in error) please notify the sender immediately and de=
stroy
>this e-mail. Any unauthorized, direct or indirect, copying, disclosure,
>distribution or other use of the material or parts thereof is strictly for=
bidden.
