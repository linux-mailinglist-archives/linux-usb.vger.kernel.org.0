Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C23966A6D8
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jan 2023 00:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjAMXQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Jan 2023 18:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjAMXQa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Jan 2023 18:16:30 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B858790E
        for <linux-usb@vger.kernel.org>; Fri, 13 Jan 2023 15:16:28 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DJ9t3K030860;
        Fri, 13 Jan 2023 15:16:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=6GfAVCzzzUok0Qh27PhQ2iCc33QyzA/ly/O542L20lQ=;
 b=rhnd5VX/AQzQYO/EkX9UycZGoSrUYyQVSx2qa3LGF+hwY5oNMHpnJA7CfErUYuzE2KTz
 vEFuB4qVR7v5svHN7zq7DGZkySm2IijxJK2pPRVlD0fY9AcDX9lPmTs8FKWl1mIoLgNS
 +g+KWpSgvgiy6nUJTwjifi1QvACc9LdfKshlB1D0h0u6iGKcgAmlMd5/D94eMvvx0b4t
 U+PSPMNKxkFD+s7uomNYT4h8ZnYpTB58+K4zFM4WZKZZAsr4QbeH4Xofucfez/CzTI9K
 gFKEQu0Qaq0ZSF9lgC615LC30NVE7fNWu6i0SgsMVeRBcnVkr7gL+9lcaewQudsqROoX ug== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n1k4tx2gn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 15:16:20 -0800
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F88540101;
        Fri, 13 Jan 2023 23:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1673651779; bh=6GfAVCzzzUok0Qh27PhQ2iCc33QyzA/ly/O542L20lQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=FFCyzaL5jnCLU6EcpMgpFCY+boFmF8rISf+lKBXJX1CuGEK1wpuXw+3qafeC5BXT8
         KnvZ320tR+pqYAcXH/WceUMcKCzg+zsjN2rtLJVjQjEFUU6jI5f1CEV+OIos8nKLgI
         Ogn5UsUi2BmEWDeXFhAwdAzuF2kf4jqErnWdL5ye38FrOakC8MhyD5T08VhUFkD3zW
         WVq42YvrJoere+U9Q47Ok3yin5Rn/xzGcg61UyAx//P061JsNpWrOoHKwvAXHBoCl3
         rWoP/zF8VCmWVn/htM9GSMWdPIPPDLSkBHAWmcXBHBc3LhwgoRnwWQYkjn/ZSKMBnp
         yV5WueBqRQLWw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C3F43A0083;
        Fri, 13 Jan 2023 23:16:18 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A625E80199;
        Fri, 13 Jan 2023 23:16:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="I8VQs/Z7";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOZVvx8UoU+hdnRHJAxG9m6ALagjFEFV21axkNwJxBFfINIkrm2HgF0hULlWu9MAUltkJnYIunvLuD4/J+rpg36VFuQrfEyAyBtI0MLvbrClBb9MypzxVtXgXU/F7jobypX3sSdLmMIbGl2w3tHE94VIp5Wg1Ql3nJbYzbl8pNYqMSwBIUpU5OFJdGbq+OKx6156Yi/vz0q1RT8D9IXOLAl7CkNtCWRW0Wr6OX+9Z9rC2nWulYB4GqJ38bqS3x9oOvp5jDTP1w2gXUUNSKZiOuaRDekVZfxJ2a4jR7aP47GfWkCmzfehLj205NeODS5PwNSjGYtd3L7KrSlCW8HG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GfAVCzzzUok0Qh27PhQ2iCc33QyzA/ly/O542L20lQ=;
 b=h83Dybg7Jsi6YGK9ZotuvaQ37nEZLq+eOd0Aqed1LEB9NMeRxbDGLTVbvQ0vTh8otdYxPztkSLVvci7eMQ+O9W5EZlZnjhMSiqeBykTQbJB20vyQV64u4MlvubDeocM5cOW8ZSaOsIOzCb/G1YJHUQTK/fpvfXJa9vRw635RH8r4sbOH0hP0bbP6dGOmiK/NxrYCToQm8tvaz3gDZUBMAWVd53+H+v2fOF3pOqw8PKjPaG2+cu9PTrN/KJ4KKJjCDOkyaBcGFvTDjEanb7Af7T5OMM7motQQjFu59+qI6A6drNWnR9kuqe5ZBXy3I8lLdaxGKKMKIaqXP/AtZLk4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GfAVCzzzUok0Qh27PhQ2iCc33QyzA/ly/O542L20lQ=;
 b=I8VQs/Z71jBkwxlHuFihyFg7ZWg4up46UqbwSHA3TsxQQDGI3CN6OJZSM+2bnARTxtqBMCRPRd38crEi36+z51sxA4jmW2Gw+5NDe+mqIfNxML9H96SR3EgiLiaHyoZJTIGPuQOB7KDYedkwz6DkdvQ6RgHkB2qzjGoAQ8yFmYU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 23:16:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 23:16:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbBPDcqFUUga/0S7en4fefnHfa6Vct4AgAACR4CAA2I5gIABN2uAgAGE/ICAABi+AIAAC3OAgAAB+wCAACFWgIAACJoAgAEinYA=
