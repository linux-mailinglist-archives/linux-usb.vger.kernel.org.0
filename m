Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 113F75453CE
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 20:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345288AbiFISMI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 14:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345276AbiFISMA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 14:12:00 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FB72E4367;
        Thu,  9 Jun 2022 11:11:59 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8AE4640A5D;
        Thu,  9 Jun 2022 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654798318; bh=pcFY+SdgDCAyTFwohkO1YOyk0monkeCsVYQzyosVa7Y=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dq/K+QkWKBw2grt5j8/znTBJ6Bg2MlzMUPz0dbQfmJZTZkVJw6a9Q/ppjSFL1gjk/
         LmnezNOmVPfe/H+SbVYR8+oeLaFuQdDv9vBbyEmSDphyfx+JHDNczBlSurKBErn4a6
         idnWDBUFlu+vGwntOpzus2ax1oSU+3l4PVPwjg07/VjjjACR4jslZ6IyaxKxEakL/D
         Y3nUvYKD5gmWqExKIFUEUIQgWGqMgbzRlFnGaQ3ZCCYrNebd7E64T/zFWvYhxHB+6y
         nXjFkO29pk0ysoQuApy8QE+mZbOJu/YpPp5a6oNjjRfYlBaKQXhyPED8sCu1wYHDg3
         atszq2bRh/7Ag==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E1567A008A;
        Thu,  9 Jun 2022 18:11:55 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A7FD840053;
        Thu,  9 Jun 2022 18:11:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ky6bWhNx";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeBywPhsjt9mRkKonlRJHubZRcvasN7OTM3zHJEPdgop2IUY3YIUCUS/p9z3FiJR20r/1YfWFQIpk6BPzt/IFyomFt/hoYrhwn9nc1zZonk1fTc5WPposbrhTjS2/KqQCnm/mLv8TEnDUDQ4SwBR0bi/FmPmg9UMpJnO1A5ypTHmnWVtUcBpkWO0xJvIHdoeBE+VbZ/ELzl5qTygBOrnVrGwFEYtjd5DKd3NsDDcY86ESayV3CwKWhZJlrk+M/sx7Q5v3hlCatto37dBQuhWPKUvzHttzqmuHbSfOR4zpj7f63GwUy38s16QuGR1k4pm8Gs7bkrcsWPZ3fYnpBnPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcFY+SdgDCAyTFwohkO1YOyk0monkeCsVYQzyosVa7Y=;
 b=ZEiwIWakj8EjQV1D7vzsYzyxr5UugGnLbozqQeyQ5xJmywfS19+s/TOUvVvOFBNI8bnrb0iF+nJCv7WicFSX2uByPquX2puV8QPP8eSOFIPB6/2WhkJAe8W08bBjiI28eNeQOaOhYZZTJy2PP1XZ326WWc4TWZilGOYEyCrTwpDuwZJZiokgsj5SMRZMLQgU4Ax9qVrrLi7btgxDmuUWQxpFXP5Dzf/JRlVQC9EQp7s7kJjeZV2HZ1AnCvze4Inf3oUy7oFhlE0DpWrlIYjmwxcMgtssXV/kkK5vgoL5h/PeX0f/Box+vQx2RkKYjrPdv8lBnAIxECwOk8H1o57aVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcFY+SdgDCAyTFwohkO1YOyk0monkeCsVYQzyosVa7Y=;
 b=ky6bWhNxK4VcDDYFgGhXFPe6faSZRwt7fq85ReFGfzSw6oWqygX+98SRvZnzLyjA8Nbde43/VLO0yIbH7rVbRMiW1wiYEm1xKKjVlJ8Y3b7MFri0VVbZPpEeu4XRaE3OBWLU/ssZYzy2OQGkUDAWdwj9t2Rk+Ay2X1+o7PZjYZ0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR1201MB0121.namprd12.prod.outlook.com (2603:10b6:4:56::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Thu, 9 Jun
 2022 18:11:51 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 18:11:51 +0000
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
Thread-Index: AQHYd72JFLoQNdcsr02PVVu1koiI4K1HYtMAgAAGeoA=
Date:   Thu, 9 Jun 2022 18:11:51 +0000
Message-ID: <6873a12f-448f-214a-ca01-a08f65ddb0ee@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
 <1ff0422b36c32c0b8b76f99333ac785f275edd4d.1654310542.git.Thinh.Nguyen@synopsys.com>
 <20220609174840.GA4015807-robh@kernel.org>
In-Reply-To: <20220609174840.GA4015807-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26e24a55-d9a1-44c2-e48e-08da4a4386f4
x-ms-traffictypediagnostic: DM5PR1201MB0121:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB01210FD793929B64596D2F3CAAA79@DM5PR1201MB0121.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZDsOCOhnS4xy8zQcIPgBlTyXsY9UJruUCQ8ZJFnrLejLgYzXF29TsmD7TcHrthYLSyX3+5zJs89zsuS7GuQ+DzD75n/gYuSM1zDpcKHRax/9CbGvjybkbg3R7Xc+W/4dWOsGbB0r/36udXIh6rGfBh5EJPUYFgYgf3xB/uXiSD3FLL4S87te6KiTaaA6UGrOl647MMyB61D3qHCF9LI9UNX+HjskiFJS8l1/yyd1ds/d2KTdky1mbwJ8Mv0U+1l/7jfMjEPdpnAelE3Op5Zj1GHGEQHd4QoURC/afIRY+xYBLsdLAxKs5jF/WBlsx2lnVzxN3gNnpL1Xc3SbG24Vl23UVNdAFgAhMUJV+MRwnj4sO1kKFU1oNjrBJN1shqYajf+rXV15I9nUy4WJSBlaa6L7Ci/ftYuAxYe6I+92T3R6a7dRK4S7q8JuFzHpSzLMTbtNL3kYtucNcrzyUKLIt/UNqkl7fZGkSEBDBBTabXwNI9pst/yumUdwTW0/xAnVr/yehjIxNuvzEfWKiDXDNl1AGc0W9IJtXig8NV56k3PDXdljtv1Oo50QQifqr9k138hlkerKpqs43AbhWnB86AvaElXafepE6MnSla2c7E902ImpzMj2/KISAfNqC8mxx3LOEVSm54rZiKmi+6//u/+i7fCCgr9jzOSLgIyFb9OKm5KmiyjBcQUG853p8cocuGcKpAM2F6HC8B2YEqqCt5yBAx/NBLb5DfTj0KjbX0nDpjV+zi0fTrMRPJg9SrbIHiPD1HYFF/40U1l79+VKDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(8936002)(110136005)(316002)(38070700005)(66556008)(6506007)(186003)(6486002)(71200400001)(2906002)(508600001)(38100700002)(122000001)(66946007)(2616005)(6512007)(31696002)(66476007)(36756003)(66446008)(64756008)(4326008)(76116006)(8676002)(31686004)(26005)(5660300002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHl2M0N0NklydDNWQlNHL0tlMmNybDNVRXcySzZhdDVlK3VwT245ZmJrMDZU?=
 =?utf-8?B?KzYrUHVkQTRQMGpoWEFVWFc0R0tjNmFLVkR1N256SkdDRjdPS3BNYjRtYi9U?=
 =?utf-8?B?UDJ0Uk9tWE1oRkZLQTBreit3NlZsVkp3WXhXZWk2TWI1cGYzb2p1Q09oVXBt?=
 =?utf-8?B?OGxpQTJLR3l2Y3F2S1RsQ1docmNTWUdPV1VqUlZaLzNSNXFSYUdMUjVGYk5s?=
 =?utf-8?B?b2llVlhwTUFPSmVkd3g5QzVCVTN3SHZ6UmZLU0FUMTZWRVFpODJiU1NsOS94?=
 =?utf-8?B?dkF0NmVhN3J5WlBiSXJSM1RQQk0vVFdBeVRNUUZPckQ2K2pPRjRBMUUvbHBW?=
 =?utf-8?B?OVE3YjZ0QktXOVpEZkxsNmY1bWVOaUg0UUNyaWJRZUFKam9od0VHYmNFc3l6?=
 =?utf-8?B?RCt6a1l4K2M0bVJjKy92QWFGY2l5Wk1WU0kwVlJERHh0VjlCKzhhN29xai9M?=
 =?utf-8?B?MG0xQ1MwSU11SlRsOG5aVEVVRHd2SmhyNnBwc05hY1VCKzNrVFZJc3BOL2pF?=
 =?utf-8?B?Q1ZWVnRDK25GZTFhYXRHeE03VVpic3FEK1JXWVkvcElZRTErWVlQMW1nTHN1?=
 =?utf-8?B?MmhJSEdmYkRJcmRZVm11Vll2RDRuL3FJL2duTUx2RXl1bjZ1ZUhITXZrSXhC?=
 =?utf-8?B?dFVkWStWWnBwTlkrMVZab08zOVg2WjFaa2tVT1JnR29PT29RekduNmlQbndh?=
 =?utf-8?B?SW5VMW9oZ0sxYk9vblVyV3dOQ2dLeFlEYlJobGRkYzc5cnhXUVFSSFU1ajhM?=
 =?utf-8?B?QlJCVXNyOXQyZ0s3czBrZjJMZVRZZGZrYnV3UExXQjJUd1ZHRkhWWlBGYVQ3?=
 =?utf-8?B?WjdwMUdxRDhYVExIL3lCMjlNY0tPVjdTWDJQRktkRXFoUWJ1M2Q0NDh5dmkr?=
 =?utf-8?B?SjN1clZsanRGZk40c0VmREpTREd3UXlLYWJJZnljMTdFbWRBQ1dMSVZKQWVy?=
 =?utf-8?B?bW13cXQ5T3l3M2JBZUR1NEZPUmZ6WlBzTzRaWGIvMGZqeGhIcG5SU2E5VHJC?=
 =?utf-8?B?MFJPeTF1aFpUVTV5K0tMNHZBNDJIYlRzN0UvOVV0VEJ1VllGdkpUclVOZzRE?=
 =?utf-8?B?MVcxQkJ1bTVzbkk3c1dVeGxiVW5hN0U4c1RYWnZSdktxV3hRb3NzeTBjZm44?=
 =?utf-8?B?c3ZZZVdzZmVkd2FnbkJFZmNERXduM0kra2Z3cEJzN3k1R1pqZjZyRGQ0THZq?=
 =?utf-8?B?U1k4WHUrYlJqc3JlSjQ4Wk1sanNmc2hZR0oxeXdhcXhScWpSdzM3QU9TckIv?=
 =?utf-8?B?OUU3cVFjeEYyQWdHcjY3WC9Wa3JSZmVKMmRlKzVtRG1vbHdQTWZaKzYyOE5z?=
 =?utf-8?B?L0tMN1N4eXJhT3RRQUdVZFhyQlJqNFVYWGVON0NLanMxUzg4TW1ZZFVnWFVJ?=
 =?utf-8?B?WWRXYTZpVXNVSTNQUW1zSWgzMjZWSWhYN1FUSGtNL3BIZWpqRlhuaHV6dFBu?=
 =?utf-8?B?U2NYVlBNN2JPWlJTTVBzalArangyOER3UXhGR3diUW5Ja3JSWkdaZmdHWnVh?=
 =?utf-8?B?akQzRU5tY3g0Nk5SK2VsczJIWURVWE1NZVlFZkhTc0Z4eUQvdTAzdTgzakc3?=
 =?utf-8?B?dDB1MDJjR0E5OThkRUxQZFZQd2pDMTd3ZXM0WmlsZGxYS2RDR056VnFKSmRm?=
 =?utf-8?B?K1daclBVZDd5Sk9WQm9IZmxDbmQySzk4ZmlDUFkwd1JlWnhGQklTNTQxcyti?=
 =?utf-8?B?blU2alpqbmxxdG1TVEtWL3VwMXpGWlF0bmcxVDU1MkQ4elFtZmlJbE9GTDMr?=
 =?utf-8?B?NjVxeFpVMEk5c3dpdVQxazhmNnRWVzJEVmFJbmxmbS9scFR5OWZCeXI4NERn?=
 =?utf-8?B?N2p5WlRyajZ6S0M4MTkvOVZ0K2dHa0dDb1NaczVmZHNUZ0wxRjdET2NsSExp?=
 =?utf-8?B?ZnhETk1DbFV4d2FHYllENXhTeU13MlJBbDNkcDNpdHRyTWNRNXh2QWJDUUh5?=
 =?utf-8?B?d2VuZklOY1JZWkk3cko0YTMyZ0ladzQwNFhsYzNBN0J3cEdFbTlwRDVyQkxB?=
 =?utf-8?B?NG5QaUxvbmUzbHcvN1lKenVFNGY1R20wbDgyZEQyRzNvK1Zob1ZVT2ZZRkhq?=
 =?utf-8?B?aVdMcXhCTXQvOTJzeUZaZEJPaktTWjBJK3BpZ2crdGlMR201NTBMYUFPMi91?=
 =?utf-8?B?VmRKS2kzYVlWVS9jOW8zM1VVeEhQYTVFeUNrQlNoRmlrUjhQQk51WXN1Wm9w?=
 =?utf-8?B?bnZsSjVGWVVibjFXS0lBQWVxbjI3ZGMrcTE4OS9iNjhEVjhOUytRVlJjL1VG?=
 =?utf-8?B?OTcwOWNVeUpNemtKdERhSzd2VDRuTHVZMEtObWZrdm9BN0JsZVdrSzU3NDBo?=
 =?utf-8?B?M3BoYndGUXJrVDJ6ZGhBNkF5SFhaUnpXREZNQ2ZlVVpGYVI2ZjJiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <961404AE8A685442A3B63157C5F422A4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e24a55-d9a1-44c2-e48e-08da4a4386f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 18:11:51.3650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1TJDq9lIP49ErxD7iB6rZhVCyzCVBNjHLgNW8iuvHNn4RwZFEzEYX7oMAJQOTJT1MXOi+yCrC+ssyEfiNRuJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0121
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUm9iLA0KDQpSb2IgSGVycmluZyB3cm90ZToNCj4gT24gRnJpLCBKdW4gMDMsIDIwMjIgYXQg
MDc6NDg6MDhQTSAtMDcwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gU2V0IHRoaXMgcHJvcGVy
dHkgdG8gdXNlIHhoY2ktc25wcyBleHRlbnNpb24gdG8gaGFuZGxlIGNvbW1vbiBTeW5vcHN5cw0K
Pj4gRFdDX3VzYjN4IGhvc3QgcXVpcmtzLg0KPiANCj4gSSBkb24ndCBzZWUgd2h5IHRoaXMgbmVl
ZHMgdG8gYmUgaW4gRFQuDQo+IA0KPiBUaGUgRFdDMyBzdHVmZiBpcyBhIG1lc3Mgb2YgcXVpcmtz
IHdoaWNoIGRvZXNuJ3Qgd29yayB3ZWxsLiBRdWlyayANCj4gcHJvcGVydGllcyBpbiBEVCByZXF1
aXJlIGVpdGhlciBrbm93aW5nIHRoZSBxdWlyayB1cCBmcm9udCAoWW91IGRvbid0IA0KPiBhbHdh
eXMpIG9yIHVwZGF0aW5nIHRoZSBEVCBvbiBhIHBsYXRmb3JtIHdoZW4geW91IGZpbmQgb25lLiBR
dWlya3MgDQo+IHNob3VsZCBiZSBpbXBsaWVkIGJ5IHRoZSBjb21wYXRpYmxlIHN0cmluZyhzKSBp
bnN0ZWFkLg0KPiANCg0KU2luY2UgZGlmZmVyZW50IHZlbmRvcnMgc2hhcmUgdGhlIHNhbWUgU3lu
b3BzeXMgRFdDX3VzYjN4IElQcywgdGhlDQpjb250cm9sbGVyJ3MgYmVoYXZpb3IgaXMgcHJlZGlj
dGFibGUgYmFzZWQgb24gdGhlIElQIHZlcnNpb25zLiBKdXN0DQp1c2luZyB0aGUgY29tcGF0aWJs
ZSBzdHJpbmdzIHdpbGwgYmVjb21lIHVubWFuYWdlYWJsZSB3aGVuIHdlIGhhdmUgdGhlDQpjb21t
b24gYmVoYXZpb3IgYWNyb3NzIGRpZmZlcmVudCB2ZW5kb3JzLg0KDQpDYW4gd2UgcmVuYW1lIHRo
aXMgcHJvcGVydHkgdG8gInhoY2ktc25wcy1EV0NfdXNiM3gtaXAiIG9yIHNvbWV0aGluZw0Kc2lt
aWxhcj8NCg0KVGhlIG1haW4gZ29hbCBmb3IgdGhpcyBkZXZpY2UgcHJvcGVydHkgaXMgdG8gaW5k
aWNhdGUgdGhhdCBpdCdzDQpTeW5vcHN5cydzIERXQ191c2IzeCBJUC4gQXMgbG9uZyBhcyB3ZSBr
bm93IHRoaXMsIHRoZSB4aGNpLXNucHMgZ2x1ZQ0KZXh0ZW5zaW9uIGNhbiBoYW5kbGUgdGhlIGZp
bmUgdHVuaW5nIGZvciB0aGUgY29udHJvbGxlcidzIGJlaGF2aW9yLg0KDQpXZSBjb3VsZCB1c2Ug
Y29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoaXMgZ29hbCBhbHNvLCBidXQgdGhhdCB3b3VsZCBtZWFu
DQp0aGUgaG9zdCBkZXZpY2VzIHRoYXQgZ28gdGhyb3VnaCB0aGUgZHdjMyBkcml2ZXIgcGF0aCBt
YXkgbm90IGhhdmUgdGhlDQpjb21wYXRpYmxlIHN0cmluZy4gKGUuZy4gaG9zdCBvbiBwY2kgYnVz
IGJ1dCBnZXQgcmVjcmVhdGVkIGFzIHBsYXRmb3JtDQpkZXZpY2UpLiBUaGVuIHdlIHdvdWxkIG5l
ZWQgYSBkaWZmZXJlbnQgd2F5IHRvIGRldGVybWluZSB0aGF0LiBXZSBjb3VsZA0KbWF0Y2ggdGhl
IHBhcmVudCBkZXZpY2UgZHJpdmVyIGZvciAiZHdjMyIsIGJ1dCB0aGF0IGltcGxlbWVudGF0aW9u
IGxvb2tzDQpmcmFnaWxlLg0KDQpTbywgd2lsbCB0aGUgZGV2aWNlIHByb3BlcnR5ICJ4aGNpLXNu
cHMtRFdDX3VzYjN4LWlwIiB3b3JrIGZvciB5b3U/DQoNClRoYW5rcywNClRoaW5oDQoNCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
DQo+PiAtLS0NCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi14
aGNpLnlhbWwgfCA0ICsrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
dXNiLXhoY2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNi
LXhoY2kueWFtbA0KPj4gaW5kZXggOTY1Zjg3ZmVmNzAyLi41NDAwNDRhMDg3YTcgMTAwNjQ0DQo+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi14aGNpLnlh
bWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLXho
Y2kueWFtbA0KPj4gQEAgLTI5LDYgKzI5LDEwIEBAIHByb3BlcnRpZXM6DQo+PiAgICAgIGRlc2Ny
aXB0aW9uOiBJbnRlcnJ1cHQgbW9kZXJhdGlvbiBpbnRlcnZhbA0KPj4gICAgICBkZWZhdWx0OiA1
MDAwDQo+PiAgDQo+PiArICB4aGNpLXNucHMtcXVpcmtzOg0KPj4gKyAgICBkZXNjcmlwdGlvbjog
SGFuZGxlcyBjb21tb24gU3lub3BzeXMgRFdDX3VzYjN4IGhvc3QgcXVpcmtzDQo+PiArICAgIHR5
cGU6IGJvb2xlYW4NCj4+ICsNCj4+ICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQ0KPj4gIA0K
Pj4gIGV4YW1wbGVzOg0KPj4gLS0gDQo+PiAyLjI4LjANCj4+DQo+Pg0KDQo=
