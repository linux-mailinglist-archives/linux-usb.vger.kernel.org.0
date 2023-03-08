Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F0A6B0FE0
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 18:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjCHRKZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 12:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjCHRKX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 12:10:23 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89192685E
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 09:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GofJulRJvaT6osu+w1Y9k82Na8u4LPF9ViA2gigxzVjL5wFX8mMd2BuN8q1cYFfGHnM9q+5Rpb4c7gRShQZMMi7PTiWsYWzqB/F3Ci4rJtkrvoaQmrBEcINCoyr9CYaUUb1LcTjFe4AO9UhjqStco3bxvr1wDl+6wtl7aRQ0FvHSq48pHV2pLc9mXJimBL0CqdtWIQiAWJpWF/LfsUjEcxU6IYuALwhaPcEo3Em1PYo4hSD99DictnXV70w1eRMFg5TIzI9P4TfWFLZCtQFM4S2wwdhn/jYw0z9ciuSmVVq247YNC9B6DkL4lmg5MMRUNKhYx4OlZFKrnIsLa9pP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DYdTFOc0imy19LWx67cDdA1pccCJxihMXKYlpeZkr0=;
 b=NLKoXvMjaUIgymcK0EXVPw70Ii4INn8nLwXeEGXIw5FiEvmYTrn4Sjeqd/SYNOdPSka/Y/nFWHjgzNBrD6FizUmdH7Exc1Gcmrz8id7v6vmrPB6u8uLk0sSnHymoIkd3pjTio8s6ydFP2M1KeN24f0oDcIhdzUHj/HzjUIxs4kL8GqewqrrYYg3FQuH7pEcs6RuSb13bZAM7FTCcBk/CA9CQarsp+afyFl2EYzLuEy2FD/CNffcMFQ2LpLvr2sbzuqDlnbmrJ7bNne8R+yni9igshrbfTGBjE9dgA2qysX8g4Sg55A9T6jkRlAoZDeIv0NBYbTPUmpw5yPf6Ai8RSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DYdTFOc0imy19LWx67cDdA1pccCJxihMXKYlpeZkr0=;
 b=I/n3fC75cCBO71oZ5wAHtlbpGRLo1zqR1NJIyOgoqapoeK5pKutvF96Sdwk1nG+BT7TeEOJVi5CChz6lsB3rD/X+ywly8pPT1pfiXju5g0sTKYHMgZkEAW5zTF0NFbO73g/ZCNEyc2QsQnI6Ok4fjQZ/qT44KwK7epsDmIvgcUMsQL82K+HyK8w+f6DkRPkPrt4tHKM21QZ/5MRJTTHc3zt+W02Mv/UORcMlhgQyamyslcoOn8LwFgqenvcf5YcHP4OqFXZnCr2ieTnA3xPHqxvry4Isikcjj1TuRXgWjhbeLO44OchSEeDi2IL74Q3gdGhQhcfKRO+to11rAEtD0A==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by MW4PR10MB5680.namprd10.prod.outlook.com (2603:10b6:303:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 17:10:17 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 17:10:17 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "ran.wang_1@nxp.com" <ran.wang_1@nxp.com>
Subject: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPQ==
Date:   Wed, 8 Mar 2023 17:10:17 +0000
Message-ID: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|MW4PR10MB5680:EE_
x-ms-office365-filtering-correlation-id: 3f900af7-a5b2-4131-b138-08db1ff7fdac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQdhkd/ATdgIvqKrDhuawZTS2b9LyRTMOLP93OHGIdg1fgNv/XI0NR72DqwLlmh6ERvzK869o5fUACijrhx85YO2iIzpm2Zrjm7GDcbzjJ0k4oU3pFNH+MMXt2n6dFjVrLCgdaIPWccimXhZKXQjcy8V8az+Nq6rJcWwpn0Av7y7uJgTly854dTWeEmxGm33v0EE3lfMLLU955kqV5cW/gg7He3PEXZ5YMTOkYW6OOvONin9FZixpuOpIJ2BUzV7oX06w/HMw022DIErb0pui6BpOa20doQhbVp1Mvpke/YLDUMJL9K/LWhC5yBZjmcYZBu9ETslhJGoAzsCA06SkKPjEAwaz/UKX3YztZbKNn28Iqn6EHsf7SC873vagFc3Yuo7Rsw6R6EimoYFfMNOtNMocJG869Su1BNMboPbIfYNBQWBGVasjulwScbHjRQtsZB+rWFTPPfKUcjTToVWRpNg9vtC8J2/B5+NOrDIKIX+8tHhP2fwOYNuaFflwi7mZfrhFUJIwwru0Bf1TuB+5qjswB1VUK7yJWtbv4gzdLhFAvxieP5j/wARhw+dfYQSA+YT29YibID3AwLFZjyB8OmDajIv0NDXOKoQKRdJ4C6UOAD5lYvYYeXTIdJFVltgI5bMJznG7fGzIo66H6A94BMl/z7sAR1UiVMzfsecc1Lei7CeHcg3iBCsChr1NVxNvvE32NjyxagWJnxNN69C0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199018)(110136005)(6512007)(2616005)(316002)(122000001)(36756003)(478600001)(6506007)(66476007)(66946007)(2906002)(66556008)(38100700002)(66446008)(64756008)(8676002)(76116006)(91956017)(41300700001)(86362001)(71200400001)(8936002)(4744005)(38070700005)(186003)(5660300002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEhiRmRWUmpoZk1vNS85eU4ybkNyZWp0a3BkYW1DRGg3N3FSOFhMTGZ1OGRU?=
 =?utf-8?B?WlI2QVRSZ3NaeURZOXdpRTN5anZmT2lJSmUrTUJmN1lUTEZtbm8xdlJoamtW?=
 =?utf-8?B?eDNVTEpLeXpwNDJmVTBoZ28zM0xxM0psSkJJMTlySDFuSFVvd1QzWW5lTVRC?=
 =?utf-8?B?WGtBVUNtRzJ1VkJaeTlqYlpkR2RoVm9lZkhNTm1kY2hyMElQaHNyZUtZSmI4?=
 =?utf-8?B?UFVxekkrUW5Tb2F6VUFPT2ZQOUtSQS9lbElUaURiTURKTC9ZREtpMkRsaTRz?=
 =?utf-8?B?ZTJueXAxQWZoZnFyaktjS0ozR0pIRkkwd0lLRkxuUnJQUDNWTW16NythNkg0?=
 =?utf-8?B?M2ZFbFVqb0JuTHRhcXM1dHVFZnFoSHg5TlowT1dkQzZtNUdmZk8wMElVdVU5?=
 =?utf-8?B?SCtXbVd4SlRwNXRIbVRuWU1TUmcvRU9KVVoxUjF5QkIzcWhYQmgrQXRvck02?=
 =?utf-8?B?ZnUvNENqMHRLcmxTZElLU1c2SnptVVljbkUvTTFITkJ3VWR1RVFDRFpIU0NS?=
 =?utf-8?B?dEExQ3pwOWdLMjc4WWJyaFJvOGU2KzI2b2FRa2IreCtYajVtZkxPbWNUeXpz?=
 =?utf-8?B?K2ZEeTM5WTBjR2lLdkd2bXNTd1kzZkFQZmJObGFwNU9uWnZGNU1HblZVR2Nu?=
 =?utf-8?B?eXhxdW8yWTJjL0c3YWJRRDRya01DLytYYnlhd2N2bUNkTFZHNUFTM2hXS0t0?=
 =?utf-8?B?VjhKWU4wZzBVQUg2M2lxZFVZZHBlSUozYklIVWZoTGo4U0E2UGtmamJEOTFi?=
 =?utf-8?B?M2tKa291RHVETnU1T1pTYkRhdXh6K1hWcm5UMVAva3VIVG5IUGtQa1pxQjRH?=
 =?utf-8?B?RGFsV3hidTJGZGdlTkt3OVlaUWdYb0ZQL3ErVzBBcVhjVnlSbmZtSHpVZHE0?=
 =?utf-8?B?ZjJvVHF2RWpjMGNDcXczdmFzamMybU00aVdyMkN0ek9qRE9TU29lNXZpUjlp?=
 =?utf-8?B?YkM4NzgzbExVak05bGVreThZcmt6TGx3RVdRaXdWcnVLd1gvNGNBS3JwaENL?=
 =?utf-8?B?SmdBamhKZGpxNVJPZThzRmwwSjhNWDRMMVpldHp1cnpHeVNJUVZmNWNKUUVK?=
 =?utf-8?B?QzBucVZnS0F5R0NYcHVWTWdDcHZXYms2T3BJOTI3SVNTa2lSVEtZamdjcE96?=
 =?utf-8?B?Z0E4TW9TOUtvZ05JaEdDOFlTZmg2cnZWUlRDUEtjaWlwMHhiRzhReW1KMG9h?=
 =?utf-8?B?UVVESEMvYXY3SnB3cXUyVVRyS0I2bDgyVTEwV0tGejN3YjczaHdmWWE1VXo0?=
 =?utf-8?B?QTRkT3VsUlUwMWNvSmJQODhXYnd6UnR0RWFPWFRUcFdQaGozVUVkZXU3Y05I?=
 =?utf-8?B?b0lrY1NDcm9yQ0dtMEE5aTRNSzRSbTRrY05TVExvNHpRU3VJR3hEdDlyZEE2?=
 =?utf-8?B?dVJCMXEraGs0QzZwdVFPdHV0NGtsb0ZZR3h4WDRwSFBJVzJsbzFWd1BJQU5F?=
 =?utf-8?B?eW9Pc0FQbHFpRm5zVC9QV21uTEk3WXp6dXRtZmVrU2hVdDlPaUFnZGFIZTZI?=
 =?utf-8?B?T3Z5SGdaWUZBUkdCd1Jqb09HZ2Jta21wVENDaGtwdEJvd3dFei9xWTNFYzd4?=
 =?utf-8?B?cXlRR2xyVWE5b2pvUW9mN1k2TkJVUzh5TUU2SmxCYTNnUS9qdW14ME55WXJO?=
 =?utf-8?B?aXZoY2s5ZGtiV3VPRk9yVUlRaWx6bW52WnZud2x1eUlQWnZlRnQ4T2Z1RDFj?=
 =?utf-8?B?eFRvbytKTU1XcFFRa3pxRW9hNStGL0RZMVNjQVZXVEJsVENIVjQ4dnZZS0tR?=
 =?utf-8?B?OGQyRHZFa2hjVGM0ZGV5K3BqV1FoVTdZaWh1ODRWL1hpdS9md2hkYkxuN0NH?=
 =?utf-8?B?RG5kUWhpZkJXamhlMWZSa2hRVlNPaDV5MUc1YUE1cUxkeUJPbGtZeGNJYnEv?=
 =?utf-8?B?VURUTjk1aW5KSXU4YlUydVJ6emVIZUJZMFlYWUZRbGZaV1NPZ3pWYkpXakta?=
 =?utf-8?B?cGdMd3liUW1LZ2l2U0I0MCtFYXFaZGlXU2dhVDNORWJkcThMWTlrMUJlTE5u?=
 =?utf-8?B?YjJQMkhGQm1hdEYvc3NLTjNqdUZ2dUs2NVFlTW1obk9oLzI3QmJ1V0dnZlE3?=
 =?utf-8?B?OHhxYTdOR240OXBCUnNSR3pTWkQ1dFEvdERyUWZBRFk1R0hQazZXdGRieTNQ?=
 =?utf-8?B?a3AwS0dVR2p4VnNhNkpKSTBoZ2pLS2x0U05CbXUrTHlRWUVHMmpPMTdoaG5y?=
 =?utf-8?Q?JCL3LPN7C0J78lIb+wd2rYe6be52Vj2Jdp5jXhlJQs1R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41B0DE039CF7F64896BA1073D39C1D64@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f900af7-a5b2-4131-b138-08db1ff7fdac
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 17:10:17.5756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUamxut459WkitaKiIff+SbrhLSvUWGEdhS9fbGhwAUXWHPcNP/KkAlSpIJnmwtsmkHBsHxBJepPonC707dcpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

d2UgYXJlIHVzaW5nIGZzbC1sczEwNDNhLXJkYiBiYXNlZCBkZXNpZ24gYnV0IHdpdGggYSBsczEw
MjNhIFNPQyBhbmQNCnVzZSBVU0IwIGluIGdhZGdldCBtb2RlIHJ1bm5pbmcgZWl0aGVyIE5DTSBv
ciBSTkRJUyBldGhlcm5ldCBvbiB0b3AuDQoNCldoZW4gd2UgY29ubmVjdCB0aGUgZ2FkZ2V0IHRv
IGEgUEMoTGludXggb2YgV2luZG93cykgb3ZlciBhbiBVU0IyIGh1YiwNCm5ldHdvcmtpbmcoTkNN
IG9yIFJORElTKSB3b3JrcyB3ZWxsLg0KDQpIb3dldmVyLCB3aGVuIHdlIGNvbm5lY3QgdGhlIGdh
ZGdldCBkaXJlY3RseSB0byB0aGUgUEMvbGFwdG9wIHdoaWNoIHVzZXMgVVNCMw0Kd2Ugc2VlIHNv
bWV0aGluZyBvZGQ6DQogIFBpbmcgZnJvbSBQQyB0byBnYWRnZXQgd29ya3MuDQogIFBpbmcgZnJv
bSBnYWRnZXQgdG8gbGFwdG9wIGRvZXMgbm90LiBIb3dldmVyIGlmIHdlIGFsc28gcGluZyBmcm9t
IFBDIGF0IHRoZSBzYW1lIHRpbWUgd2UNCiAgc2VlIGdhZGdldCB0byBQQyBzdGFydCB3b3JraW5n
Lg0KU2VlbXMgbGlrZSBwaW5nIGZyb20gdGhlIFBDIHRpZ2dlcnMgdGhlIGdhZGdldCB0byBzZWUg
aW5jb21pbmcgcGtncyBzb21laG93Lg0KDQpBbnkgaWRlYSB3aGF0IG1pZ2h0IGJlIHdyb25nIG9y
IGhvdyB0byBkZWJ1ZyB0aGlzPw0KS2VybmVsIDUuMTUuODcNCg0KIEpvY2tlIA0K
