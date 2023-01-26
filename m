Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879B367C164
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 01:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbjAZAUe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 19:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjAZAUc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 19:20:32 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F185355D
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 16:20:31 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PJrclh015399;
        Wed, 25 Jan 2023 16:20:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=csbANMkcQxen8cjsVw2Pu80KhonWB8XAX0TySmP9Mqk=;
 b=d6KWsJ4PpSyRd4DY8srbpiEBYLksQhIDrE8xvnrutWiVxH5AFBNsw9Q4P0QotAuEe4og
 91hp1zAv+CS5+ljKXYOZ8RfwXv1NeChZgVP7tHrnX+jysnx4WyM77mquY9ah74X11zDS
 enarz6m/TMd9qW4axd0Wjp/guViMRErazbL0n4WUqKyn90dnzgrnS1drl8whbs1VyUk/
 A9FLabAV5cgyLYksLfih6TtIJ0orehX6O7mM23Rm8G2lhIontnz7KPOfy9U/KAwy42vC
 Fce9Mm+mmKElw+UbfPEH0lo74MTdoSSRUJehyuhHbB2Fqf4Oxi7SS3XwpHKKjZ5fcZDe 4A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n8fuyw44n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 16:20:27 -0800
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 793F0400F0;
        Thu, 26 Jan 2023 00:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1674692426; bh=csbANMkcQxen8cjsVw2Pu80KhonWB8XAX0TySmP9Mqk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Ewp5LLv96O461pX9tYMX2kSRgRLx2nzVcA5PAPYDVZ3mZ2MkEN/YxD4N7nYg+CZJt
         Xm7G9nsnuB60XRolBA31QDw7Cwp/UgSZHyhXsnFx3XnJYJYtnqQeRL1XXx2JJecR06
         A3a4IhL70qJUjK12OfHurOt+VJy+2+PtmC2A6byT88IMfzn2pDG0n1CQPbapuAQgw0
         S6FfUWkv9azX4XvZYd/PTLv0vzc56IXPh+8bToGzQ6oxi0+0bInb5GwJib6B/pozwM
         5falFMxtP5kYrxahDk4vlg20CyCBWfHt2NGD2bGF3TH16sliSZZdPyJUqApx9AmON3
         SNHUE7gsjXZcA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1B742A005C;
        Thu, 26 Jan 2023 00:20:25 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6796E80199;
        Thu, 26 Jan 2023 00:20:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="SDvVC5Kh";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTi6U3/5xLIgvQIWNp7BI+/vRAXSlQTLWDrrHxEAZR+aBow49jypa1IuW5hy3VC3/QkLEP+lvA3w9ooFUqPdIIzcG3PF5vO4r07n24d9zRS46HTcDEK+SNkiPjVBcDfJ5+PM4FApdrH8vFnJ9sxKaBUVv6UIA76M686PIn/c52SiAgXz6voXdnIzae5gcwoM6+P+V55KXxkHiuCBA1FBpWwLLZ3BWbXzzNQCVm/UH87VQDb+pZkuw2pckqsgKhhM8h/j/s446u/HDJM7HhafS9UcGN19pMttA7KuNYpbgZhovjAzbGdy1giM/yJj4IEAQGZyZ5d9qBtXA8LwyihtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csbANMkcQxen8cjsVw2Pu80KhonWB8XAX0TySmP9Mqk=;
 b=Yke6RljVmYuXhaoQ4XpugfD8pwxhQgad9150ENzUMMclCzSDMDtoVAYpSfNt3Z+DDypS9ShBx2Uoq2/swI9O0Km0D599UMnEKimJlAIKg5BUKl+e9FkzECuiLzBGiSE2CO7m5O3CQ3ItxfRfUoumawuZTCVY3GRj2YRyOB3HJlDXKK4m/tGhFD8zJVM28j6Mz2Y3rWXvzy1n2M2fBIX3S5cYD3gfiDnsNTfknK0Z1V1bRBqgTplBN3k517d96HWODYClJRXNiPJ5EwEkPLB37euFc5N5yCYtRgyW4vAzjvKPsCSxeNcFj47lgb5RJYWnjeQFW3b9vwsOaubVKMtjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csbANMkcQxen8cjsVw2Pu80KhonWB8XAX0TySmP9Mqk=;
 b=SDvVC5KhhJ3NhFmhq3eXGS2sEuiKNab4caZxwixZpa+Z8ri16T4yqQ5XtMOJTtL7QKhK4sgOG/GjZw1bpmZsRuunGWi2PYfjRTrn3rJ3KF/zeZvLx5SLRUcgEx9s0VYe2Ae2RH9htmgINs9lW1hU3MWjqPeshdyQmxy4MYbDh2Q=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 00:20:22 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 00:20:22 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Explicit status phase for DWC3
