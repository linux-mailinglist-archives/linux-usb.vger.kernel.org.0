Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 466D67783BA
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 00:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbjHJWj6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 18:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjHJWj5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 18:39:57 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7FF2D4A
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 15:39:52 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37AMYEJF010936;
        Thu, 10 Aug 2023 15:39:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=AvhICVelFg642sclsOea+zwBhDQGuUJBAd0IEnNGDbg=;
 b=KNkRDGhYC3qEocRFy6I81n9ja5hEm4CBlgvSGy6N8cB8I8atiPeDggz+8mJEKrzZmVsB
 0A+p4T6kS+042LSG20Cn2Jr4LXH3Sb5DVDV2/7Sst72hJtQvHyEOvSPwM3SNl9lF1ob0
 Rq6mya0G+H8E97cK7zaziJO2DQw5/U+pqpuuGVQpfmPDfu7FoYz70SPLkI0Bebzf3qle
 tFY4kYPfPtQBeC2DWofPS5BOzDMxdTX8YfEdkBmMqgmSjakhz6c263ctofYsFIoknWdg
 M2J7KBHAdp5XN+NVxHZgcr4xT4eYI7SUbx1THlpj+64GIqb7AOS+uY1030VcB8VakSlM Ag== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sd8t5r0f8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Aug 2023 15:39:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1691707181; bh=AvhICVelFg642sclsOea+zwBhDQGuUJBAd0IEnNGDbg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZAOd+suYqeJt6kYt7dn+sgG+h8Npu4YeGVPOf2As7TW+VQhsIRkN8sJX+2GDDGdU/
         WJabV8vIiwNhrSPG179iQTj16mnIBmHh/3L4wmrEZDxYYYdfp5u2vkKuB/t/Q6UBWb
         iz2KQ+/LXCFueQUcsbNq5qIrExQ4oTklOOSmzExb1dJrtjL82PebU8vFAwQvlKbcIp
         JR9fx7RFnEdbkn2AleswLAS13Gx25PV/OO4AVo1m3RvP62AU9uqztME2oZRKWCuZ6+
         z0XJpBLQSDQAlhKKBAoQCGnwdNpEZSX3NV7V4MdM4VUfSo7L58z7+XhM8W5FW3Fqmt
         s75DpDNVDZYHg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 49A3F40358;
        Thu, 10 Aug 2023 22:39:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 86E85A006B;
        Thu, 10 Aug 2023 22:39:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YV/aFv/V;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B977A40123;
        Thu, 10 Aug 2023 22:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzKi2MntWZEHISqq/m5oZG5JOC+Hjw4qJ0/3SqsPHWfdmtbp5VO5A+sHDlmEQ8ordYDSE9qwL9rVEReydpKI+sTSTGvbUqn1gZ0gXCNiVvLPTUdu5slNc03hhRHiR9jZPXg84xzYTyqMS2CHJUeVRYtISUv9KsVHEG17tIsZoHf8VQfhz4o8yDyAVsNv704WaxvH8nQPBZTGj6JXhtUvdJDS3bW0nxAYxRb3DMzrxI07BvvIUOQl6swiHcJrLcDvZNQhDSse3t90VZhekB1pkTckiAfFr8JpfwJgQ1eZqjV8Vxh7qJEC0HsHdL8emb4KBqOoPGBN4Ku9u7RHu9IrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvhICVelFg642sclsOea+zwBhDQGuUJBAd0IEnNGDbg=;
 b=S05Lw0fDEn/vE40Q/+ZAFGlHXw8knBOxm3mR7qX1EoZMmoSzA7anK6TBPkJPl2iJFbm84S8QMacQP0AfOM6/YF9zuQyHk9+qzZKbPyGoXr5PXq9JPXVlU3xqz1MURvOac+UNXcjsXrBoZpekcsan1etmICk1Lbe9Y17GuI4slpMYsWh3Sdq1sVOXgYDB8Rdp/kkXUgsn45KzpWE0fILv1PN2cTJeMBhk4J9oByVTeJ+wB/R0r/f+oLeEfEsQegLdfxme9tvg/AQ64lpdEwV2HqYCD08yhomJQVu/rqrBfqsmRmIUHPnDYlpLcP/L6aRBBPEa42OBOqCpGeD5JImABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvhICVelFg642sclsOea+zwBhDQGuUJBAd0IEnNGDbg=;
 b=YV/aFv/V6nkqPs88nSuZOsXpT3N6DxRtqEtpAwzj6WU12TAwroLeW5DdFjkNWaDnW7hwEMayyjE+miLDDX+Q2hi9gHz6udzGZXThr0+N7IRJjW8ScgeZNgT+w+D2HZlAsh6OhJsdr4exrQIxRzNtJIYJBgWPiBb2SDhs76oSV2k=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 22:39:36 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b18d:912e:908a:5952]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b18d:912e:908a:5952%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 22:39:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Thread-Topic: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Thread-Index: AQHZxwcxBbIIf0BjtUaoyoF9g1KO9q/itRGAgAAWDACAAPfSgIAAZg0A
