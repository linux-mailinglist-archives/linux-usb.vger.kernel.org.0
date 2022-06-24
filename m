Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CA555A0B6
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 20:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiFXSUK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 14:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiFXSUJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 14:20:09 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFC354F92;
        Fri, 24 Jun 2022 11:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656094806; x=1687630806;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oKiv3Zn1sh1AlP3ZB/PFRrz2xgnP2FWnhOVtzG3ZlGA=;
  b=ujQScsE9B87BdvjhYE9nLxkbGPL0RyqLG1Fe+2lKOngETSwr0sSM5BEE
   XDHAGvEFfkREW5EyUDuwdXUwFD5RyFBoeQbgJXmDXtdC3Td9QAFCdbIxl
   3fAnza3x61sfD9brE9fxgX0bOAuNkeT2jbPJn7y0GxugdblQ/vyqzG6pI
   mtgv3qwpj/dWfjhD7PJiRORDsOzldNCi8gCWk++H4NREZDS0KLkStYXrA
   Sm5O99hK/CZxIiNmQv1DFZ5AfSXkJleo85W+YBXlMwnXtu2Rf6nYK16Q4
   5yHFI4v3m7B2xcrawLg8Q7H2TxJY3ejHPvR5wIBPDkdczV2gWmXoB/Thx
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208";a="179409083"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jun 2022 11:20:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 24 Jun 2022 11:20:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 24 Jun 2022 11:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU4qwEnivvKK98bGOzoNLHFSYXtOjxVIaSl/gyoUZ6mhvLQvJDcrr3qh1egFccLq/7ywuXutAVmxHnR/7yj9DHg/FXLIseYgXdimPJTA0B9II1zcvvskBt7XGc95QZAQg+cQ3+4mCdLA0A9009YeDNqN60Hz3kca+ohY69CYAOIjZ6Ec7DDBw1fUmQcaW7k8OC6ahS97ebozQSix/iTH8s1kd9w8YeeRJKjZOCV2ra8IXWOumsdirMdExxIcEzfiQUvvoNKZqhOlovPQIys+J4AsNnWTdot7MSJ8ZcASaOi17MickdsSHB2qBJidMgCYGGtutplaZr5CMNekeIUXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKiv3Zn1sh1AlP3ZB/PFRrz2xgnP2FWnhOVtzG3ZlGA=;
 b=GM3n0JxPyy9zbbXSHk8Ak24wcZ5gBjF7b4B5M81ue4igWnKgJeVaywiuqPRlTQ3I4CSY492HBLR6zHSYqChKKfiklqM4hGYq+j7E6nH+APqms8FawegUojDtDRnHhXEKA08wO/JXo9eaShIdiShcz9QeSZbx8yd52kCHXGEZX/5qpJ+gO/6OlOUliuvwsTcsPiAJMoLmZ1lO3JHhw0ykIwIDApia/qANHyeOpgi7+NpCJVm6SUa2c49eUzzDkSsywyst3qnHvr9hiSbu1xM6nPCmn9bvG/ZidYrK0TgDQmtM4A8oYZdtOwSGkMNgXCLSJst0+a2qVj7hBZUiMgI5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKiv3Zn1sh1AlP3ZB/PFRrz2xgnP2FWnhOVtzG3ZlGA=;
 b=cMkKVATTxc+Dt5/rXcwS+KU+q8NKMSQgxocoZ0xsA1j90hY4z0WvknpdDBqZPW29yCRQzaHV3mXQgl1WJXWx+9LMmBvKbiUWyfmt5ryZZgl5C09YF7jTu6fOWaNgX1C9CUVL0OxlN2cegk0b9dc3C/QdW43X1rzHtJvjgSVQ/7w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4371.namprd11.prod.outlook.com (2603:10b6:a03:1bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Fri, 24 Jun
 2022 18:19:58 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 18:19:58 +0000
From:   <Conor.Dooley@microchip.com>
To:     <dan.carpenter@oracle.com>, <Lewis.Hanly@microchip.com>
CC:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: mpfs: Fix error codes in probe()
Thread-Topic: [PATCH] usb: musb: mpfs: Fix error codes in probe()
Thread-Index: AQHYh5tAPaVPLec2vE68HkPnq0BA9q1e3s4A
Date:   Fri, 24 Jun 2022 18:19:58 +0000
Message-ID: <89260173-0017-ad01-0dc9-f9791bd20040@microchip.com>
References: <YrVmLEc/FOEzNdzj@kili>
In-Reply-To: <YrVmLEc/FOEzNdzj@kili>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fee83557-6481-4143-53f0-08da560e2592
x-ms-traffictypediagnostic: BY5PR11MB4371:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +otbtcEROTFi5I4/G2x6zoK5hu6TvmUWQbeVc/mMxfe3Mwtn0ZkVI3F8oF1xDE4NMyhw4Sbpq44uNpySwrJ4Zbl0+wAe3xR0/mxEYWOw+3gK9qhmnGgW1/vhp/J6n3N5Vce1l5nLWem70vtkw+kj43GVGNESPq86WelbbtAd417LOprnEr1tWRwG3lcYpwfGy/s36fp+44/weRg3U6wY3fr/RrjhLwquWhyXuVMY7txrJkyse0OfehoAxZTkiQ2GFVp7X7jKCUJyxgyUSqJeMTASEMyIx6I8pKMLHkNZB8XyMSbeiGO8yNLEEjd/SqdbAjnlBP8hxfBkQZfE4eaGbcv6owkZ2KngHhre4wgjMNZr9h+rIFcFIRtWWnWrzKZUMY3OcOED4R2i7nrjf+5MfqGgv73khCxUkaKy7EszmDCEzUmJxEdtZSThfXQv1/RihKdjEwmUEk2Y9u03SazfVgIt7xRQMro2gFyeTOEpmKG+sXpK8PSWMV67Et0tGy8xI31UJVJnMqGD8fK7e24GbQ3F7k+mmk1PYhD1ObSat47j7BnpM5+gaEh4RZL4UdMothZhjsUpFUgw6/g9R6oi4DEvmOKdOLD6nhtcFDme5Azub0tJKXyd4UssqORq5W+ZNZu3tbp0njIFd52c6ctj4v53hJmZkKlzJRRAomYFrnN5WdHCyTc0yZHIS1imDYj5B5KyOPrOA6LpwyZ8awsLyyOc/+7Cqvp8gVcNXAZZnL/drH9bpaXlO6QSRzBZ/guuyTQZ7zs4Wwj1DIiGiGPIyoxIcbYyvk8iPKTfgBzGnX6C5Pvi4lw9tHxV37YlBtFjZwt/AJmkmgpxrTf14vGKKT5jIS1i9KEBfGb/GqeYayk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(376002)(136003)(366004)(110136005)(8936002)(316002)(91956017)(76116006)(66476007)(31696002)(54906003)(2906002)(66556008)(26005)(38070700005)(31686004)(66446008)(66946007)(86362001)(71200400001)(8676002)(4326008)(36756003)(64756008)(5660300002)(122000001)(6512007)(41300700001)(6506007)(53546011)(38100700002)(478600001)(83380400001)(2616005)(186003)(6636002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cytLNGJjNGJwNmNhWVRuTFhjQXI5YmJtWi9OVGx2M3Z6ZVN1V0ZHUFN2ZEY0?=
 =?utf-8?B?bHZCbkhXZ1dZeUE3RHV6bFRteW1KdVJIYUFURldKTkRsQVA3c2N6Y1E4Uno1?=
 =?utf-8?B?Q0FuaENTM0NLdGM0alg1bVk2OXo0K2RLeHR1OTFzcmtwWUVXRUpIaG9qRFl3?=
 =?utf-8?B?QzlGWXpJeXFPUDJodHNKN3dQeDliZjlRTm84UVdSdGRYZUhLdk5taUlJZlFv?=
 =?utf-8?B?eCtiWWpSY2ppeG1nanc0dlBwaUpwbitjaGZMVWpzekxYQnA5eG81TDNRZHZs?=
 =?utf-8?B?QThEd0hCZDd4UjRmOEt5MlFNTmppTUtkdzRybjQrM0E1VFkwdkhqdDViWDll?=
 =?utf-8?B?UDdTSUZLM3c1bDlnekk4REJWMGZ4TVZpTytnbXZoV2dXWWlpNldmalpEbml5?=
 =?utf-8?B?UVFDcnFwL3pXQVh2aVNtelQ5SDNUSGc4WUpiN3NPYkhEZXpETzJIRktySUYw?=
 =?utf-8?B?UmxaOGI1bnAySEZ4Y1N5R2ZmdnpmWDMwd2dFVTRWR0I3Ym5WcGp0NmIyUW1T?=
 =?utf-8?B?VlRGZnBBR0xTejRUY3VhOGZPNy8wVUlrT0x0MVZwQ01weTBhZmdwdkZJbmNJ?=
 =?utf-8?B?QW94RytwOWc3QkdFUXhJaHhxSXpsQjZTeUFnL0JUWXVRcUNGdllwa042YThG?=
 =?utf-8?B?aHBpZ1dvVzM1V2FhbWtDS0dPU1VhTVA4UU1OMDRINy9pclhqNXE2Y0ljVDR0?=
 =?utf-8?B?WTVhSzhpWGdrOVlxVkxmTWRhK2FBMkYwbjU3Vm5PNFZpRlJHSGRwUFcza2Iz?=
 =?utf-8?B?NXFNN2VtSW5BdTFnWDNybDg2U3RuZkY0bm1KSFJ1V01pVzlsUzZLVStsRzhD?=
 =?utf-8?B?RVpoQ1ltcVlGMHRobXYvTmpPNE5lVmJrT0t5RTltZTFJUnhDQ1R0enJMZGlZ?=
 =?utf-8?B?a1JTRk54QUlEdWZEZ29JbkNaamNHR1VLdWo1dHkyd3ZMSkgvTlhjbjFPdzBt?=
 =?utf-8?B?UlppODJiR0cvakVvNlh0SGRCTWtPeGZuYll3MmJqMVRRWFBWalFxcDhZTXA0?=
 =?utf-8?B?aW5iSjdoZWk2Q013eDJkbXFOTG96akxwaHhRNzhhSVg3RDhBQTdEeVdxTm8y?=
 =?utf-8?B?ZHFFN1VHNlM3QTNkdTUyN2kxRlMvdWZZbDY0Sys3N0V4WmVEQmJWaTlSZW9X?=
 =?utf-8?B?aytudTk2Q2tWRVg3cTlvVm5Cc1Bia2FWVUxNU3ZwTTlDOW5qT3dSMTBaM3Q2?=
 =?utf-8?B?YnFYR1JGVFRsa25mZXFvRElMeks5Q1Z4YlJGWnJoTmdXcHRabThSSklSQUNn?=
 =?utf-8?B?Sm14VEN1eUZCcjM0bE9oWDhBZ0JNS25vVnkzclNBekk4b0JHMnAzcGwvdFhU?=
 =?utf-8?B?eGF6aFd4cW8zOFBmRm51UDVLYkZ4aUJNd09lL2VJaWx2c2FodXdCc1pXOWpz?=
 =?utf-8?B?Wkdlc2Z2RHhnVTJGVDlzTUhrNTZ2LzJ5aHUxTXJhVTBadWlYKzJoZEgwcFQ1?=
 =?utf-8?B?am9lMGQzMWVJK1YxUjJmeVR6eXhRR2RSMlJ2TWtUc2Jtc0Z1T3NWdituSWZ4?=
 =?utf-8?B?UU5rT0tMOGU2M0oxcVgwM1ZJKzllS2tTTk1zdG5wZ3FCUCtESlBuNDdLMWRp?=
 =?utf-8?B?citoNGVKTm92YzNaYmFIZk5naG9SUmswY3YreSszNWxUYVgzWVlKcVZPRFRT?=
 =?utf-8?B?cU1KbTYvbE9uTnpjTDdac1d1cHR4M3g2TlY3ajRxVUZ0QzZ3bUxsUDg1Q090?=
 =?utf-8?B?cldWcE10dXVJT08xZVAvYW9BbkhuTVJyaE16c2xGb204ZkI0QUF6Y0pkREhM?=
 =?utf-8?B?SWtQS1pPazJUWDU4SHdpWU9TY0lqR0pKdFdIM2tPUFk1QlI3clU1bnczSjVG?=
 =?utf-8?B?bnVGL1h2M0FjRHlCV2JjNXdWQVNDVTBOQjg0MmJFWGJBaDd1ZDdWcWpsSzZv?=
 =?utf-8?B?U3VNY28yandIWmFWK1kvNTdwcDZNazlzQXVIdUtjQXZmSFliNENLSkduMys5?=
 =?utf-8?B?WG5TbVJLQzFZMzZrQUtUQWlWbCtoMDAwOVVFWm0zYkM0aVRXZHFGb29qNktB?=
 =?utf-8?B?Uk9lVDBpaDRvQnhCV0lzZTJXSTgxMHRJK1k5NDkyQ1BHMFJFTXZ0OHlrUEp4?=
 =?utf-8?B?dHNoaTNDcFA4Z2JMbGtneDBrcDFrRVpaODByTVRHZnNsek5tVW9VVHZJMzEy?=
 =?utf-8?Q?Fg+2wSnIM/LwSw1sbJdM2vwzv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC427B20461EEE49994F93487D37FC1C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee83557-6481-4143-53f0-08da560e2592
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 18:19:58.5599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqNu6jkYIgqujP6OD7+xX4IqzefQR2Ld8IktDWzrGoN/j4KJ+W1edY8kv0gJt1i9mRuDEAMWU3+jnjKDH9KIlIJpKBVoJbnm2pyAOAb84LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4371
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjQvMDYvMjAyMiAwODoyMiwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGVzZSBlcnJvciBwYXRocyByZXR1cm4gc3Vj
Y2VzcyBidXQgdGhleSBuZWVkIHRvIHJldHVybiBhIG5lZ2F0aXZlDQo+IGVycm9yIGNvZGUuDQo+
IA0KPiBGaXhlczogN2E5NmI2ZWE5MGE0ICgidXNiOiBtdXNiOiBBZGQgc3VwcG9ydCBmb3IgUG9s
YXJGaXJlIFNvQydzIG11c2IgY29udHJvbGxlciIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJw
ZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy91c2Iv
bXVzYi9tcGZzLmMgfCA1ICsrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL211c2IvbXBm
cy5jIGIvZHJpdmVycy91c2IvbXVzYi9tcGZzLmMNCj4gaW5kZXggOTk2NjZlZjhhZjA2Li5hNjlj
YTMzOGVhY2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL211c2IvbXBmcy5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL211c2IvbXBmcy5jDQo+IEBAIC0xODEsOCArMTgxLDEwIEBAIHN0YXRpYyBp
bnQgbXBmc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgICBn
bHVlLT5jbGsgPSBjbGs7DQo+IA0KPiAgICAgICAgICBwZGF0YSA9IGRldm1fa3phbGxvYyhkZXYs
IHNpemVvZigqcGRhdGEpLCBHRlBfS0VSTkVMKTsNCj4gLSAgICAgICBpZiAoIXBkYXRhKQ0KPiAr
ICAgICAgIGlmICghcGRhdGEpIHsNCj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07DQo+
ICAgICAgICAgICAgICAgICAgZ290byBlcnJfY2xrX2Rpc2FibGU7DQo+ICsgICAgICAgfQ0KPiAN
Cj4gICAgICAgICAgcGRhdGEtPmNvbmZpZyA9ICZtcGZzX211c2JfaGRyY19jb25maWc7DQo+ICAg
ICAgICAgIHBkYXRhLT5wbGF0Zm9ybV9vcHMgPSAmbXBmc19vcHM7DQo+IEBAIC0xOTcsNiArMTk5
LDcgQEAgc3RhdGljIGludCBtcGZzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICAgICAgICAgIGlmIChJU19FUlIoZ2x1ZS0+cGh5KSkgew0KPiAgICAgICAgICAgICAgICAg
IGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIHVzYi1waHkgJWxkXG4iLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgUFRSX0VSUihnbHVlLT5waHkpKTsNCj4gKyAgICAgICAgICAg
ICAgIHJldCA9IFBUUl9FUlIoZ2x1ZS0+cGh5KTsNCj4gICAgICAgICAgICAgICAgICBnb3RvIGVy
cl9jbGtfZGlzYWJsZTsNCj4gICAgICAgICAgfQ0KPiANCj4gLS0NCj4gMi4zNS4xDQo+IA0KDQpB
Y2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCg0KVGhh
bmtzIERhbiBhbmQgc29ycnkgZm9yIHRoZSBib3RoZXIhDQpDb25vci4NCg==
