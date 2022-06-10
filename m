Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B50546BD6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 19:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350191AbiFJRpg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 13:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350189AbiFJRpc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 13:45:32 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6B455493;
        Fri, 10 Jun 2022 10:45:22 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4653640B35;
        Fri, 10 Jun 2022 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654883122; bh=+B/lXyZlNIgtoSpGkv2z7hkRont3jyaDys3slGo3sxc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gaOAgsZNdn3Nsi6iGW9WRDXYIxxju2uGWXjyXjY3bvqKQNcpvJJS15vb8NvlmVagV
         cUFFh29uv3V38lQc0R96I1eCYrkzVZ52vl66ZPv1GkGTOTOcKm1sGuga7ScC+r5Bbe
         OyibEoeJ9rgqU7JqjOIlV3jtFgwhPemFTvmooK3YZA3yuCsHXLQKQH0jQ+r0bR76Tk
         74ojFpqkcoz08x7PBx9a0ci+d0/ZWXi1WImab1LhnWhSEy619jI/8rLtW4YnXMEj1F
         RyT1w9xwIe4j0kOfLIllmVR5Ld0JB/XTD+cJuwaPvLMFrUuxUoqlOVBxYf3pFx6vgs
         Z8MwbXdsKrluw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A1E9FA0077;
        Fri, 10 Jun 2022 17:45:19 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C13DD40060;
        Fri, 10 Jun 2022 17:45:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="my4LzZcL";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYUZEUjlgXOo7QvLVqFzEF9KwMfUEvSLSxA0m1YwIqW0V2Sw8CXgg9+QwYpEtZQ1HK932tAqwfn0PIL3+x6emNSENZuVBSa9nqLCH2ugIlnSaMkueK7VYd/Vg1JCG4SnVEC6GbQ8bGmJXaY9VXJDbaBC9DVmbqNfVK6hQbYKJnuYpWOah/Z5uJM28xarjlvNZ/UD0C9F65l1Ji9yYMbPFZs0ozV3iTfVUvRmlNVnjedvkzCY6hPSE8sh+KtVQB5KIcuv+HCLavqzwjG6MSnBqhQjdVZlqZjjy3AYR4HMKTFu9t7EB7bQ46Vs0+CUWzO7RBSGrbt5/iq5i0Ss5XbWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+B/lXyZlNIgtoSpGkv2z7hkRont3jyaDys3slGo3sxc=;
 b=JXBF6GTaWeCbIjtFAv5gHs1TewRNvbAtn/47iOHFbMXVtblYchnOoAwXFEd6yCJ3sf7hV8sz0ay2CJaaWWWrSp5AG4Yavp//TlyQhl+U4H1xwRtZPtoE2JfWmVEcr/YC4vnqGiKQ5RCj3egHcs1GKZC+eFmNvWoJhVWMF9GNYEZKuSEXQVM76jz6m9hAGngU3F6iqZJzYolRSykqH0lfk9/ynwR44Q6MBBsZ/XwSEF5CUfvRTo5JUfUbZinWL37u/h5atlmpS2pf6RDN6vmQtgfxhTxL8/L8rcQFAIY17zr/llMllAULd7KNRJg63ulTNVH9Pwk1y9ZPpdM+alA/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B/lXyZlNIgtoSpGkv2z7hkRont3jyaDys3slGo3sxc=;
 b=my4LzZcL5UD9fVs+dp50WQ7ZSA20vS98M7sVQ3QJ7UOfNydnwIZitiM1BA5j1RsHbq8Rpkpd0yzmhxTi7PuuINLiu7+T8KLoPqm11wGI13sRT+Mz9s3eafJ/nFWHZYkRX7DpIaZmT+embcqRjiTyFEjuZE+1bMLkYD0DE/Mxu/k=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MWHPR1201MB0112.namprd12.prod.outlook.com (2603:10b6:301:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 17:45:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5332.012; Fri, 10 Jun 2022
 17:45:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: usb: usb-xhci: Add xhci-snps-quirks
Thread-Topic: [RFC PATCH 1/4] dt-bindings: usb: usb-xhci: Add xhci-snps-quirks
Thread-Index: AQHYd72JFLoQNdcsr02PVVu1koiI4K1HYtMAgAAGeoCAAXw0gIAADrKA
Date:   Fri, 10 Jun 2022 17:45:15 +0000
Message-ID: <332fe527-44a4-6bb1-d1c8-45469b52985c@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
 <1ff0422b36c32c0b8b76f99333ac785f275edd4d.1654310542.git.Thinh.Nguyen@synopsys.com>
 <20220609174840.GA4015807-robh@kernel.org>
 <6873a12f-448f-214a-ca01-a08f65ddb0ee@synopsys.com>
 <20220610165239.GC1787330-robh@kernel.org>
In-Reply-To: <20220610165239.GC1787330-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 985f4b8c-96c6-46fd-8130-08da4b08fa55
x-ms-traffictypediagnostic: MWHPR1201MB0112:EE_
x-microsoft-antispam-prvs: <MWHPR1201MB01128E1B0B1D4284392C97FBAAA69@MWHPR1201MB0112.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBiz+TuPIzMxSYzW/efcjeBRytJzJyQnjqo8R2Nwm0vqOyxDkdqq0ywJ//aHRvWKwvgzjpD+uyIi8CkxYOnDosiZbb4RhY4j5tFEFqUaQ1MjDL1Ji77Acw+PE3Qap/iMjvIrzsjXDwfbNAbs/yt9VMEl1Npt9cA8bvhD46Y1lvIT8iwAS95ptC9ODnFPgF5u7xtcKiRUW+PLf5A62oaXK1tKrFsySgfe+KKFyjM1I2SJxIiMaxd+iM3p4v4tvYjixvC6/NXnuG18WIepfNRusdSHaM8+LFfx4bBo5YfieVdbNbsWgmMRog1caP7tx87Sz5rfRXG9lpsJ36iW88DyQcetAtGgnCTqcrCM9/XSZ8WY1AiuI27osPB19JEo0ENz5EkIisIGAI/RhFnty6rZCc8mTX+2qGGsVaqAqT4tT+qBnulAuZx3vpRRWB5HE7/QM6CSd5+cbOXoQRH5lletWZ04PfVNOydxsIR2hz7/EzZ90KCqGVUOU82H+BcSSI5KR8smqlY1/0Cq93JRnM47l1Vkif+qJghVb8jmW4VsmKM6d6wkgexfhINeg3h8hHbK3NZWIqd2+uazvHwUPhR7N2iOl3sl9ZIKyICx1j65xNhkj4oVStIKt5Mdmcf8sc2xR2Op1aQW24xzd/3PDXAgKccOmkqxUjvg3NApuX42Z0uJoVgHCoKmFzrdKIi0qYbyI+kdL+g2P45xFY5jELpumbq0wnq/5oqXlGHPwBXdVEclUrcrmNgWcDfA2/KK2y83X+pTB9JJJfkGDgsYtay30A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(66946007)(66556008)(66476007)(76116006)(31686004)(4326008)(508600001)(6486002)(122000001)(26005)(38070700005)(6512007)(6506007)(38100700002)(83380400001)(8936002)(2906002)(86362001)(71200400001)(5660300002)(66446008)(64756008)(36756003)(31696002)(54906003)(316002)(110136005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b20xRUhGUklRWW0yN0RUajR0QS9ITlo4ZkVEaFRCdmtVaGV0VGZLY2lvUm9V?=
 =?utf-8?B?cDRIRXEyZ2pJUGF4eFByY2FmWGprUHJ4VXJVT0NSUkt0YmJoQi9GOTBMVC9W?=
 =?utf-8?B?bGNNQlpDdE8vNHplQjc2eG03emNad2piUkFuZk5SOHNVUFpWTnlvdUFDeU43?=
 =?utf-8?B?a0wrTWg1Kzd5RHUwamVNYWgzaWE3WkRFZW1WTmRUNEkyenhRSnluRmQ5ZW0w?=
 =?utf-8?B?NEc0czd3SFl4YlZ4Kzg1M3NOZ0xZZ21uRWFjRVAvM3FLdTYxQmxVVWk5SlpE?=
 =?utf-8?B?L01JWVdNVGZMNEdFT2xVN0lBYWlhUnNQNkRwbExIN3JDMzdYcExoMGtqSzN2?=
 =?utf-8?B?UEpNUWc3Z0hKQko5ZFkvc0ducnJsTUxNSXJTUlYxZGpqM0IzY0E3anhzVmpX?=
 =?utf-8?B?eWwwTkFkYW5ib1V1U1J6TU1wckFORVZsUUZ6TytRS2Z2V2I2QWJUV3V4a2hr?=
 =?utf-8?B?d0pvUW5ydVh5VFdjTEYwMUM5eHFuUmFsYzEzRDd2MlhxWWlZMlFiNjdTUFBM?=
 =?utf-8?B?WCtSN0VsY2JQOUdWd2xpOEMyV1RkQ29ocTBHak5MOGh6Qkl6ODV0ajQ0ZlZU?=
 =?utf-8?B?ajRsZXM3dE8wblp0bGJqSEZxREh1dUtTRHF0QytabjRsTWFGKzY2c20yQUhv?=
 =?utf-8?B?YkVhQUxSUE95dTRKYzE1dUs1UnlqWXdjL1lDY211ZytCNFpaRHh1MW52dFBJ?=
 =?utf-8?B?WkdWTXMzdHFzcnpsMXBpbkRSNUZTSTBQck80SjFGZGRwTzZsdVhvUnFuVlVT?=
 =?utf-8?B?d015c1UzYTMvTHhjZlZidzZWOERtT2E2T2lMdm92WUlKeWVwcVFna09OT2xH?=
 =?utf-8?B?U0lzUzFpTUk4dkV0M2pvc0RVU3QrNk51eHFlS1dHTml4WXEzbzhMRytNVUs2?=
 =?utf-8?B?a2duUURGeFJDaTZ6NnBRaTczdXFWVG1uRnFpdXFINk1YekpYamJqRkZRWnFl?=
 =?utf-8?B?dXR0VUNMcmlsbTlIN0pZY1IzYW1TclRiNjJLVzRwL0xSZWx3MkVtSDBDckJR?=
 =?utf-8?B?dGN2bjZUNlMvL3QrMnRyNzFxWEovekxCcklrSDMrT0lDUTV3eGdDNmlZMW5N?=
 =?utf-8?B?aVZqbkNianQvcjJlb09vc0YzZmNUWlFLaFhGVEJXZnVuRTdyV0o5K1VxWnJM?=
 =?utf-8?B?bHprQThTaU9EK3hBMjZRb3lnV1BuUXZHbVR6V09pL1JKc2phNGJ6NUtWcFpB?=
 =?utf-8?B?S2xQd1Q2Zkwxa1lFem5DV2NONDlpVVRJMjhabCs4akVIMjVXMGdvRGJUeDVY?=
 =?utf-8?B?REcvVzZxYnRXSzE2S255NzFaYWZtNTgwcG9RVUhGOCsrSi91cmoyRGFNVGhj?=
 =?utf-8?B?ZmRGRWZ6QnFiUUI4V3c0Nk55bDlPM1R4NFVlV1RXRzc5ODZNMGErODR3RkZX?=
 =?utf-8?B?a0piK2p4RThic05ibHZNRnJvOFZKdlhlZ2FncE9DQ3RJeXdFOThTOFB3bjlN?=
 =?utf-8?B?cXJTQ1lhN1VEdE42OU1veVZldUtTOWFRSm8yUlV2QTN6ZXVuajd6M0t3R2w2?=
 =?utf-8?B?R3lyeWNWWitHbTRjbHVDKyttUGMwRldtWW4yTmNnT3BNTi9mQndIa2NVL3ZV?=
 =?utf-8?B?N2pnYStRT010UG1KNmtsUzJFaVI5cWFRRmZvZ0daVkRXSTNhUWFybEJTT2Mx?=
 =?utf-8?B?UzNpaGNPZG9JUVo1TnVQejlyai9xNjFRSlN0cFF4Wi84V3ZuQzBGU0h0d1FR?=
 =?utf-8?B?VW14MnhJVWlqRk16V2hJeFAwU0ZuVlljc3E3Y2VPT2FZMXBmZXBnaUlYRWNv?=
 =?utf-8?B?aXl1WldTRUpjWWY3V2J2QlFxSWd4RFExZHd2T3V3UmdVT2U5RFAxUEtpdThw?=
 =?utf-8?B?YWUzTTk1YVVLc1ByWlpVd2laa2lrUTU1ZnlIUEtmeXhvZXo5Z1NlVmwvVkdM?=
 =?utf-8?B?WTMyTWRrRGNSNXRTUGhyVWExeHVLWlhQblNsNEd2WUVjZzh6bmpnSE9SMnBB?=
 =?utf-8?B?UXRLYy8zQ1B6L0JiaitNTkltOTVHMlpFTmZobjlzN2JMYXA2UkNSbDFraDVp?=
 =?utf-8?B?UFM2VmJSYUx1R1pCdmJmaDVxKzVvelRWQ2NmLzFHUkYzODBrWEZlMnpCM0p2?=
 =?utf-8?B?bXhIU3pMemwrbFIwSHVCWXJMcW56MjFVSk5KVERCODk4TTFnZW5pNnVzYktx?=
 =?utf-8?B?cTcvYlpudyt5U2QyY0RHbHdST2hlT2FwVVgxcTlrRzQ4N0N6SEVycnVHNisx?=
 =?utf-8?B?NndxbHZnLy9mUWNISlRiN0VNUlpuRitjN3ZaeTFYQThZV29kNUJ2VDduT21x?=
 =?utf-8?B?ZVJSZWhPN3FJUTBNaE0xei9sdmhOZjVMaWdxaEpyeHZjZG13RHVLdmVXcE9G?=
 =?utf-8?B?Uk9VNjFvL2JQeC9VeStNdkZaQ1o3NERHVEttY2hiemRoTzQ2N1V3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <627EB2DBEA65C14393CCBD8A3DD1C0DC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985f4b8c-96c6-46fd-8130-08da4b08fa55
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 17:45:15.7450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TqLFz6HA7CRpCXVzl9ItX+r6fyfFZSsLC8u6vhekUbFqPwoTOsVOuSM2y5JfRdpAuWRJEtCJXaISXtAW4p9fHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0112
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDA2OjExOjUxUE0g
KzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEhpIFJvYiwNCj4+DQo+PiBSb2IgSGVycmlu
ZyB3cm90ZToNCj4+PiBPbiBGcmksIEp1biAwMywgMjAyMiBhdCAwNzo0ODowOFBNIC0wNzAwLCBU
aGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+IFNldCB0aGlzIHByb3BlcnR5IHRvIHVzZSB4aGNpLXNu
cHMgZXh0ZW5zaW9uIHRvIGhhbmRsZSBjb21tb24gU3lub3BzeXMNCj4+Pj4gRFdDX3VzYjN4IGhv
c3QgcXVpcmtzLg0KPj4+DQo+Pj4gSSBkb24ndCBzZWUgd2h5IHRoaXMgbmVlZHMgdG8gYmUgaW4g
RFQuDQo+Pj4NCj4+PiBUaGUgRFdDMyBzdHVmZiBpcyBhIG1lc3Mgb2YgcXVpcmtzIHdoaWNoIGRv
ZXNuJ3Qgd29yayB3ZWxsLiBRdWlyayANCj4+PiBwcm9wZXJ0aWVzIGluIERUIHJlcXVpcmUgZWl0
aGVyIGtub3dpbmcgdGhlIHF1aXJrIHVwIGZyb250IChZb3UgZG9uJ3QgDQo+Pj4gYWx3YXlzKSBv
ciB1cGRhdGluZyB0aGUgRFQgb24gYSBwbGF0Zm9ybSB3aGVuIHlvdSBmaW5kIG9uZS4gUXVpcmtz
IA0KPj4+IHNob3VsZCBiZSBpbXBsaWVkIGJ5IHRoZSBjb21wYXRpYmxlIHN0cmluZyhzKSBpbnN0
ZWFkLg0KPj4+DQo+Pg0KPj4gU2luY2UgZGlmZmVyZW50IHZlbmRvcnMgc2hhcmUgdGhlIHNhbWUg
U3lub3BzeXMgRFdDX3VzYjN4IElQcywgdGhlDQo+PiBjb250cm9sbGVyJ3MgYmVoYXZpb3IgaXMg
cHJlZGljdGFibGUgYmFzZWQgb24gdGhlIElQIHZlcnNpb25zLiANCj4gDQo+IE5vdCByZWFsbHks
IGhhdmUgeW91IGxvb2tlZCBhdCB0aGUgZXhpc3RpbmcgYmluZGluZ3MuIEhvdyBkb2VzIHRoZSBz
YW1lIA0KPiBJUCBoYXZlIGRpZmZlcmVudCBudW1iZXJzIG9mIGNsb2NrcywgcmVzZXRzLCBldGMu
PyBJdCdzIGEgaHVnZSBtZXNzIGZvciANCj4gdGhlc2UgbGljZW5zZWQgSVBzIGFuZCBwYXJ0bHkg
YmVjYXVzZSB0aGV5IGRvbid0IGhhdmUgcHVibGljbHkgYXZhaWxhYmxlIA0KPiBzcGVjcyB3aGVy
ZSB3ZSBjYW4gY2hlY2sgd2hhdCByZXNvdXJjZXMgdGhlcmUgcmVhbGx5IGFyZS4NCg0KSSdtIG5v
dCBjbGFpbWluZyBldmVyeSBwbGF0Zm9ybSBoYXMgdGhlIHNhbWUgc2V0dXAuIEknbSB0YWxraW5n
IGFib3V0DQp0aGUgY29udHJvbGxlcidzIGNvbW1vbiBiZWhhdmlvciBiYXNlIG9uIElQIHZlcnNp
b25zLg0KDQo+IA0KPj4gSnVzdA0KPj4gdXNpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5ncyB3aWxs
IGJlY29tZSB1bm1hbmFnZWFibGUgd2hlbiB3ZSBoYXZlIHRoZQ0KPj4gY29tbW9uIGJlaGF2aW9y
IGFjcm9zcyBkaWZmZXJlbnQgdmVuZG9ycy4NCj4gDQo+IFRoaXMgSVAgaXMgbm90IHNwZWNpYWwu
IFdlIHVzZSBjb21wYXRpYmxlIGV2ZXJ5d2hlcmUgZWxzZSBhbmQgbm93aGVyZSBpcyANCj4gaXQg
dW5tYW5hZ2VhYmxlLiBBbmQgYWdhaW4sIHRoYXQncyB0aGUgb25seSB3YXkgeW91IGNhbiBoYW5k
bGUgcXVpcmtzIGluIA0KPiB0aGUgT1Mgd2l0aG91dCBjaGFuZ2luZyB0aGUgRFQuDQoNClRyeSBy
ZW1vdmluZyBhbGwgdGhlIHZlcnNpb24gY2hlY2tzIGluIGR3YzMgZHJpdmVyIGFuZCByZXBsYWNl
IHRoZW0gd2l0aA0KY29tcGF0aWJpbGl0eSBzdHJpbmdzLiBOb3Qgb25seSB3aWxsIGl0IGV4cGxv
ZGUgdGhlIGRyaXZlciwgbm93IHdlJ2QNCnNvbWVob3cgbmVlZCB0byBub3RpZnkgYWxsIHRoZSB2
ZW5kb3JzIHRvIGFkZCB0aGVpciBjb21wYXRpYmlsaXR5IHN0cmluZw0Kd2hlcmUgaXQgY2FuL3No
b3VsZCBiZSBhIHNpbXBsZSB2ZXJzaW9uIGNoZWNrLg0KDQo+IA0KPj4gQ2FuIHdlIHJlbmFtZSB0
aGlzIHByb3BlcnR5IHRvICJ4aGNpLXNucHMtRFdDX3VzYjN4LWlwIiBvciBzb21ldGhpbmcNCj4+
IHNpbWlsYXI/DQo+Pg0KPj4gVGhlIG1haW4gZ29hbCBmb3IgdGhpcyBkZXZpY2UgcHJvcGVydHkg
aXMgdG8gaW5kaWNhdGUgdGhhdCBpdCdzDQo+PiBTeW5vcHN5cydzIERXQ191c2IzeCBJUC4gQXMg
bG9uZyBhcyB3ZSBrbm93IHRoaXMsIHRoZSB4aGNpLXNucHMgZ2x1ZQ0KPj4gZXh0ZW5zaW9uIGNh
biBoYW5kbGUgdGhlIGZpbmUgdHVuaW5nIGZvciB0aGUgY29udHJvbGxlcidzIGJlaGF2aW9yLg0K
PiANCj4gQ2FuJ3QgeW91IGp1c3QgY2hlY2sgdGhlIHBhcmVudCBkZXZpY2UgY29tcGF0aWJsZSBp
cyAnc25wcyxkd2MzJz8gKEknbSANCj4gYXNzdW1pbmcgdGhlIHN0cnVjdCBkZXZpY2UgaGllcmFy
Y2h5IGlzIGdsdWUgZGV2aWNlIC0+IGR3YzMgLT4geGhjaS4pDQoNClNvbWUgZHdjMyBob3N0IGRl
dmljZXMgYWxzbyBleGlzdCBhcyBwY2kgZGV2aWNlcywgdGhlcmUncyBubyBjb21wYXRpYmxlDQpz
dHJpbmcgZm9yIHRoYXQuIEFzIG5vdGVkIGJlbG93LCBpZiB0aGUgeGhjaSBwY2kgZGV2aWNlIGdv
ZXMgdGhyb3VnaCB0aGUNCmR3YzMgY29kZSBwYXRoLCB0aGVuIHRoZSBkd2MzIGRyaXZlciB3aWxs
IGRvIHNvbWUgaW5pdGlhbGl6YXRpb24gYW5kDQp3cmFwIHRoZSBkZXZpY2UgYXMgYSB4aGNpIHBs
YXRmb3JtIGRldmljZSBiZWZvcmUgcGFzc2luZyBpdCB0byB0aGUgeGhjaQ0KcGxhdGZvcm0gZ2x1
ZSBkcml2ZXIuIEJ1dCBzaW5jZSBpdCdzIGEgcGNpIGRldmljZSB1bmRlcm5lYXRoLCB0aGVyZSdz
IG5vDQpjb21wYXRpYmlsaXR5IHN0cmluZy4NCg0KPiANCj4+IFdlIGNvdWxkIHVzZSBjb21wYXRp
YmxlIHN0cmluZyBmb3IgdGhpcyBnb2FsIGFsc28sIGJ1dCB0aGF0IHdvdWxkIG1lYW4NCj4+IHRo
ZSBob3N0IGRldmljZXMgdGhhdCBnbyB0aHJvdWdoIHRoZSBkd2MzIGRyaXZlciBwYXRoIG1heSBu
b3QgaGF2ZSB0aGUNCj4+IGNvbXBhdGlibGUgc3RyaW5nLiAoZS5nLiBob3N0IG9uIHBjaSBidXMg
YnV0IGdldCByZWNyZWF0ZWQgYXMgcGxhdGZvcm0NCj4+IGRldmljZSkuIFRoZW4gd2Ugd291bGQg
bmVlZCBhIGRpZmZlcmVudCB3YXkgdG8gZGV0ZXJtaW5lIHRoYXQuIFdlIGNvdWxkDQo+PiBtYXRj
aCB0aGUgcGFyZW50IGRldmljZSBkcml2ZXIgZm9yICJkd2MzIiwgYnV0IHRoYXQgaW1wbGVtZW50
YXRpb24gbG9va3MNCj4+IGZyYWdpbGUuDQo+Pg0KPj4gU28sIHdpbGwgdGhlIGRldmljZSBwcm9w
ZXJ0eSAieGhjaS1zbnBzLURXQ191c2IzeC1pcCIgd29yayBmb3IgeW91Pw0KPiANCj4gTG9va2lu
ZyBhdCB0aGUgZHJpdmVyLCB5b3UgYXJlIGp1c3QgY3JlYXRpbmcgYSBwcm9wZXJ0eSB3aXRoaW4g
dGhlIA0KPiBrZXJuZWwuIEl0J3MgbmV2ZXIgaW4gRFQsIHNvIHdoeSBhcmUgeW91IGRvY3VtZW50
aW5nIGl0PyBZb3UgY2FuIGRvIA0KPiB3aGF0ZXZlciBEV0MzIGFuZCBYSENJIG1haW50YWluZXJz
IHdpbGwgYWxsb3cgYW5kIGFzIERUIG1haW50YWluZXIgSSANCj4gZG9uJ3QgY2FyZS4gSSBkb24n
dCByZWFsbHkgdGhpbmsgaXQgaXMgYSBncmVhdCBhcHByb2FjaCwgYnV0IC4uLg0KPiANCg0KSSBm
aWd1cmUgdGhhdCB3ZSBzaG91bGQgZG9jdW1lbnQgYW55IG5ldyBwcm9wZXJ0eSBzaG91bGQgd2Ug
dXNlIGl0Li4uDQoNCkkganVzdCB3YW50IHRvIG5vdGUgdGhhdCB0aGlzIFJGQyBzZXJpZXMgaXMg
dG8gZ2FybmVyIGZlZWRiYWNrcy4gSW4gbm8NCndheSB0aGF0IEkgd2FudCB0byBmb3JjZSBhbnkg
b25lIGFwcHJvYWNoLiBTbywgeW91ciBmZWVkYmFjayBpcyBoaWdobHkNCmFwcHJlY2lhdGVkLiBT
aW5jZSB3ZSdyZSBpbnRyb2R1Y2luZyBhIG5ldyBnbHVlIGV4dGVuc2lvbiwgaWYgcG9zc2libGUs
DQppdCdkIGJlIGdyZWF0IGlmIHdlIGNhbiBzdGFydCBvZmYgd2l0aCBhIHByb3BlciBhcHByb2Fj
aCBhbmQgYnVpbGQgb24NCml0LiBJZiBpdCdzIG5vdCBhIGdvb2QgYXBwcm9hY2gsIGxldCdzIGhl
bHAgY29tZSB1cCB3aXRoIG9uZSB0aGF0IGNhbg0Kd29yayBmb3IgX2FsbF8gZGV2aWNlIHR5cGVz
Lg0KDQpUaGFua3MsDQpUaGluaA0K