Date:   Thu, 10 Aug 2023 22:39:36 +0000
Message-ID: <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
 <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
In-Reply-To: <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CYXPR12MB9320:EE_
x-ms-office365-filtering-correlation-id: 2b1da7fc-f2cb-4510-be1b-08db99f2acde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +BO7Czh0ZvE7fbMW7Da7cWywJ3VFUg3R5GWS3y7ua0UhZ6yS86t0aoM3eASPQANQ1swFg1M6VHjJEP24uOQANhJh9xCKBvHCMIzHtSRLxnVWNGt3iKstyyvP17S+hFgnehiiXURZsa+ZOlehX4whdY0J+V+9NXTAXGk2Whx9Bf5YwjuTHe6qfqgPhpWAmxxGDZ9kX3P2CldwueB/hUw2ksU/RGnJUbh0DIxSwzPSpzuSPKf6QFqhfieYaImNBEH5Enik379a+bSWmViSCOdBoQOK7Itjjq0D/aFcV0gP8CsM2yOMPXXLdqVnJkh52Y1p3wNBLIpovkywXKfIuFUg61iPXA+W6QwhHyFahuDdsMZhxQKnUqH7pGgHvGgAVFlHbzgFCO37CqESAOjq6fpU+kbW9Z1r+YTrJ/47fsMvFECz6h0eARfy+OQMfgU3kgY0DeXBW7JsGiqySBMDzwwfP5g7Wz5fX6kwlfgl1yw4jZrVLUjEWEnMPIf5wzr1c0fnwlVe4WtRqDSWNrdbu9kmznJLxKPgRGtr5xmfTkVjPQmH/TTrdRXT+Dnwa0sA6Ai0K6Rafjj+CMlhOzqjgeGbFup3ApxwmBE59LfEwCYZsrm2kHYgA7E0U0BbjnCdGmMe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(376002)(396003)(186006)(1800799006)(451199021)(316002)(8936002)(36756003)(6512007)(71200400001)(6486002)(8676002)(41300700001)(64756008)(66476007)(66556008)(76116006)(66446008)(5660300002)(4326008)(6916009)(66946007)(54906003)(478600001)(2906002)(122000001)(38100700002)(83380400001)(38070700005)(26005)(2616005)(1076003)(6506007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amNLbGp4alJETTJoYUdzdWRxeW95aUVGZU5WeEFCUmc0M3FIZHN1TDV3djJp?=
 =?utf-8?B?YU5uMlFYa2oxMWdmQWtJd3AvZXU0L0ZVdmhQZGlEYjUrOUhJQTR3OEpaV2dh?=
 =?utf-8?B?M3FDckJaMzBkWGd1amRJMEUzeE9Vd21XZGVpZXBBMVNlU2RxNkwraGtubUEy?=
 =?utf-8?B?UjhOOEVwRkdDL1pQRzdsb01oTHM0ZVRTSkhCZTc0VlFGSVUyaCsyZTBWTUdU?=
 =?utf-8?B?TEY5UnkzRkRnWWNkaHp1T0pFRXJoaTdNcFB1bXBsNmJWSGgxNE9zNTUvSHNr?=
 =?utf-8?B?VWtVUzhBRVhKb1RCQ0g1ZTQzZWUvdXU3Ri85T3N6RWRld3NmeE5NRGNBdW5u?=
 =?utf-8?B?dFh1OUR2ek1XS204VDNrejZ0RWtETm8zL08yQWdCNWRZOTRlMUlzRnE3VmQr?=
 =?utf-8?B?UVZHU3FSUDN5UkZMWVZ3UlZta1FuUzNoYkVsUVhCSERjSlN3dFc5NnRQZVlD?=
 =?utf-8?B?cG1OM0Vqb3NKa3dkTVNHNFFxSGtEblFuQ2haaEg4enV5V1hLUFE1S0NKSytm?=
 =?utf-8?B?RFoxc1AxVU9TQ1ZLd3Q5eVlqOW4yN0ZyVGhaTllMbWEyUFRERlpKZTF0OTZ4?=
 =?utf-8?B?bjBBQkpWQTlONE5yUXVoeEhJSkJ4RUozUFZwa2YvUHJRejJwT1J4Z3hES1A1?=
 =?utf-8?B?R3I0ZXAxdVZPbFZWeW1hTFkydERqcitpU1ArUUpyUEtyUnNnMXRVNC80ZlVw?=
 =?utf-8?B?ck8wOGFYdUgyL2Z4cXFWeFZRaEhUZ2tYZlBtYXJVNjJ3cXVOUVRsWEdGakI0?=
 =?utf-8?B?a1MzbnpoQ3VjU1kxTjVVc011NTdENzBFTnA2UXRqdW5FM01aZmJjQjFpL1JT?=
 =?utf-8?B?czNPYWRjUUdKaGF2d1k4Sk5kVER5b05FZDFQeGVNT1FJeUFQcEd1eFRCbXEz?=
 =?utf-8?B?ODU3WkNmN3pOM005ZnBDYjFMSDJHd2hvUTUzVVV3MlVpajZmL2RjZFRuZDNW?=
 =?utf-8?B?TDB2NjVpT0JRUVd4d2JZN1NVaVNXVzR2Z3poZWhZS3hRdzRBTGtTSFhaR3hO?=
 =?utf-8?B?RlZOWmVVWXBEWWdCQXMwRzVsUHBSTjJ5ZXQ2UFNObW50VjEwTGNJRHlYWFlY?=
 =?utf-8?B?cVFjT21GMzZzWVN6Q3VjY1YrTXFDUGQ0cm5ObTBHSVYrZjRMYmpJNHErenk0?=
 =?utf-8?B?RHlLMm9IcWNUWEVKT0Vab0oxQTZndTBIck1EblNocnNtZDJOeHF4QkNwU3dl?=
 =?utf-8?B?Yy9aUEp6SmduWVhsbGpOSHltbmNWSFBuQ3lwVzVINWdMUU5CdnowYW9hMGtK?=
 =?utf-8?B?RFVveitxYWs0dDNSV1I3VmhsM3VnSjlsaW9BTERTUENNeGNyanEyQU03M1Js?=
 =?utf-8?B?WEo2ekg3K1RWUlIvdDgyTmd0NlhYclR4b1FQaFpBNCtIVzJVK0xWMVNYbEdY?=
 =?utf-8?B?V291SDNDU3RmbTh4UiszalRyS3Q0bXArU3RDWkFHeWVTdmlLRi9QaXZ5ZDdV?=
 =?utf-8?B?aklwZWZLV09NVERoS3J2MURpWXBuRnpOdkp0Y255ZjhqeFlwM2VPOFNET2Nx?=
 =?utf-8?B?Y3E3cXZWdzNUU3k1UW9nNjFBN1laNS9XSXRlbVlETU5hZW40U0toRGNsZmln?=
 =?utf-8?B?TkxiSkNMbHRFOGUrU2Y1RHlFazhxQmwvS1AxcEpOQitUK2VSUGEwaytIS2c2?=
 =?utf-8?B?YnM0a0M5b1Q0bTlTYW9FZkNGSlZjVDJFSDBzK3pRa0FiY210WjNTMzViWTAx?=
 =?utf-8?B?VU9kZjNxMzBvZjlmaEhtUnkydkgvTG04cmlQWEp0czJMT2ZBOElmRGxBSk1j?=
 =?utf-8?B?RTlMVEpqL0MzQ3RQTGxwL1I4cE5hNnBjS2pPTnU4RTk1WUtDc3c5UFNqWUsr?=
 =?utf-8?B?OC9yMlFkOU9ZOXRHK3FPR0VZS2NVcTlLU25YVHdNTEJJbnViVHYxZ2Q3MG9S?=
 =?utf-8?B?ck1vdnpMVUUwS3RINk1UUjYwU3IwdFNWbFpqdTlhb0ROVWpsS2tYVkNOL3NN?=
 =?utf-8?B?WCtkUHRkczFEcDd0Rys1cEcvUnhHeVE5TGVmZy8xOVkzdFgzV25TVHFzZlNw?=
 =?utf-8?B?ZzRmNHVrRVpTY1l6aHcxMktreVVBanVuZTd6SXErU2tNYzFVY1FnS3I3SnUz?=
 =?utf-8?B?RnNFenhGNThtR3BLczEraFBJcXNhT2lYU200ald3VjdRS3VySU03SFlJSTl2?=
 =?utf-8?Q?5ILHo9JHKVQ9tW6GN1m0w1YO7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7BE7D90CC95E24CBFDE58A00EEAA074@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?dkU2Si9GM1lTMkJuN3dEczFtWUNGY1pOODRBbGVmN3IxN2pCajhGK2g4U3pW?=
 =?utf-8?B?VU9OZzlnTnBWRkgzdW51TXdpdks5cGM4a2U3am8rcUsrcXVSSWJNSE5rb2xI?=
 =?utf-8?B?WkV1dEsyMnZvRHJ2U0F0UE9CVG1JVVo2WkM2T3Irb1pTRUMyWVdMQmVrbG5u?=
 =?utf-8?B?MlZYSSszbmc2bzBJeHVXYmdzTVViNkNyUE9jS0FMMXRnbndUL0t3ZTZjaHdj?=
 =?utf-8?B?WHA3K1dFYVlWMEZtTDVGQldQVjZPU3BPeWlXckFYbDJ0ZW8zMG11R2hqN2hx?=
 =?utf-8?B?ZjNCOGhtdStaK3JBTGFuSHBkbnllUE1ZMG1oR2E4WEN3YnNaRHNaM0VDeGNN?=
 =?utf-8?B?enhGaXlnTkJsREVuTmVoOURWTTQ5OUlJYXAxQStzbEU3Mk81Q1ZlcUlVcVhJ?=
 =?utf-8?B?WDgxcWh4Z3grYjZza0JlVllMRkpwc20zblArTUNndk9OekliQWxYcVh1MG5w?=
 =?utf-8?B?VHIyRTBBQ1FLRTdQQjhmWnFKNjU0eENaNnhOUFRUUWdGbUVqNG1ZU1FSMTBJ?=
 =?utf-8?B?S2x5bWN4RDdMN25UTjNnMUhrcnh6THBMcDkzRDNOdmJOMGNvNm93Y1VoK255?=
 =?utf-8?B?Ukd1a0U1c0tXditUeFNqOWRZdy9XRHpZNFVkSERGK1FSS3Y1SWN4SURFMkJY?=
 =?utf-8?B?K3ZNV2FNVzYrTno4LzlJTk9RdkFHMnpUWEhIQzh2TFFEd29NeXhCbDN3RnFs?=
 =?utf-8?B?a3ZPVUFVNWwvU2xkTld4L0sySFgwNkJINnpEcFJlVm1NRE0xVjduRHRGV2c0?=
 =?utf-8?B?U3d2UDZZbE9XQW82WmIxZWMwOEZtWEMvaVRUS3lsS1dTcExJQ21taUVzVktN?=
 =?utf-8?B?c0c1M0ZEWVRSb0tLaGNUckpSc2dqb0VKU1h0Zlh6TFY1U3dobU45UjREM091?=
 =?utf-8?B?cmNKYldCZ0MyT3ZGWG0xV3A4aGQ0V25EVS9lYnhYd3JPSldPN21ONnNYSjVa?=
 =?utf-8?B?Vk8yNTVaTjFjblgvb2VWUFQ4dHZ4UG8wS1VPMEJvYnFsc3YyN2lORGtQUXZB?=
 =?utf-8?B?NEpOT1F4Z2o2SkwxOVRhQUFJd0NDK3lQUkFtVzRHaXMzd0NTYlJvbW93UUwr?=
 =?utf-8?B?ajdpMStIRXYwUmRkdE9UOGZwazcwVVBuSnFhTHFxTStIRVpGZzJGYW1CeGVJ?=
 =?utf-8?B?TnA0OUIwbE11OU5BbjlNc2kySzNheFdNYnF6NzlYNHJOS3FGME1jaGMzZVdS?=
 =?utf-8?B?Q3o4UDc5Y1JPRWlBaHkzQXRrbFJidXVqT2xVRlFZYy9PSUFyRGtoMnhSN2dk?=
 =?utf-8?Q?N1DJ0m0ha/Ryx/l?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1da7fc-f2cb-4510-be1b-08db99f2acde
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 22:39:36.3992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkcWQSCoY4y6U57Vvz/nmffWzUkPYknVNgxTxjTVM0V6OleVqqCbNJ2a+K1HCfGVPotZm0PI3+XQnZQje8d10w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320
X-Proofpoint-GUID: y3U7_C2E_ZPivemuhCibCNVoK2LVoE9U
X-Proofpoint-ORIG-GUID: y3U7_C2E_ZPivemuhCibCNVoK2LVoE9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_16,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=598
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308100195
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBBdWcgMTAsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFdlZCwgQXVnIDA5
LCAyMDIzIGF0IDA5OjQ3OjE0UE0gLTA0MDAsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gT24gVGh1
LCBBdWcgMTAsIDIwMjMgYXQgMTI6Mjg6MjdBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
PiANCj4gPiA+IFRlc3RpbmcgZnJvbSBHcmVnJ3MgdXNiLW5leHQgYnJhbmNoLCB0aGlzIHNlcmll
cyBjYXVzZXMgcHJvYmxlbSB3aXRoDQo+ID4gPiBkZXZpY2UgZW51bWVyYXRpb246DQo+ID4gPiAN
Cj4gPiA+IFsgICAzMS42NTA3NTldIHVzYiAyLTE6IG5ldyBTdXBlclNwZWVkIFBsdXMgR2VuIDJ4
MSBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkDQo+ID4gPiBbICAgMzEuNjYzMTA3
XSB1c2IgMi0xOiBkZXZpY2UgZGVzY3JpcHRvciByZWFkLzgsIGVycm9yIC03MQ0KPiA+ID4gWyAg
IDMxLjk1MjY5N10gdXNiIDItMTogbmV3IFN1cGVyU3BlZWQgUGx1cyBHZW4gMngxIFVTQiBkZXZp
Y2UgbnVtYmVyIDMgdXNpbmcgeGhjaV9oY2QNCj4gPiA+IFsgICAzMS45NjUxMjJdIHVzYiAyLTE6
IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvOCwgZXJyb3IgLTcxDQo+ID4gPiBbICAgMzIuMDgwOTkx
XSB1c2IgdXNiMi1wb3J0MTogYXR0ZW1wdCBwb3dlciBjeWNsZQ0KPiA+ID4gWyAgIDM0LjgyNjg5
M10gdXNiIDItMTogbmV3IFN1cGVyU3BlZWQgUGx1cyBHZW4gMngxIFVTQiBkZXZpY2UgbnVtYmVy
IDUgdXNpbmcgeGhjaV9oY2QNCj4gPiA+IFsgICAzNC44MzkyNDFdIHVzYiAyLTE6IGRldmljZSBk
ZXNjcmlwdG9yIHJlYWQvOCwgZXJyb3IgLTcxDQo+ID4gPiBbICAgMzUuMTI5OTA4XSB1c2IgMi0x
OiBuZXcgU3VwZXJTcGVlZCBQbHVzIEdlbiAyeDEgVVNCIGRldmljZSBudW1iZXIgNiB1c2luZyB4
aGNpX2hjZA0KPiA+ID4gWyAgIDM1LjE0MjI2NF0gdXNiIDItMTogZGV2aWNlIGRlc2NyaXB0b3Ig
cmVhZC84LCBlcnJvciAtNzENCj4gPiA+IFsgICAzNS4yNTcxNTVdIHVzYiB1c2IyLXBvcnQxOiBh
dHRlbXB0IHBvd2VyIGN5Y2xlDQo+ID4gPiBbICAgMzcuMjU4OTIyXSB1c2IgMS0xOiBuZXcgaGln
aC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA1IHVzaW5nIHhoY2lfaGNkDQo+ID4gPiBbICAgMzgu
MTE1MDUzXSB1c2IgMi0xOiBuZXcgU3VwZXJTcGVlZCBQbHVzIEdlbiAyeDEgVVNCIGRldmljZSBu
dW1iZXIgOCB1c2luZyB4aGNpX2hjZA0KPiA+ID4gWyAgIDM4LjEyNzQwN10gdXNiIDItMTogZGV2
aWNlIGRlc2NyaXB0b3IgcmVhZC84LCBlcnJvciAtNzENCj4gPiA+IFsgICAzOC40MTcwNjZdIHVz
YiAyLTE6IG5ldyBTdXBlclNwZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlciA5IHVz
aW5nIHhoY2lfaGNkDQo+ID4gPiBbICAgMzguNDI5NDI4XSB1c2IgMi0xOiBkZXZpY2UgZGVzY3Jp
cHRvciByZWFkLzgsIGVycm9yIC03MQ0KPiA+ID4gWyAgIDM4LjU0NTMxNV0gdXNiIHVzYjItcG9y
dDE6IGF0dGVtcHQgcG93ZXIgY3ljbGUNCj4gPiA+IFsgICA0My4zNDczMTJdIHVzYiAyLTI6IG5l
dyBTdXBlclNwZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlciAxMSB1c2luZyB4aGNp
X2hjZA0KPiA+ID4gWyAgIDQzLjM1OTY1OV0gdXNiIDItMjogZGV2aWNlIGRlc2NyaXB0b3IgcmVh
ZC84LCBlcnJvciAtNzENCj4gPiA+IFsgICA0My42NDkzMjNdIHVzYiAyLTI6IG5ldyBTdXBlclNw
ZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlciAxMiB1c2luZyB4aGNpX2hjZA0KPiA+
ID4gWyAgIDQzLjY2MTY4MV0gdXNiIDItMjogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC84LCBlcnJv
ciAtNzENCj4gPiA+IFsgICA0My43Nzc1NjZdIHVzYiB1c2IyLXBvcnQyOiBhdHRlbXB0IHBvd2Vy
IGN5Y2xlDQo+ID4gPiANCj4gPiA+IEkgd2FzIHRlc3Rpbmcgd2l0aCBvdXIgaG9zdCBhbG9uZyB3
aXRoIG90aGVyIGNvbW1vbiB2ZW5kb3IgaG9zdHMgd2l0aCBhDQo+ID4gPiBmZXcgMy54IGRldmlj
ZXMuIFJldmVydGluZyB0aGlzIHNlcmllcyByZXNvbHZlcyB0aGUgaXNzdWUuIEkgZGlkbid0IGRv
DQo+ID4gPiBleHRlbnNpdmUgdGVzdHMgZm9yIHZhcmlvdXMgc3BlZWRzIG9yIGRlYnVnIGl0LiBJ
IGp1c3Qgd2FudCB0byBub3RpZnkNCj4gPiA+IHRoaXMgZmlyc3QgcGVyaGFwcyB5b3UgY2FuIGZp
Z3VyZSBvdXQgdGhlIGlzc3VlIHJpZ2h0IGF3YXkuDQo+ID4gPiANCj4gPiA+IEkgY2FuIGxvb2sg
aW50byBpdCBhbmQgcHJvdmlkZSBtb3JlIGluZm8gbGF0ZXIgdGhpcyB3ZWVrLiBJZiB5b3Ugd2Fu
dCB0bw0KPiA+ID4gcHJpbnQgYW55IGRlYnVnLCBsZXQgbWUga25vdyBhbmQgSSBjYW4gcHJvdmlk
ZSBsYXRlciB0aGlzIHdlZWsuDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGUgbm90aWZpY2F0aW9u
LiAgVGhlIHByb2JsZW0gaXMgYWxtb3N0IGNlcnRhaW5seSBjYXVzZWQgYnkgDQo+ID4gdGhlIGZp
cnN0IHBhdGNoIGluIHRoZSBzZXJpZXMsIHdoaWNoIGNoYW5nZXMgdGhlIHdheSB0aGF0IHRoZSBp
bml0aWFsIA0KPiA+IHJlYWQvOCB0aGluZyBpcyBkb25lLiAgSG93ZXZlciwgSSBoYXZlIG5vIGlk
ZWEgd2hhdCBwYXJ0IG9mIHRoZSBwYXRjaCANCj4gPiBjb3VsZCBiZSBjYXVzaW5nIHRoZXNlIGVy
cm9ycy4gIEkgd291bGQgYXBwcmVjaWF0ZSBhbnl0aGluZyB5b3UgY2FuIGZpbmQgDQo+ID4gb3V0
Lg0KPiA+IA0KPiA+IFlvdSBzaG91bGQgY29uY2VudHJhdGUgeW91ciBpbml0aWFsIGludmVzdGln
YXRpb24gb24gdGhlIG5ldyANCj4gPiBnZXRfYk1heFBhY2tldFNpemUwKCkgcm91dGluZS4gIElu
IHBhcnRpY3VsYXIsIGRvZXMgdGhlIC1FUFJPVE8gZXJyb3IgDQo+ID4gdmFsdWUgYXJpc2UgYXMg
dGhlIHJldHVybiB2YWx1ZSBmcm9tIHRoZSB1c2JfY29udHJvbF9tc2coKSBjYWxsLCBvciBkb2Vz
IA0KPiA+IGl0IGhhcHBlbiBiZWNhdXNlIG9mIHRoZSB2YWx1ZXMgc3RvcmVkIGluIGJ1Zj8gIElu
IHRoZSBmaXJzdCBjYXNlLCBob3cgDQo+ID4gZG9lcyB0aGlzIGNhbGwgZGlmZmVyIGZyb20gdGhl
IG9uZSB0aGF0IHVzZWQgdG8gYmUgbWFkZSBieSANCj4gPiB1c2JfZ2V0X2RldmljZV9kZXNjcmlw
dG9yKCk/ICBBbmQgaW4gdGhlIHNlY29uZCBjYXNlLCB3aGF0IGFyZSB0aGUgDQo+ID4gdmFsdWVz
IG9mIHJjLCBidWYtPmJNYXhQYWNrZXRTaXplMCwgYW5kIGJ1Zi0+YkRlc2NyaXB0b3JUeXBlPw0K
PiANCj4gTmV2ZXIgbWluZDsgSSBmb3VuZCB0aGUgcHJvYmxlbS4gIEkgaGFkIGZvcmdvdHRlbiB0
aGF0IGF0IFN1cGVyU3BlZWQgb3IgDQo+IGZhc3RlciwgdGhlIGRldmljZSBkZXNjcmlwdG9yIHVz
ZXMgYSBsb2dhcml0aG1pYyBlbmNvZGluZyBmb3IgDQo+IGJNYXhQYWNrZXRTaXplMC4NCj4gDQo+
IFRoZSBwYXRjaCBiZWxvdyBzaG91bGQgZml4IHRoaW5ncyB1cC4gIExldCBtZSBrbm93IGhvdyBp
dCBnb2VzLg0KPiANCg0KUXVpY2sgdGVzdCBmb3IgR2VuIDEgYW5kIDIgZGV2aWNlcyB3b3JrIGZp
bmUgbm93LiBIaWdoc3BlZWQgYWxzbyB3b3Jrcw0KYXMgZXhwZWN0ZWQgYmVmb3JlLiBJIGRpZG4n
dCB0ZXN0IEZ1bGxzcGVlZCB3aXRoIHZhcmlvdXMgTVBTLCBidXQgSQ0KZG9uJ3QgZXhwZWN0IGFu
eSBwcm9ibGVtIGxvb2tpbmcgYXQgdGhlIGNoYW5nZS4NCg0KVGhhbmtzIGZvciB0aGUgZml4LA0K
VGhpbmg=
