Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D487046EB
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 09:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjEPHvX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 May 2023 03:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjEPHvW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 May 2023 03:51:22 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC661FCC
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 00:51:17 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G64ekg013091;
        Tue, 16 May 2023 00:51:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=x2XkAkvg8o+R8KsM/FFz479BHJExMEEl1NJNHTOuAZo=;
 b=NrixHmaCYgnTX4Nayj7zVFJ22Hji5Kb4JOZDIa/JcGdQiYmo1l+pgBa1UusgTKQP3ro8
 hX8B5attnS6N94bAW6SNblZHZr/q1z7SVhoU49WMOT3IToxWesriqnU9Cckc4C0/p+aH
 urFhWlpeZG7z9FuuomjhtC+x6qUQeWjmb3kXhbN836ajuYBYh8zYYwppBl25RUbyvnsA
 5/FigHxAeDNjYweWI4Kes8PWc3mAZilMZf/7hHScxDRw9bFDmsJ4TG0mhCSEhySKXm39
 D1iSMVisSp3HwFASyAVS2gplIt91FaQlrt28oal2e0zYLnzVSywxl3czL9Hz5ETizPg1 Fw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qj9jkuune-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 00:51:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684223472; bh=x2XkAkvg8o+R8KsM/FFz479BHJExMEEl1NJNHTOuAZo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kWT0jQOOjyUnEUN9hVsHryLGyWeSy9KA4YCFgJ/lsgQ7bJIQltHBMngO/E4Jmw38p
         yZ4kZ9n/7dnxusKTjqTRRs0eb82iFbgbEdESxPteMe05pn+3a8hkGivIRgiXJy6aIB
         QOk+JAIahbl4aprDgc4nSIK2hcfhvpXIT97OuiP+4WfbVpKPK15pookxt6MghSplu7
         NsydfrMC1EqOe6Zn9s8YauNuo6tTxLUm7j/UsVfGdNDB7LTSeGHLcpRcHleAro7UTT
         2lyfz00mwPXmlOYdztQ3zcp8W+T8bHv7MzHeG0sfEwqWyxIwmBYdNli43VW0IBCNNO
         e2ybUJm9nBRPw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3061A40636;
        Tue, 16 May 2023 07:51:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B754AA0070;
        Tue, 16 May 2023 07:51:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TzHf+2ie;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 696B24060A;
        Tue, 16 May 2023 07:51:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8039BFD62T+ZvXaVUdsFmi5Ue0TXID2NlnljjGKYiiC0xO1IyocUHXEYpUHBJ7juNqwukpgiZYVLd64r9VpVXKJlOUM540L7nLttewqHL65ttB0Evi/yv9QRD6zbaRbdFNVBRdpW1jSbMzFw7MbfsPb0k2iCwMEjnmgKwz0ZzM9y8yOPJyO2NU3bl40L629zFvG5FAKP9FYhOsF4A8mEfndopaii2e9aiOy2sJta92OaPMXl1O9XhzGlQrrYd0CSmiT5YCYp0Ce2tiGLDvuqZYLTjgfFU9JBB2OvqxJSMKlu/hs37qn6fGUGP4vR+zBVdzDZV5qW+cKJ3mNZM1lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2XkAkvg8o+R8KsM/FFz479BHJExMEEl1NJNHTOuAZo=;
 b=cD7ZPnmhZ/cpS62eQDW0SI70gdbefHJHUumklJQToCaXKq8H6CpIFX4dzdUtY0EHaGI6oBRfGYIWkAuleY6CeT1RcHNFNEDUFvVAcf7czOQYdxO1oB68i8iPdbWAvKFGsHsPc3yekdyMS4A0c53N5she9/lBzdmUf/oEuh6L4mRNyGx5kITfS7krN2BfhYCB6iVUdd7jt2obUcSE0qT/C6w+2V6Ax2AZObrPSzT8HDRghAQuJ8XXqqtmedxWNW4i5QRAnqqZ1ApdPRmkh8wsVopYKl6M11ReHlIOUVnQCgD3W2LVz0m/eM+XDphtUscPngSVTcD/OWmtnPodrhYkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2XkAkvg8o+R8KsM/FFz479BHJExMEEl1NJNHTOuAZo=;
 b=TzHf+2iezeKSlIdwnKqnhk1m8tC3UGv0nc9eRYj7A5Ekv/vF7oWmyN1xrbje9Hafk0xBSYfofpv10FFNMwaiAwnWKEIokwjgdvtdftEhQijfzadrAnz52Hj/pkHeB5Twpw5cMASB8A10suNWzSkka8zgYEU91dUQXdysVC1Szp0=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by PH7PR12MB8107.namprd12.prod.outlook.com (2603:10b6:510:2bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Tue, 16 May
 2023 07:51:09 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 07:51:08 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     PALAK SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8l67bcCYwgACjvICAdTpx0IAAvFDpgABzRADRMq4GAIAHgKyA
Date:   Tue, 16 May 2023 07:51:07 +0000
Message-ID: <744c32ed-e8c5-9e02-c778-ec3538c954bb@synopsys.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
 <PAXPR06MB85319DCC50F69D0790D5F4198D719@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531E23298F9BA26C1E651AC8D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531BF29DA170252843DD5598D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531D31F642598C1D9B8555B8D749@PAXPR06MB8531.eurprd06.prod.outlook.com>
In-Reply-To: <PAXPR06MB8531D31F642598C1D9B8555B8D749@PAXPR06MB8531.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|PH7PR12MB8107:EE_
x-ms-office365-filtering-correlation-id: 66f09238-d624-4e82-33b1-08db55e24edf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oNBfUCMMzKk0KXaOeKLtJD5VVWvkVFxt/dpCEk15/pKE0YzjIidnu4Eiy4B58dfA2/4R+nbuBfZKW74NmcSN3AqEvS7w+i3BIjFG0rQiQ2U6ZS1/tcPZFsk517UKtpMCxexI/PIxojFSi1D10rNpfhqjonvVYEVuOTzT690rq9WH+s9wh573oR4Ke/ctNJbD2tFcuMUFKUrMGQ1a31a2WsifnIiZME02IhetLuq3gaSvh3WYw1pgfh/5GZcLLmCwZv1XsFVOaWBhsxJ87A5aCCXjL7mPVER3m+MzkTl1noViXYhXMzxtG7t9gA++ldSaNmHlWwi46ESdSSFa4amNXiZiUQIAqd6G11n8jQjGjWSB6Y8ez8GiaG2K7kWqiL1gq56apTBF+m2eH4jH45OL631xihpgWc9WPD4TEaQfleQg1nFWYhXRVhHGfDUlAwWf6tJ9fhGofHeT9pnENPPDA4eHPQdCJ9J0mISJsSqCzSX7wSX+KhNLzAvib1s1IDFgTQqCA3vdV4BmEc5k54hxtKl0axNSIILnqiqZWNJbJLWf35ds46ujlqnkXA0FGK3ebCdgBzlUtfc17FAwaYNc7boQjgLKfadv3I/QqXAJi3z6CPJc+Sox2jyepea8O4haQ1SoqTvv6kKkOluMWkMvMvG+sS4UM0+jqkKuBR1fzisAK/J2Zattsd7ze7sqDzg2cbYAk+QE5ZBI4o1g40qLOn0gXGh61uhA8npLgIEkcEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(478600001)(66556008)(110136005)(76116006)(91956017)(2906002)(66476007)(66946007)(31686004)(186003)(4326008)(64756008)(41300700001)(71200400001)(6486002)(8936002)(8676002)(316002)(2616005)(66446008)(26005)(53546011)(6512007)(6506007)(83380400001)(5660300002)(122000001)(38100700002)(38070700005)(31696002)(86362001)(36756003)(45980500001)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V210czkyYjQxRDBzRVA5UVJXeUFDckxiT1RONGEzMDIzRGRCZVBaVjZJZGY0?=
 =?utf-8?B?OVJoVE5FUmQzeW5GKzJuM3B3VjQrb1FJTFlWY3dQTjNuQlN2ZWcxRjByOS9W?=
 =?utf-8?B?aWJ1Si8xbm1keGlVTnRDWmQvOEVEeTZDWUVkR2ZUbkRwRWRNMnZqT3hFMmVi?=
 =?utf-8?B?M2VRTXB1UHQ0SkxQd1dxTDZxK3BFOUVRZ3UxbzVMbE5qM29vMTc1V2FsUUFy?=
 =?utf-8?B?U1o3cW1BNHV4SFVaTlVQc3pyR2JLK2oyR1ZMRzhqVDI1clVWbHRWZm5RdUZZ?=
 =?utf-8?B?ZVNYQXdFUnRwSllzRGVJdjRYVjY0bUJhQWFoSlZGTVlrd2tmK2pzaGpHQm5S?=
 =?utf-8?B?dy84VXZzVy9hdG5EQ1M2V01pVVo4ZjhsVFNYYVVhZis4OTN5RXJxOWI1aHdu?=
 =?utf-8?B?TElVbEFONFlmRG5vUThIM1dveGtBK2RQR2tpbSt2OVhpbEJhSVVRRUswcnZZ?=
 =?utf-8?B?RzF2M1I4b0h0L0RFd3pKcHJjNFVZcVUzTkU5TjNiMmVrUWtJQTNyK3hwOTdx?=
 =?utf-8?B?UklBSFlndWdpR21RV1FiZ3U5ZGRFNkJuQklUTjNIa2x6WWU1RzdnWjBrN3ZS?=
 =?utf-8?B?WHNFMHlPekp0cFBUcHV0MTV2UUNXdW5Ya0svcHM2dGZzeDV4S3hwK1ljYlJv?=
 =?utf-8?B?ZXBIM0JBNzl1VEN3SmVlZ2Y2dkl0cUNBNHFMREZJWTliT1lzMXZnYk5wNU8y?=
 =?utf-8?B?ejNPMFRCN2ZDRzBWRndaVzJMVEI1ZjhGdmZnazdqbS8xYWJjbU9IQjF2SEw0?=
 =?utf-8?B?S3BjalUxOHNMZ2dmcEQ4OHQzaVZzeTVJTHA1bVZKaFFybmhQMjZuR2w1V3M1?=
 =?utf-8?B?N2E2VFNLQ05YdDZNQ2dadFdwL1djMS91M2RoY2NZU1FDSVlpY29DdnhuODVN?=
 =?utf-8?B?cjgvN2VpeUtSSit4VmFEbHhYbHhhM2NvN3NmSzFINmRJOFRORDVJaTRRQjNz?=
 =?utf-8?B?aHpKNXh5bGRXcUdQQmJkQWlRSERIbzZSM212VjBOdjJ3NC96WmZrTVlLYmY3?=
 =?utf-8?B?bW5IK3NYQ0pNc3NMUTdIYmZTd3p6VDMyNFNoTnpJS25WYnNwMjI4aS9iamp1?=
 =?utf-8?B?enBVcjBKYkhON1QrdzdqQ0tKV3ptdjJQcVJoWkoxL2xTL3V3eURUWTVJQ2VI?=
 =?utf-8?B?ZFZYSXZXbTFmcmVSWnlaV1ZWZVhtM2Y0eVgzTWtRR3NUZTU4TFJNejdNeE9C?=
 =?utf-8?B?Mkw5bkZaOGU0cERDZFM2K25JZnRRUXl2VGJHb2phN09rTHJmUDlrS0VLbTAv?=
 =?utf-8?B?MEtwQWVScVRSVkt5UVI1Q3JmRUc4LzlTL2tvc094T2VacmpGaDZacjNCeTR2?=
 =?utf-8?B?VHc3bnZyMzlOOWhBcVZtby85aEd4Y2hGVmRaQ0ZheXVDajVoVmZWUEJFeFlu?=
 =?utf-8?B?S1Vnb3JmWnVKUGE1ZTJteGIzTXBtQmRtcU1aN0tqd1dEMnBwUjJKQk52bzY2?=
 =?utf-8?B?cTFIYnJkK01UcG1RNlo1TE1uWlM0NStIOHc5alllRXY3ZWFTSGw5Vjl6a3dX?=
 =?utf-8?B?bExuYmpqOXFSLzk2bXdzdGdES3BEbzJOK1EzOEN1cHI5ejhSTkV1U2lUZXpG?=
 =?utf-8?B?UGoxL0ptYXJjWnBTS0sxd3JZRGd2YlhoK1AxcmgrZWN3NVY5MmhPUWJpazZY?=
 =?utf-8?B?UzFvTDRudVJ0bjFnYlIvS0VxbXlXUnNFc3ZNcUFxVU5yMURsK1lDZWs2NXZC?=
 =?utf-8?B?eTdHUkk5TkRoN2hhaFRjZ1UxUklhVSt5cEhIU3piRWRScUZoNDYrY0hqR1lm?=
 =?utf-8?B?NU5ERzJNcWJZQkEzdHpabUF1SGx4OTdiem9rVGNyNTVWUS91bVJMOU9idk4r?=
 =?utf-8?B?d0I4M1FUemVEUTRucjFSYXNBZzFjVmFQbGEya3h4WU8yUTdBS2dWWEVsRHR2?=
 =?utf-8?B?MFVZcVNUUGxFZ2w0MVFzR2tmbjRkYnEvMjR5MGlkcHBRc2hxWkVrdTdyKytF?=
 =?utf-8?B?ZzEyTHdNM0RSRVFPdlFoTnJHQ01lTGNlRzNNOXd6T2JZd3Z2UVdzYkdnRktH?=
 =?utf-8?B?VUdFWEhEaVhvQWoxZEJTTUNvN1NlbGQrZzdVTklYTjBWSUZrdGNkS1dmYlAz?=
 =?utf-8?B?Z0Nlem9EdXB2U3UzaXgvRVRUbWpYbDBzOU1yUDBaZ0tGT2gvUDB3SmN3OG4z?=
 =?utf-8?Q?NLHZGka7ahN6J608guzLGM10O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C3FAD7160E3024F8EDBDD6E2E878882@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rmuyA6vKf9ZZoWOhBk9TGfq6CNffYi8yUvbeWUCcYZlMcNe8mq9DYYeq8tDvvH2HBgSyYN3GirlCh5V5f/QE7KARMsur5XuChwKNZ1umVMzscAggFTul7t9Z5i626NfK4yIAk02Bn2wlFm/BAW6bunhXwsFMjrv8jnGY0PLITAH4jmudbiXWEZMUhfpt3Tc72UUjeGdPDn0RyKrBhTDEuNMfNL/FnmaVee4jMb7nQXfFHSzOxuRkzpuhKxTM5KoMcKjhAd3PsSPbv0CrzJ6fVLE1eh85waep9qbg60Y5W0lR/fxioDMkei1aA/x7jFfAXSbRlr9C865f1NC5aCaGna3vTn45LX6eFcn7CaXy1DRBcz2zCbIiOY9YWu8XlAF6ZWKW07E36tf3j1wZo/vtZeK7Dd8zoIGvxOSFfTSZLj77oPF599k3t6/zwWOdU6h3XRNfXPTk2masX4UczfuAWLxquJZPGn9K4Zh+GSoet4FAQfoKUT2wxXcOjNExz+14EX4241LsG/YXXwTt5mzb7qqXefaX+uftrQ+kZrUe2mk8IGSRnKej/stbEYTKUjoiGjlO5GSdehxYrIS0qdcWpYoEZdUeQNlFAxS0/fCz7Z52sqvLmmOsNF6fiS3RX3yOZCRQC7Cdf//Dj1Ekr/bijO9xjOmJs2U80dlIB+O32ST7pdg+vNwSQTuV6ezb1UiQjUP3jPMor0N7WJfd49fiErBjeztk57AG8Jm6nROi2NbUSaaZcMHYuG+/aIbPb9gzDUvLXQsYfCfKAbl+ZJUqcIaCVC4JMAddN54SsUYGaCMkoU0shzGSG9sBYKCiccKifijkcu1jfkNdlXR8UxwzHg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f09238-d624-4e82-33b1-08db55e24edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 07:51:07.7214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UE/JMUFM4+Egy5XPwQoMx9yZOfOndhXxrTewf0N94MD3WfQSn8Eqd10FH7m/jZJkt8hve7bFDpkIzEGYHwfqZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8107
X-Proofpoint-GUID: tIGpDHRfvDYYRf8hi2Z8qw--3kg7xHeq
X-Proofpoint-ORIG-GUID: tIGpDHRfvDYYRf8hi2Z8qw--3kg7xHeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305160067
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGFsYWssDQoNCk9uIDUvMTEvMjMgMTc6MTYsIFBBTEFLIFNIQUggd3JvdGU6DQo+IEhpIE1p
bmFzLA0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgcmVzcG9uZCB0byB0aGlzPyBXZSBuZWVkIFVTQiBB
dWRpbyBHYWRnZXQgd29ya2luZyBhbmQgd2UgDQo+IGNhbm5vdCBwcm9jZWVkIHdpdGhvdXQgU3lu
b3BzaXMgc3VwcG9ydCBvbiB0aGlzLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gUGFsYWsNCj4gDQo+
ICpGcm9tOiogUEFMQUsgU0hBSA0KPiAqU2VudDoqIFR1ZXNkYXksIE1heSA5LCAyMDIzIDEwOjUy
IEFNDQo+ICpUbzoqIE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5
cy5jb20+OyBNYXluYXJkIA0KPiBDQUJJRU5URSA8bWF5bmFyZC5jYWJpZW50ZUByYXJpdGFuLmNv
bT4NCj4gKkNjOiogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiAqU3ViamVjdDoqIFJFOiB1
c2I6IGdhZGdldDogZHdjMjogbm90IGdldHRpbmcgYXVkaW8gZGF0YQ0KPiANCj4gSGkgTWluYXMs
DQo+IA0KPiBJIGhhdmUgdXBkYXRlZCB0aGUga2VybmVsIHRvIDUuMTAuMTAwLiBJIGhhdmUgZG9u
ZSB0aGUgSVAgY29yZSB0ZXN0IGFuZCANCj4gYWxsIHRoZSB0ZXN0cyAoZXNwLiB0MTUgYW5kIHQx
NiBmb3IgSVNPQykgcGFzcyBvbiBvdXIgc3lzdGVtLg0KPiANCj4gSG93ZXZlciwgSSBhbSBzdGls
bCBzZWVpbmcgdGhlIG9yaWdpbmFsIHByb2JsZW0uIFVTQiBnYWRnZXQgRFdDMiBkcml2ZXIgDQo+
IGlzIGdldHRpbmcgc3R1Y2sgYW5kIG5vdCBnZXR0aW5nIHRoZSB0cmFuc2ZlcnMgY29tcGxldGVk
Lg0KPiANCj4gV2hlbiBJIGFtIHJ1bm5pbmcgYXVkaW8gb24gdGhlIGhvc3QsIGFuZCB0cnlpbmcg
dG8gY2FwdHVyZSB0aGUgZGF0YSBvbiANCj4gRVAxKG91dCkgZW5kIHBvaW50IC0NCj4gDQo+IFvC
oCAyNzAuODU1MTc0XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19pcnE6IGdpbnRzdHM6
IDA0MmM4MDI4LCANCj4gZ2ludHN0cyAmIGdpbnRtc2s6IDAwMGMwMDAwLCBnaW50bXNrOiAoZDA4
YzNjNDQpIHJldHJ5IDgNCj4gW8KgIDI3MC44NTUxODldIGR3YzIgZmZiNDAwMDAudXNiOiBkd2My
X2hzb3RnX2lycTogZGFpbnQ9MDAwMjAwMDINCj4gW8KgIDI3MC44NTUyMDVdIGR3YzIgZmZiNDAw
MDAudXNiOiBkd2MyX2hzb3RnX2VwaW50OiBlcDEob3V0KSANCj4gRHhFUElOVD0weDAwMDAwMDAx
DQo+IFvCoCAyNzAuODU1MjE4XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19lcGludDog
WGZlckNvbXBsOiANCj4gRHhFUENUTD0weDgwMDQ4MGM4LCBEWEVQVFNJWj0xMWU1NTY4MA0KPiBb
wqAgMjcwLjg1NTIzOF0gZHdjMiBmZmI0MDAwMC51c2I6IGNvbXBsZXRlOiBlcCA4MjI0NzNiZCBl
cDFvdXQsIHJlcSANCj4gNzZiZjc3ZTgsIDAgPT4gNzc4ZGE5YTgNCj4gW8KgIDI3MC44NTUyNjBd
IGR3YzIgZmZiNDAwMDAudXNiOiBlcDFvdXQ6IHJlcSA3NmJmNzdlODogMjAwQDFjODIxZDRlLCAN
Cj4gbm9pPTAsIHplcm89MCwgc25vaz0wDQo+IFvCoCAyNzAuODU1Mjc5XSBkd2MyIGZmYjQwMDAw
LnVzYjogZHdjMl9nYWRnZXRfZmlsbF9pc29jX2Rlc2M6IEZpbGxpbmcgZXAgDQo+IDEsIGRpciBv
dXQgaXNvYyBkZXNjICMgMTk1DQo+IFvCoCAyNzAuODU1MjkyXSBkd2MyIGZmYjQwMDAwLnVzYjog
DQo+IGR3YzJfZ2FkZ2V0X2NvbXBsZXRlX2lzb2NfcmVxdWVzdF9kZG1hOiBjb21wbF9kZXNjICMg
MTkzDQo+IA0KPiBbwqAgMjcwLjg1NjI0Ml0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdf
aXJxOiBnaW50c3RzOiAwNDI4ODAyOCwgDQo+IGdpbnRzdHMgJiBnaW50bXNrOiAwMDA4MDAwMCwg
Z2ludG1zazogKGQwOGMzYzQ0KSByZXRyeSA4DQo+IFvCoCAyNzAuODU2MjU1XSBkd2MyIGZmYjQw
MDAwLnVzYjogZHdjMl9oc290Z19pcnE6IGRhaW50PTAwMDIwMDAwDQo+IFvCoCAyNzAuODU2MjY4
XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19lcGludDogZXAxKG91dCkgDQo+IER4RVBJ
TlQ9MHgwMDAwMDAwMQ0KPiBbwqAgMjcwLjg1NjI4Ml0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJf
aHNvdGdfZXBpbnQ6IFhmZXJDb21wbDogDQo+IER4RVBDVEw9MHg4MDA0ODBjOCwgRFhFUFRTSVo9
MTFkZDU2MjANCj4gW8KgIDI3MC44NTYzMTFdIGR3YzIgZmZiNDAwMDAudXNiOiBjb21wbGV0ZTog
ZXAgODIyNDczYmQgZXAxb3V0LCByZXEgDQo+IDVhZjRhNjYwLCAwID0+IDc3OGRhOWE4DQo+IFvC
oCAyNzAuODU2MzQ2XSBkd2MyIGZmYjQwMDAwLnVzYjogZXAxb3V0OiByZXEgNWFmNGE2NjA6IDIw
MEBmODgyMDk1MCwgDQo+IG5vaT0wLCB6ZXJvPTAsIHNub2s9MA0KPiBbwqAgMjcwLjg1NjM3MV0g
ZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfZ2FkZ2V0X2ZpbGxfaXNvY19kZXNjOiBGaWxsaW5nIGVw
IA0KPiAxLCBkaXIgb3V0IGlzb2MgZGVzYyAjIDE5Ng0KPiBbwqAgMjcwLjg1NjM5OF0gZHdjMiBm
ZmI0MDAwMC51c2I6IA0KPiBkd2MyX2dhZGdldF9jb21wbGV0ZV9pc29jX3JlcXVlc3RfZGRtYTog
Y29tcGxfZGVzYyAjIDE5NA0KPiANCj4gW8KgIDI4MS43MDA1MzddIGR3YzIgZmZiNDAwMDAudXNi
OiBkd2MyX2hzb3RnX2lycTogZGFpbnQ9MDAwMjAwMDINCj4gW8KgIDI4MS43MDA1NTJdIGR3YzIg
ZmZiNDAwMDAudXNiOiBkd2MyX2hzb3RnX2VwaW50OiBlcDEob3V0KSANCj4gRHhFUElOVD0weDAw
MDAwMDEwDQo+IFvCoCAyODEuNzAwNTY0XSBkd2MyIGZmYjQwMDAwLnVzYjogDQo+IGR3YzJfZ2Fk
Z2V0X2hhbmRsZV9vdXRfdG9rZW5fZXBfZGlzYWJsZWQ6IHRhcmdldF9mcmFtZSA9IDB4MDAwMDEz
ZDANCj4gW8KgIDI4MS43MDA1ODBdIGR3YzIgZmZiNDAwMDAudXNiOiBkd2MyX2dhZGdldF9maWxs
X2lzb2NfZGVzYzogRmlsbGluZyBlcCANCj4gMSwgZGlyIG91dCBpc29jIGRlc2MgIyAwDQo+IFvC
oCAyODEuNzAwNTk0XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9nYWRnZXRfZmlsbF9pc29jX2Rl
c2M6IEZpbGxpbmcgZXAgDQo+IDEsIGRpciBvdXQgaXNvYyBkZXNjICMgMQ0KPiANCj4gQXQgMjcw
IHNlY29uZHMsIHRoZSByZXF1ZXN0ICMxOTQgd2FzIGNvbXBsZXRlZCBhbmQgcmVxdWVzdCAjMTk2
IHdhcyANCj4gcXVldWVkLiBCdXQgcmlnaHQgYWZ0ZXIgdGhhdCwgdGhlcmUgd2FzIGEgMTEgc2Vj
b25kIGdhcCBhbmQgdGhlIHJlcXVlc3QgDQo+ICMxOTUgd2FzIG5ldmVyIGNvbXBsZXRlZC4NCj4g
DQo+IEZvciBzb21lIHVua25vd24gcmVhc29uLCB0aGUgRFdDMiBjb3JlIGp1c3Qgc3RvcHMuIFRo
ZXJlIGlzIG5vdGhpbmcgaW4gDQo+IG91ciBzeXN0ZW0gdGhhdCBjYXVzZXMgaXQgdG8gZ2V0IHN0
dWNrLiBUaGUgaW50ZXJydXB0cyBhcmUgbm90IGRpc2FibGVkLiANCj4gVGhlIFVTQiBzbmlmZmVy
IGRhdGEgc2hvd3MgdGhhdCB0aGUgZGF0YSBpcyBjb21pbmcgaW4uIEhvd2V2ZXIsIGR3YzIgaXMg
DQo+IG5vdCBydW5uaW5nLg0KPiBBZnRlciB0aGUgdGltZSBnYXAsIGV2ZXJ5dGhpbmcgc3RvcCB3
b3JraW5nLg0KPiANCj4gSSBoYXZlIGF0dGFjaGVkIHRoZSBsb2cgZmlsZSBoZXJlLiBDYW4geW91
IHBsZWFzZSBoZWxwIG1lIGZpeCB0aGlzIGR3YzIgDQo+IGNvcmUgaXNzdWU/DQo+IA0KPiBUaGFu
a3MsDQo+IFBhbGFrDQo+IA0KPiANCg0KQmFzZWQgb24geW91ciB1c2J0ZXN0IHN1Y2Nlc3NmdWwg
cmVzdWx0cyBmb3IgSVNPQ3MsIGJvdGggY29yZSBhbmQgZHdjMiANCmRyaXZlciB3b3JrcyBPSy4N
Cg0KQXMgSSByZWNvbW1lbmRlZCBlYXJsaWVyLCBwbGVhc2UgdHJ5Og0KDQoxLiBEZXBlbmQgb24g
d2hpY2ggdWFjKHVhYzEgb3IgdWFjMikgeW91IHVzZSwgaW5jcmVhc2UgDQpVQUMxLzJfREVGX1JF
UV9OVU0gIDIgdG8gMzINCg0KMi4gQ2hhbmdlIGRlc2NyaXB0b3IgRE1BIChERE1BKSBtb2RlIHRv
IGJ1ZmZlciBETUEgKEJETUEpIG1vZGUNCg0KVGhhbmtzLA0KTWluYXM=