Thread-Topic: Explicit status phase for DWC3
Thread-Index: AQHZL//6d6BOk0ADk0qR28S95Y3SOq6v1++A
Date:   Thu, 26 Jan 2023 00:20:22 +0000
Message-ID: <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
In-Reply-To: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY5PR12MB6599:EE_
x-ms-office365-filtering-correlation-id: c71dbea7-95e0-4e7f-7902-08daff331d31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8v6YkBFEkZ0wWhU6d/vtiGSAVNrGBX9LDxtijBHZmNSM1W77mUd1fdeE9/fLJaKLoxi8uoe3SQeZTL/Hh2PanYkqUZ/vQw1jdjiCHBeEdb65dUhEv1nKigOT1UePc3mhp3PxZ7ruQJ9pMlzeP5MNeYLW+ySTKvTjIcLIZA20Bx8nCh29qM54j7HZUp70iEZF3fNiEKWFbZYb/aoDKfbml9osNbnKD45LvNNr5IBfLQb2fHWzgOs1pIBrT5b4LLtBbVm8wQO7mhUvzwpLDHY0KwLU5nv+XE/xH2Ff4jI9KT5X0CezCa1USlRC4kw5diiX/HERBhqk1TQajpCplyXzksmxnA9PNPe850XD5oQAn1U+dpcEEk8+yuc8UyqjY53+YjqHY3Ut0LBa8nuXOwqOucH4O4K/7MA9/KCZWRvd5G7bBXmmVBsS31m3z4Gl/XHqabKR5Km7O5Jtip1rHJvJaT6VGD8OTjyuahJV9fboJ7ipVAW8TIVATpuy6P/fJsxnu9UF1MpTyF3NYcMssehKbixy7bIlevhQew7VRdaOwQ15FyjE/HxaBmVNb9FZHBjzFNey9Nr9DqUKuswWsMNiontiY4wm+Bjurn5+5RfLQC4YywHiwcQTML8+hc6rOa3MKOd60yJoj+uHLmDqh1bVhIeLr+aRMMUFAZShrytT2XFOLP4EsYYNjVToEIOCvpfFDyPy3EI3CIN5GeCQcc/oxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(83380400001)(54906003)(316002)(4744005)(38070700005)(2616005)(2906002)(71200400001)(36756003)(478600001)(38100700002)(8676002)(6916009)(66476007)(66946007)(76116006)(66446008)(66556008)(64756008)(4326008)(8936002)(41300700001)(86362001)(5660300002)(186003)(6512007)(26005)(6486002)(122000001)(6506007)(1076003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXV0VWczNkdBaFE0OW9iVFhvQWRzc3cwK2NsalM1WUVVdnUvVWtuRkdTZVFw?=
 =?utf-8?B?ZEUvTmY4SzZucHE1VGJRT3JHNVJtMWhaOHRoSjhxMnluN0dNVUo4UHNFYVpY?=
 =?utf-8?B?M3ZLYmNVeXA5WmJHWTdXeEM4YXFxUHVQZXRCL28zSkthYUR0SFJJVG0wWUVB?=
 =?utf-8?B?YzFrdlM2WTB2alFIV0tqYytVTkJQWEhEcVFnSFU1NjJtV2hja2dBUHNQNTNP?=
 =?utf-8?B?M3lUSUExQy9lRWloYTkrVzBvNGJkUUE0WDVaY3QvMGNRUU9lTXE3NlpCVk9X?=
 =?utf-8?B?dG1TN09TaGFJSTM4eFA2WWJFRUZjWnZHSFdXSjFYM3MrZjFxVjhiK2gzdVRn?=
 =?utf-8?B?eG9sNGtWc0tOT3RUNk9FdzYrTS9IYTAvc01PeDU5ZlBhMkkwVUNJVzY0Tko5?=
 =?utf-8?B?a0YyaE9SWk9FZGhPeVBneHJzQWNoSUExZjcxMVhvZmtyYUZEK2RYNnhaNnlJ?=
 =?utf-8?B?ekJtZ0pjU0RTTHhSNFowVnlZdXVsOXBnVzBJVk1XVVFYRHRUY3dQREtuNWVS?=
 =?utf-8?B?dUFsZWtzQTR1NzJ1dFl6WTJFNERWcjRBR3cyT2JRQXY2U1V3aXR3UzNmaCsy?=
 =?utf-8?B?NUcwdTJrcFcyem84Ym5pdSsvZkI3QlB3L2dYbnJPRlZrbkttcnNFMlIxSlZF?=
 =?utf-8?B?N0hFeUM2NVFCaVArT3pWVE51TnNNWXBxTXh5NWVYVS82b0pNdUtCd1hhNnNl?=
 =?utf-8?B?dXVJL1FCWG5iMlg4TzA2amlVV09oaG1WSmUvUjdiNjJJbGMzT2tSRVR4NmlD?=
 =?utf-8?B?ZFQ4STZvMGxpbzFhdW5nWk82b1Z6ckFFZExQTHZxT25mcjRZVlJXUnJBZU9L?=
 =?utf-8?B?SGVxdzlFVnpkZDFSUEFNeG5vdXZwZmtUQ3NPVGJqLzdrSjhyeFkyYmN4dUJm?=
 =?utf-8?B?SmlpZkM0WmFDVTI2QnhKS2FBS1VnODFxdEVia0NVVldWUjdJb3NiM1BLdmJD?=
 =?utf-8?B?QkNsUWFvazN2ZGVwZUtkcVZJNEpGQVJLTXl4Uk9EVmlzRlFlbm9hYVBIaWV6?=
 =?utf-8?B?VE5rUmdtSjdiTTlhNHhWc29nb0dqbkZKUkFZWHZIWDduVXRuYXdGMVQ3a0xN?=
 =?utf-8?B?bTdjSGIzK2ZzQmxlL05OT09RZ0M3dFN5NEdVUFNla2poMUpJeUp0TDRrL1NL?=
 =?utf-8?B?U0NwdVdoUmllR3hwNERPSHM0T0FtcWU1WncwNGdOYm55VzQ4TDJoSTVpcm52?=
 =?utf-8?B?Z3FXcmovTllPdVA2a1RmazZTOHhTNU80TWs2MTBvQ1VGcWoyQmUzeGJPT25G?=
 =?utf-8?B?TVZjQWVVdzdIOWJZRGRPTlQyUU01REZOR2E4aElMREtOUncvdmxnN3IzUjIv?=
 =?utf-8?B?OFpzR3V3RzBxUzlNMkNUYVJ3dHcwbDFNUGlGN0txaGliL1ZuNlhhL0oyVzJE?=
 =?utf-8?B?cXYrOHFNNWRjN1VkM0ZvQ3Q4VUNkYk5PVDY3WFBZUXp3dWlDbnQyVFdUMmRo?=
 =?utf-8?B?TWRidjhmSXhkeUNmK1prZVB3anY2bmVHU0hDaTY1Z1BaNCszeUNMTlRIQlJt?=
 =?utf-8?B?ZVhSYVY2QU9lQXhidnRSc0pIY1RtYjc2QW84WTNSWkc5UjBGUENXYy9QMUpX?=
 =?utf-8?B?R0ZZSXZscThLVVFXZWVFL2JzSjlFLzAvbXBzYU1RNFV3NEJGZGhTK0ZWWDVy?=
 =?utf-8?B?ZTFJZkF1MGxQRXNrYlNXUDU2VW9WRGJ4ZDFEUVZiamV0ZFdVNmhOcHJmZXpU?=
 =?utf-8?B?aUtIZXZ6cG9nMVliOWlXV1cvbkZuVUI0eERmWWdmUkFteks0eFJ5QjRCZlNP?=
 =?utf-8?B?bVhORWNpemxkZUNha2poQnVFcW9GQkZUSXp0aFJJOGZHY25LMU1RQzFMajZ6?=
 =?utf-8?B?T0VNWk9ITHU1RHBabkFlNFRqTE1DWDBSZk00ZHdqTXdLK0QrUU1rNGVMTGxK?=
 =?utf-8?B?K1lxYnNjQjBmcXhyNkhKQ1VtMnJ3R2JJQXpCR1NlUnJ3d2JoZTJ2YmNSR2U3?=
 =?utf-8?B?U3JkRnV4dnFoZHlVVFh2N1A1cDg3U25zVmIvcmkvVmJwbDhTTUphKy94bTFR?=
 =?utf-8?B?WFNOc3RDR3RLc2NtOWhoZVV0L1prTWNDTEE0ZncwYWdRZU40bWJnVWhFRFFQ?=
 =?utf-8?B?VTg3Qm1tTnd5em44aGxVM1NtMEJGb2FHUzRSQWp3aWpLMno4YlBVU002T3VW?=
 =?utf-8?B?S2JuelNtOFpmZFdETjVlZTNuUkNGRDFkTDFKYjJTWXlIaEdaOEQ1N3JVVEtk?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D526ECAB23F6DD45A2177667A3DC48C1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jJg8i9s7OTrV3BzQihBl+hwSgEfOkPAY3lxlaQj6mexLNG0ay91Fjb+lYubzvRKVy/mLNmK9lhsur1qCxpRWSb+4Bgyj5LQjHGFTjqOE115ebXhuzNXpbVOsPQO8BRgcJSmD17gq6CkuxVMrpxIg1Olz3/TNUiZDOi1U1Ly/TEFz7Gv8gxuzGHzdyOaRTqTR1VWxirHDBAVuA/6zQxERaio1+0/gC0VNm4ZJY/xTqcG/S7lJbpmCQn8AtRp0FctEoSynmKv75K0NT14KshUphlBM6fCFMI/UZVu0jUJ/DLf1NppWx4IQzHmw/CR3ifN210surJQtXXlWFTg+VyKk/FzwPzDKbFKO4a5aulepPC+IrIFeBOFxOyGwTz6oMS+oxE2UbyqVblC4V7fEGiAUkWd1/6+aUIdtIZagZrkh+P0xdveiGQV6Te3iOpw/CJWbldKzW2tqg3YrtCUyIV7t/kbDCsFYO87SM+h9TpVM6wvIm+cgFhfAivwdpFsoUa5HDxFe0BdPnUqbAz0YF9hayE3fQEUJZOTfcB8bSiHCgJMzymRFQ/YgLFJEnZOQbH75k6eoOLQz/tzcN08+Zl8QQg3uT6eR0vNwuvGPdoXBSJ/au0/PUGVkEs8j3DYeax5kgBqANq2lGMrdm/X9rAlUZIwH1l7TuAGumZhuIm6W2cLFcs2gwvvhkn1Afn0BEY5Z91PC1emr6FIVSk920r6RO0fXwD6J1ekrm6OsCAP5AbDRGvc6VHqbGGMW0lIog25G7FOrP5chX/JEhzhhcJPlJOeHokxy6aPM/tkn9xMGTq/Uq6cjGDffrRTOJwuSI+1yL3m8HHfLhiuNFrbXlirB1IFHlrzx4ZU+NviPqBLFnls=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71dbea7-95e0-4e7f-7902-08daff331d31
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 00:20:22.3918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kzm1U1bShm8T57LxEPAjMdNyPGbNQI7Ebz90DLtLS5LSHdQ1N48yg89S4lgpUu7IAtDDPyeVANkGg4PX0TYCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599
X-Proofpoint-GUID: szlQB0s0A-Vjoufx1MQuNotkRpNVETnJ
X-Proofpoint-ORIG-GUID: szlQB0s0A-Vjoufx1MQuNotkRpNVETnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_13,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=563 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301260000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBKYW4gMjQsIDIwMjMsIERhbiBTY2FsbHkgd3JvdGU6DQo+IEhpIFRoaW5oDQo+IA0K
PiANCj4gSSdtIHRyeWluZyB0byB1cGRhdGUgdGhlIERXQzMgZHJpdmVyIHRvIGFsbG93IHRoZSBz
dGF0dXMgcGhhc2Ugb2YgYQ0KPiB0cmFuc2FjdGlvbiB0byBiZSBleHBsaWNpdDsgbWVhbmluZyB0
aGUgZ2FkZ2V0IGRyaXZlciBoYXMgdGhlIGNob2ljZSB0bw0KPiBlaXRoZXIgQWNrIG9yIFN0YWxs
IF9hZnRlcl8gdGhlIGRhdGEgcGhhc2Ugc28gdGhhdCB0aGUgY29udGVudHMgb2YgdGhlIGRhdGEN
Cj4gcGhhc2UgY2FuIGJlIHZhbGlkYXRlZC4gSSB0aG91Z2h0IHRoYXQgSSBzaG91bGQgYmUgYWJs
ZSB0byBhY2hpZXZlIHRoaXMgYnkNCj4gcHJldmVudGluZyBkd2MzX2VwMF94ZmVybm90cmVhZHko
KSBmcm9tIGNhbGxpbmcgZHdjM19lcDBfZG9fY29udHJvbF9zdGF0dXMoKQ0KPiAocmVseWluZyBv
biBhbiAiZXhwbGljaXRfc3RhdHVzIiBmbGFnIGFkZGVkIHRvIHRoZSB1c2JfcmVxdWVzdCB0byBk
ZWNpZGUNCj4gd2hldGhlciBvciBub3QgdG8gZG8gc28pIGFuZCB0aGVuIGNhbGxpbmcgaXQgbWFu
dWFsbHkgbGF0ZXIgb25jZSB0aGUgZGF0YQ0KPiBwaGFzZSB3YXMgdmFsaWRhdGVkIGJ5IHRoZSBn
YWRnZXQgZHJpdmVyIChvciBpbmRlZWQgdXNlcnNwYWNlKS4gQSB2ZXJ5DQo+IGJhcmVib25lcyB2
ZXJzaW9uIG9mIG15IGF0dGVtcHQgdG8gZG8gdGhhdCBsb29rcyBsaWtlIHRoaXM6DQo+IA0KDQpX
ZSBzaG91bGRuJ3QgZG8gdGhpcy4gQXQgdGhlIHByb3RvY29sIGxldmVsLCB0aGVyZSBtdXN0IGJl
IGJldHRlciB3YXlzDQp0byBkbyBoYW5kc2hha2UgdGhhbiByZWx5aW5nIG9uIHByb3RvY29sIFNU
QUxMIF9hZnRlcl8gdGhlIGRhdGEgc3RhZ2UuDQpOb3RlIHRoYXQgbm90IGFsbCBjb250cm9sbGVy
cyBzdXBwb3J0IHRoaXMuDQoNClRoYW5rcywNClRoaW5o