Date:   Fri, 13 Jan 2023 23:16:15 +0000
Message-ID: <20230113231533.yzspircp5nicrzkc@synopsys.com>
References: <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
 <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
 <20230113010841.ougwmotzlm56nciz@synopsys.com>
 <68d3e800-afe6-9e27-e4e4-3670696abd9a@quicinc.com>
 <20230113031813.zozc3v4m2m3jybrb@synopsys.com>
 <f11c96ce-1ae5-8f59-6d1a-3b35cf45f301@quicinc.com>
 <20230113052437.faywn7ev4bop4q5i@synopsys.com>
 <d89d472f-14be-821f-7da0-c82031efc651@quicinc.com>
In-Reply-To: <d89d472f-14be-821f-7da0-c82031efc651@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS0PR12MB7769:EE_
x-ms-office365-filtering-correlation-id: 6fbe9bc8-8e6a-4bee-69a9-08daf5bc2b26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RUw8ySE4g34xKQU+okgTXomXbaz9zXfThaH6Q6ATC0fhzqY6MjV/Sj8lcdWNyc43uzCy+ELe4yZig5TEtoApoRNeUH1XGGkaUvATExP8n3SBw+oZ6gLgxsXiW481/XsmlOTNezXizY3ei4J9hOkGr/io5sRAFjHq1e1ISCuSdFaZ6jWOGgpJ+9K615NbtFOmMr1gKOIbXm2q4DNYgP5lzU872Oo4e+Gd1Tf1lrzVu2JeF725VElity10JR58HYQhC52AO9VpYD26bSVrTQh58qId9wzTubZjrrgVLVTisJlTH6Z02mwj5vMfkobqRlhepF02FC7dS1T8Ukbbha8OoaYWX7VcUhs2TQfJXCd5uDrfxA9lNle733K1IYbKa1lx9XTWb+0mV2TXbMnmeSn7LO4IAXQd5+nfsrtNOZpJxKsFCt3qDXAsmBudF2xjA46CzBoGPGenLr7EMKk9vEVByqM1eC63dEExnc4ivrOIkFj4aMdnl4HMc//++kozJjx2B0Rq8XRCIudCGPGi8sD8zfK+qndS4hK61nHtLTsbnxyyovUWFWZxKwFfK9rFEJW2H2POz5IO9dtouE+EBmRHuCStxDXUDrpEgbzc60UkJQRQCWkmLNtY/e2mlssyl09nST4JrBALlO+TIhfqm7aoO4aKAem8Q5I16K0bRBehpKaGA40s6sVTy7zZYCEdejdO9Oo68+ylAKAgxM/BSMNIFRne66hZ8IaNE+QTyrIKV7U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(2906002)(83380400001)(316002)(66446008)(1076003)(186003)(5660300002)(66946007)(64756008)(66476007)(66556008)(8936002)(122000001)(6916009)(36756003)(26005)(53546011)(6512007)(6506007)(2616005)(6486002)(41300700001)(38100700002)(478600001)(8676002)(86362001)(76116006)(54906003)(966005)(38070700005)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm9lOHIxWW1EMCtVbUFlMUZsNWxhOW45TXVKTXMrTkRiSjIvZzBpSkVPWVhi?=
 =?utf-8?B?UU5sMm9ISFUwRllFVFI2L2dsYTZ2NzNUNEo4Q2dtSG9nckFmOExYc0h1SG1S?=
 =?utf-8?B?NGZYckRxTnlrbUVCTjhSNnhoWDF4cHcyQXVkVk15ald6NDBtSy9YZ21ZdjU3?=
 =?utf-8?B?QmJ6b3VNVmFvcjkzZ0M0c2pmblhLZWdxVndVeEpLTFRLS2xPeGRMbjk2NG1x?=
 =?utf-8?B?b1NWL1NqWVpHTXU4RTgrQjZLa0RWSlZDSzh5WisycEJOcVdTelR3ZmR4dUZY?=
 =?utf-8?B?bUZhT2RRKzBkeWJieTdjVk1ST3ZaKy83Q2tVb3A5ZVNJcWVrZFF2QUJiSkIx?=
 =?utf-8?B?OTFHeVUxWFpOZ2JUR3ZxNDdpZmdyNFVhNGNMOTBOK1psZFhia2swM3dkYjRS?=
 =?utf-8?B?dFluSm16bFhzQ2tDZkhNYjRuV2xQbmh4cEVzTkNZS0d0UGlwWjFWQmR1Wlkx?=
 =?utf-8?B?QjhSNlQvWnlUNGRPekp2WnoySDlidmZHTGJIaExpZ3QyRjBiU2RFOEJ0VU11?=
 =?utf-8?B?dUlHUlowQllRTUM2ZVNEbDJzbmN5Z2s2L0I0cG41MnZUSXBuRmlJajYyRFlF?=
 =?utf-8?B?SzJjbU5BQzRCSldqS3JQRVpUbnNVOUxQeXBsU29nOUVUY0tXSVp6UHAxaWg2?=
 =?utf-8?B?QWkrSHgxSHZ1bldvTUQ5RVg5TUxnVi9SeGxPQ21pN2tlTGk5UzRzRDhzWUNF?=
 =?utf-8?B?SkZhRHAvR0NFaXpSVEpibmt6OTllaDdsYmZDdithaWs3UGpYdjhiZ0ZZT01U?=
 =?utf-8?B?T2JBdmtCSkZoQWZtNkk4ZVdDNGxybWhNKzhTTk1adUdiVFpUVE14MHpyRXFN?=
 =?utf-8?B?RnVrTzllMEN3aTFkbWJDMmZMYVFGWnc0bmxIMm9KRE0yUEw1VHFnN3VJZXAw?=
 =?utf-8?B?dmpDZzJFWUk0ZFIwMG1JdVNyalVwb3ZDRkJSMEVKbnphMjRwTVZucmwrRGFp?=
 =?utf-8?B?czhNWGVSbFlKcDMxYjBrdXJ5K1lQZVZVZVhXRGVwRWtiRDkwR1hFbHFTaEVJ?=
 =?utf-8?B?OVpZaVh1WnpLTVlMK3FjbzA1UkYzVzNObHptSUVLME5nS09aajFJOHZhVGNj?=
 =?utf-8?B?aDhjTzBxcUZaQlJQNlRtZDBjRTBjOTFwTXBac29uNFJHK29laFA1MWpQNWtN?=
 =?utf-8?B?cmVMZEZQMXA2SnZHdEk3TUtjcHF0bWZYQSsvZGFla0g0NGdUYjl0azA0K0Rl?=
 =?utf-8?B?Z0c1aGhrMDZXemVTWG5UK1FOMUlHSWRpcExPaG5aS2dkaFJuZGpXbG1kaFY1?=
 =?utf-8?B?KzkwVy8ybytWNFR0eGFPR2htNlpsekl3UG5WMUhCNFhUTFpOY2pVbk1WMysz?=
 =?utf-8?B?OEFyUk9lWUkrUVM4SjRuTk0yWnZVcnJUZVNYVzNBVXZNejNZaHpqeUsrOFF4?=
 =?utf-8?B?MmhmL2xrVzdHcS9qd1NlRkpaTTM0eE9LdnJIb24zZzJ0ZDhwbHdCVjRiU3gv?=
 =?utf-8?B?QXpwQ01CSnE2Qmd1ZGRCTXZYSC92L3VOVHVlMFZ0QTIwQmZSUTVscXRVZ0Ji?=
 =?utf-8?B?RUFXcmJDTGJjVkZ6WkphTGJlQTEwQWx4a3p5QWI5eG1MSUhLejVraS9IK1Fi?=
 =?utf-8?B?c3o2eDlrYVJHTkR2aTg0Q0s5MVZOMlBYbkF4NTRXb0plcUpCYm03dGxCdlpN?=
 =?utf-8?B?MWdORU1CeXJxSjgxbDU4SEQrOWRYN01IQTBYRFJ1NGVoQXhkdzJ3WmtZR0ph?=
 =?utf-8?B?SHN1eFF6SVpyY0FZNVoyaFlVWk8xZFBpZExTNmVOSnlqQ0htcG4rOS9zNHZ2?=
 =?utf-8?B?bjMxeFVVOVJXcmo4Y2t1aUwxc2QxWFBSbHlOK1kwUDZSVXl1ZlNHRi91N3BU?=
 =?utf-8?B?NXpIejZydGdEWGxqbm1zeGJtd0VuUEh1SVA4VnJndUdSRUJkd1UwNTQwK3kw?=
 =?utf-8?B?YjRTVWU0MjNWVGdXRGNXVVoxczh2eFhWZCs0K1hRUVlIOFBTbWsyV3B3R2pl?=
 =?utf-8?B?ejRVUXNXa0FQeHhERTVsMnEzZzNFYzFsYnk0S21MSkd2ek1MSE5WcVorMXpp?=
 =?utf-8?B?cEordUM5MFluMitWeE42eEVIS1pHNHVhRE4rREl1Qm5NTG80SDBrdlhjbDNk?=
 =?utf-8?B?L29zeUR3SStYNXFPaEhlSmpmYkdkUGRpOFI2WFRUQW94ZWdyR2VDcUo1RnY2?=
 =?utf-8?B?emhtVWFVWlljOWlwSU96cWZJaDdGa2JJQUdYTjRQK1g5U3N2Vnk5QWVHcjRt?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CA0FD3C364FDE449A6DB318C94B109A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: d7bGK7KRqMuNT5xEBf49OxCrHFRRQyfHsC3ZtM/2yqu38dx1fTsBZBhfUgkktxpqdQAwcW/lBzHzyD3dMdG0vwuNK1BQlZbeuNKvogQhaG/IpdlSADp9UkYS8Y9KU0Du4Q3eTVEt6CedzKsCSq9sjCYZrESi5cLNCCEFGXXKyjS4Y1llquF3NXJDB/WSsi6e5T9Cr4QXCsk+cOA9LXJhhfWDaeI/1LGAVZTE04Au+4eE1TyWIjG1d81O66quQxCmlmZy0LFU1Nhv/x22YzIPvKOADhsXcD1grgFs9U3NxKLaGJA4e2DBiHXX3FQ5bf4TkPABEVKLFxyJtaknH0gDzCd9oWXptYWtjTSLzkuGskdCUL2DHfF5RhwWGB9Gd4Xsd2hM2b3ecTepMggeCpYSyBi3OkPIOrg+S6K/8vlBTlBxg/oyiduWRmyQgvAi1R29m5Vd9JfTzPKqS8U8vut8/W7HG31sZOGCS6M3oGAd4T8PwnBt2TRfRf4IXsPbluOlGaBoJUWOJOz/PrkJAf+hyXiYqg1NtdYQjnTIsj0isu6TLA3xjyA2r14JfCvbiriNcFSzJwKKCeP41ktMsp24osWM76PUryknbk/Lc97YX9w9aYopDkEQfLYpJ2+NXhX1utPMMMqBumcbRhHbQ/TIUWIZWRLOuCyNHU7HCU7SuRXRaDBkk9CB1Y9WFVaTWMFtuuxoCst+KrW6HeM8aVLkULezSy/EUj3cNrEvpPnn6khZiqfyJ0rufF7C0hsYQvZiWPuuQ5OU+xZillVQslHmbSZf11IeEoCahFbg3ua9VULvDAWkb/wij1lHYADn1de9BUkmkzEXNqOV+I9v0x4xgngUOD+EWJTvY6Vugsq1BSS/kBQJ2DglTt+M1BXu2+KC6RCUW3vyTQt/mz2+tLXfy7Dz/4Sg/bK/V52sqct8Fn8=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbe9bc8-8e6a-4bee-69a9-08daf5bc2b26
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 23:16:15.2628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yXFatNtM+rDgAZFleryPyctmDrXZjXTYGwa943iDkASFW+ZHGgVjemdgelpg+yw4XtEJmORn4XH06nant6R2bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769
X-Proofpoint-GUID: 4hmIatxIb2i3JyXWEvDKLQxQyyIC8G0y
X-Proofpoint-ORIG-GUID: 4hmIatxIb2i3JyXWEvDKLQxQyyIC8G0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxlogscore=679 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301130160
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBKYW4gMTMsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiAxLzEzLzIw
MjMgMToyNCBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IA0KPiA+ID4gPiA+ID4gV2hpbGUg
c29tZSBwb2xsaW5nIG51bWJlcnMgc2VlbSBsYXJnZSwgd2Ugc2hvdWxkIG5vdCByZW1vdmUgdGhl
IHRyYWNpbmcNCj4gPiA+ID4gPiA+IGV2ZW50cyBkdXJpbmcgcG9sbGluZy4gVGhlcmUgYXJlIHVz
ZWZ1bCBpbmZvIGluIHRoZSBzdGF0dXMgcmVnaXN0ZXIgd2hlbg0KPiA+ID4gPiA+ID4gdGhlcmUn
cyBhIHRpbWVvdXQuIEFsc28sIHRoZSBudW1iZXIgb2YgcG9sbHMgbmVlZGVkIGZvciBjZXJ0YWlu
IHN0YXRlDQo+ID4gPiA+ID4gPiBjaGFuZ2UgaXMgdXNlZnVsIGRhdGEgcG9pbnQgZm9yIGRlYnVn
Lg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBXaGF0IHdlIG1heSB3YW50IHRvIHVwZGF0ZSBp
cyBub3QgZGVwZW5kIG9uIHRoZSByZWdpc3RlciByZWFkIGRlbGF5IGZvcg0KPiA+ID4gPiA+ID4g
dGhlIHBvbGxpbmcgZHVyYXRpb24uIERpZmZlcmVudCBzZXR1cCB3aWxsIGhhdmUgZGlmZmVyZW50
IGRlbGF5Lg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJZiB3ZSB3YW50IHRvIGRpc2FibGUg
aXQgZm9yIGRlYnVnZ2luZyBwdXJwb3NlLCBtYWtlIHN1cmUgdG8gaGF2ZSB0aGUNCj4gPiA+ID4g
PiA+IGRlZmF1bHQgb3B0aW9uIGFzIGVuYWJsZWQuDQo+ID4gPiA+ID4gaWYgc28sIGRvIHlvdSBh
Y2NlcHQgZGVmaW5lIGEgbmV3IGZ1bmN0aW9uIGFuZCBuZXcgdHJhY2UgZXZlbnQgbGlrZSwNCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBzdGF0aWMgaW5saW5lIHUzMiBkd2MzX3JlYWRsX3RpbWVvdXQo
dm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0KQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IERF
RklORV9FVkVOVChkd2MzX2xvZ19pbywgZHdjM19yZWFkbF90aW1lb3V0LA0KPiA+ID4gPiA+ICAg
wqDCoCDCoFRQX1BST1RPKHZvaWQgX19pb21lbSAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVl
KSwNCj4gPiA+ID4gPiAgIMKgwqAgwqBUUF9BUkdTKGJhc2UsIG9mZnNldCwgdmFsdWUpDQo+ID4g
PiA+ID4gKTsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBsZXQgdXNlciBlbmFibGUgaXQgYWNjb3Jk
aW5nbHkuDQo+ID4gPiA+ID4gDQo+ID4gPiA+IFdlIGNhbiBqdXN0IHJlZGVmaW5lIHRoZSBldmVu
dCB3aXRoIGFuIGFkZGl0aW9uYWwgcGFyYW1ldGVyIGZvciBldmVudA0KPiA+ID4gPiBmaWx0ZXJp
bmcgb3B0aW9uLg0KPiA+ID4gDQo+ID4gPiBhY3R1YWxseSBmaWx0ZXJpbmcgb3B0aW9uIG9ubHkg
d29yayBhdCBldmVudCBvdXRwdXQgdGltZSzCoCBpdCB3aWxsIHNob3cgZGF0YQ0KPiA+ID4gbWF0
Y2ggZmlsdGVyLCBpZ25vcmUgZGF0YSB3aGljaCBub3QgbWF0Y2guDQo+ID4gPiANCj4gPiA+IHRo
ZXJlIGlzIHN0aWxsIG5vIGZpbHRlciB3aGljaCBydW4gYmVmb3JlIGV2ZW50IHNhdmUgYnVmZmVy
LCBldmVudCBzdGlsbA0KPiA+ID4gc2F2ZSBpbnRvIGJ1ZmZlciwNCj4gPiA+IA0KPiA+ID4gaWYg
cmVhZCBoYXBwZW4gdG9vIG1hbnkgdGltZXMsIGl0IHdpbGwgZmx1c2ggdXNlZnVsIGV2ZW50IGxp
a2Ugd3JpdGUNCj4gPiA+IHJlZ2lzdGVyIG9wZXJhdGlvbi4NCj4gPiA+IA0KPiA+IE9rLiBXaGF0
IGRvIHlvdSB0aGluayBvZiBhbHNvIHJldml2aW5nIEp1bidzIGNoYW5nZSB0byB1c2luZw0KPiA+
IHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWM/IEl0IG1ha2VzIHNlbnNlIHRvIGNyZWF0ZSBhIG5l
dyB0cmFjZSBldmVudA0KPiA+IGluIGFkZGl0aW9uIHRvIHRoYXQ6DQo+ID4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi84N2JsbXlt
d2x6LmZzZkBrZXJuZWwub3JnL1QvKnRfXztJdyEhQTRGMlI5R19wZyFiZ2VONE1wOWh2MmIzM0Jw
SjdRUkFYQWRtLXZnYWZndXJ4WFAtWVNkUXNkV01aa05GWG5XVjRxWE5UNGlDVHpfMG1MTUh5bHc2
Wjg0SjVJVlBZWm5yb2o1ZWlOUW53JA0KPiANCj4gDQo+IDEuaWYgeW91IHJldmlldyBhbGwgcGxh
Y2VzIHdoaWNoIHJlYWQgaW4gdGhpcyB3YXksIG5vdCBhbGwgb2YgdGhlbSBjYW4NCj4gY29udmVy
dCB0bw0KPiANCj4gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYygpIEp1biBpbnRyb2R1Y2UuDQo+
IA0KDQp3aGljaCBvbmVzPw0KDQo+IA0KPiAyLiBhbHNvIGhpcyBjaGFuZ2UgYmxvY2sgZm9yIG1v
cmUgdGhhbiB0d28geWVhcnMsIHdpbGwgaXQgYmUgYXBwcm92ZWQgPw0KPiANCg0KUHJldmlvdXNs
eSB0aGlzIHdhcyBkb25lIHRvIHJlc29sdmUgYSBzZXBhcmF0ZSBpc3N1ZS4gSXQgd2FzIGENCmNv
bWJpbmF0aW9uIG9mIGEgZml4IGFuZCBhbiBlbmhhbmNlbWVudCB0aGF0IHRvdWNoZWQgb24gZGlm
ZmVyZW50IGFyZWFzDQpvZiB0aGUgZHJpdmVyLiBJdCdzIGJldHRlciB0byBrZWVwIHRoZW0gc2Vw
YXJhdGVkLg0KDQpJTUhPIGl0J3MgYSBnb29kIGNoYW5nZS4gSXQncyBiZXR0ZXIgdG8ga2VlcCB0
aGUgcG9sbGluZyBkdXJhdGlvbiBjbGVhcg0KYW5kIGRldGVybWluYWJsZS4NCg0KQlIsDQpUaGlu
aA==
