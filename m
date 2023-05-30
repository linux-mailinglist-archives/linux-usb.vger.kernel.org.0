Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0B071553C
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 08:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjE3GDY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 02:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjE3GDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 02:03:22 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16511B0
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 23:03:20 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34U2t29b015549;
        Mon, 29 May 2023 23:03:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Bs9w6SpxuSfzObh1L1ObHRW+J7X/B3xFQI6gp2LG2wU=;
 b=icZI5AyTZziFKFucyWoC/j61esM+DTLgKuWtLCijT2EByZYvGvSQE3q8FTwXfRyWAxCr
 4JVxxEl034CrLLXaX9sxLWSxflT03+Q2EbQ/WJe2BLDCRlQ/x2EiKabLHV9e95TAFlCV
 hAdzFu5wudczEKwcM+ubsBaF7O/DjBQLqvP0CLbm3AauDy391E7k1I9k9h8bwVyOz4Q+
 UzzDZy6AoNQCiUeGwatbsdFX8MxgcAYN9nso8mdt52UTKlZgqRK/631PYFJAothoSbTy
 nNFstMB9JBlQ3Tuc831KdnFmDdUwDOXeJ0G32o4kszOOEzkZeq94UgUxYpR7QGQoZKoj 5g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qugvkgdd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 May 2023 23:03:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1685426593; bh=Bs9w6SpxuSfzObh1L1ObHRW+J7X/B3xFQI6gp2LG2wU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RNV3jYVhnWbDj5JltdBvdSW2IM9cc0TqhWGQo8lA8sGh6iFSkh4kTu/sSMl635Cgc
         KaUGICx0nQjGH+DA6Efwt1Mca+E1MKt3wruGLOUE4FTon178SKAf3e6kKO1V7MP+zh
         EZFl9o7RXLcNV96ARlCH4UFfgZxsAmdKWOBwFOJRLAZeJhvZnwpnvEGl/Tj71+NPSF
         cu6G+wUwTSxv0ySVMY96WrII4MTebmub4TCWMVWDvHG5Ab3Lz0Gr64FMoKyjU28R0T
         WhDiug9fTmf5EQMvMj5TeuhSwNFa9I/c/bsq/4Y/0lcCaVZuNfOlI68cQ6r/iEaJvK
         QJsXIFXIWCsVQ==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D42E840138;
        Tue, 30 May 2023 06:03:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 41A0DA007B;
        Tue, 30 May 2023 06:03:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fTrCj4Yq;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4AAB040141;
        Tue, 30 May 2023 06:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt3CWDDApkU97INvOZI3SW0ts2zxLuOp5St98/ZrEq9IO7Jo2cYV2WjBz48ji425w9tq86g/inUJ/Qgy/ESXkgMu21JLYI7SgyLDZyJQjaAvbzRVUkIEKt26bZ2fIIdhSzNJBDPy0xr0jiaVZXQY50e70ZydSNtAoh/mGHLMAtIjz5poBCyaIh9GRzeDUex8qvof+eJNOk6vDyjw0eyPlWRcWiSf7hyjI5a/4ExVHNasIcT4lNh2W2pxoKlUkk/ULhqInm6X6RedA6T4Ljgc/u7N1dqgi6oH3snM2w8sOe9fVJLJT2ZNbxigwhzj3kxn0N9aGGdjekJJhM+FsGU6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs9w6SpxuSfzObh1L1ObHRW+J7X/B3xFQI6gp2LG2wU=;
 b=bR9r+RqNnYci2b6aboMiL8s57di5DCKC4CQi60DqWIYbPpEDdDVnQtRgPFvQ975mWdtjz4ze2n7G8s+xwgm8+eoJ2nVoRLK7fgQHD83Y2FEo8gzgJ54V2rlW7k51DXwe54/btNzXVikEVzJ63at2DIpF2QMWpm4ArFU5jQaGkMkzqdrIRzWThvCtU4YcryqFAiAhOMhb4l3oyylNnDaNnDNXtowFCBkzWJqHEtOTYwmbewrV5nPw9QUuIGnrypSKYkdfGjWI82idWA3LylkNAK3T0e76RGgqQANni/5UjpPFwL5TfYiffdfC92cDQ+zfRM5EmRfUL4kNLEfspsonNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs9w6SpxuSfzObh1L1ObHRW+J7X/B3xFQI6gp2LG2wU=;
 b=fTrCj4YqbX5IikoNvlQhCvu4QzCMtjq51SfDsylQggfbVZKzwIo3C6zkKINU4CBCGcT8dTgVuZFeM/lxYnS05Q2wc6EVKW8CXk00ltsvDYHy8cnRMGQ1B3yPG2P1du57ukDUWHO/n3CE+VpDfIvNCINgvse5M/S2gUtFh2lRGWA=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by SA1PR12MB8918.namprd12.prod.outlook.com (2603:10b6:806:386::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 06:03:03 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::75a:68f9:5349:e823]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::75a:68f9:5349:e823%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 06:03:02 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 11/97] usb: dwc2/platform: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 11/97] usb: dwc2/platform: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO2JAENPax7gkudCiLu8dv5Z69yZp4A
Date:   Tue, 30 May 2023 06:03:02 +0000
Message-ID: <d5e2c78b-4c3e-628e-9794-0654c02aaf2c@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-12-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-12-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|SA1PR12MB8918:EE_
x-ms-office365-filtering-correlation-id: b4e4bb6d-d0c0-445f-9e74-08db60d38733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K/Q83P15htTP3boufrRiG2BTJ7l0FyPEWV08zU9oqzIJTNHLRCbS3YnEG06xrrIa74HTG+ICI45p0ztZiotB6SvTDa6rBkJfOshMYVyxZFatdTpyv4fEBAPY4hEjFI7zBdFkrQtBrffHhN8zbOnPNjHxkGFXDZktdOs6JDSZBlm8YQFWoc8wZB52ekxEaAGhexaK8BM3SQDZ+JJRJrQwUm6kEfDaWtMbiR1dnVTMQ0wT2zMHg/5TcTYPOsqYxj1MDA9zFYULDPQmpfKwQMzn8G973FFKBCF14G2i66MqdbmUFsSBM0AogTJcvO5/th6BviH2d0jvrPYfaTLHUXT6fO26Ib7+lz3wS/qWQQmhhqLcPpq/pmfkwtowM84992t9K746figDWzQV7Sz4DsasgBvWwu0qHNNplPDSWwGLOY3Qzrq2jsKNlOT72F9+H5Y/5iHHfkyeOGZ8TjWy0onMwPspNzsHAOIhf4TLkG87u4F2yps8jWBU9oFZirZyIp7TaifD4ceTeJNhDstjvuDmspfP99giLLeenTvP8eWCnLeh3hT3NvLDnTcaf/PSy2a4mq96RQDDTXYYXq72Zemmjut5+s5mdQN1QugY631SmIJ5UN0ixOwE2sidcwoxxq4nXIUPnuvPkfi6jHrpXhLKDaYzC6CaEMYMp0TJpbn90AtYz/8JmOvUGnVEc9V0yEbV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(122000001)(31686004)(38100700002)(41300700001)(316002)(38070700005)(6512007)(31696002)(4326008)(71200400001)(86362001)(2906002)(8936002)(8676002)(6486002)(91956017)(2616005)(66946007)(76116006)(53546011)(66476007)(64756008)(36756003)(66556008)(66446008)(54906003)(110136005)(6506007)(26005)(83380400001)(478600001)(66574015)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azZhc2ZBTVV2ODFWY3VQbDhGOXVDWE8rWDA4L2dCU1dRMFlLMko0RFU0am9n?=
 =?utf-8?B?WGlldUo1THFoanZCdWhRazJGMFVvSE9pY0R0TVBmazJXeUFQZWUwcXdmUU15?=
 =?utf-8?B?UlVZN0k2UzQ4WjFlUjQ4U3o3L3F6aXNCRldJV1BzUWVOM3ZvSWtYaGlib2I3?=
 =?utf-8?B?SUZQTnczakZJUUpGVlNiWjBRRXJqbmV5RngyRXdNZWtQZElaQWUwTVIzL1Bw?=
 =?utf-8?B?OS9XNkpZR1l4d2Z5Sld4TWlZNUp5QTFoRFRqNEdzSlEwdVpHenRNck1VYlJS?=
 =?utf-8?B?WkNwN05tbGFHMFJMNFlOTEhlT3VJZmpXYmVkaU40WDFMcXJINmZkMmx1bmtE?=
 =?utf-8?B?WlVSZUlpUllDSEZmSHJCbi9xOHh6U0NhbjduK3NoaE9XeGdxcnc1U3g5OFZx?=
 =?utf-8?B?WUlaS2dCSnJtUzJ1Y1Z2ZW1PTEp6TStTUUxFMDFpVVhoNmdUdUdEamFCRlZY?=
 =?utf-8?B?SFpYRGUzNzhQOU50Q3VaeHlmMFpUdkpHVXNaSEVRR1BNTjkzbVlDaUhKSGgv?=
 =?utf-8?B?dElYRzEvVG40bk1NR1BveU5nWmhvcTUza2hueE5aekNrN3BQWWw3bzg5T3d1?=
 =?utf-8?B?d2lGek5yQVhnRkM5UmhjZko1ZCtWeTVZNnpGUTFEWXdDTlp1czZiUE1WcG93?=
 =?utf-8?B?a3N6WjNEOHJ1T2JWeGtTL1lLVjRJRkdEeVg0N0JwQnIrL3hJTk5DbEpOK1hw?=
 =?utf-8?B?UjFvOEU5U0RyTis3dEovb2tHZDNLaTBkR3dIMk82Y1N4bHUvTFFxaDl1ZE9y?=
 =?utf-8?B?dTc3V0lWSzAydUd4SnFvYlN0UFdyWSt4RVpYaDBiaEc2ZTBXQ3FsZ3lMYWxa?=
 =?utf-8?B?U1BWRHFxWm5qYU44eWNnNjhnSXRmZjYxV0Rjb1V2UWdFK3hqRlIrRUw1SVBI?=
 =?utf-8?B?ZlkvSmFjSkhjL2VSZDY0Nk5QU0dQTGdxQU5IZkE2VVVqWVZSZVd2QkxDd0JR?=
 =?utf-8?B?ZUJLcTVLeTM5QjVreDRuOHMwTW5CL0JhK3o1Sys3RVkwc2NnU2c2YlJNYWxP?=
 =?utf-8?B?VmdLVEk3M1B4TGN1S1ZiSzlBam5YZEE0UDdteW02enppTXRWZlphQVFwdDl5?=
 =?utf-8?B?emozMWI3TTEvMkUwVTczUzZFK0FaYURzbVBwcGsvWnMwUlZyd0k2WTZxNllw?=
 =?utf-8?B?SXlqSGoxUnp0TjRnWlBrRVJ1Zkd3L2VPOWxsM2pyYnlZcTV0T1V3SmlyZi8x?=
 =?utf-8?B?S1F3VTEwenZUdVlnc3lFbEdpNjIxWTRtU2dhTExYVmZYeHNFOEVmaC9hNnk2?=
 =?utf-8?B?UWNQNHJyWmtZVUFvbGpIVndnelpzSG9kbzJZanVhMjlQbjZxUDVuQktVL2Ur?=
 =?utf-8?B?UVVpSTUrdlFrWnVqQXVJcTNTcDVNeUhLeE5QeVVtaEljZmpBRTZKalgzYTA4?=
 =?utf-8?B?V2xWR2txcXFCYXdkck13UjRTM1p6MncrMjhhYTVUWGJ1ZjlaMHByVDBCZGpm?=
 =?utf-8?B?Qy85OFAwTHpuRWdkcFNlUnJITmt1Y3lxQkh1ZFNzWVFnQ1BPT1drNzJvd3Vj?=
 =?utf-8?B?T1FDQ1VONHZTbnRhWjhmQXpqajNRUUpWNWRRb25IY0VySVhZZ29FU2lwNi9z?=
 =?utf-8?B?WXlBTEszTnZiRkZnNDRpVW0rUkE1YUZZUlp5RXZZVThUbTAxZzJFdW84SENx?=
 =?utf-8?B?RlR4bzJwd2JJS2h4TW9iV0xBYytxclZIUHZjbHdXQXFYV1FSZVBNQjRUMUhG?=
 =?utf-8?B?QXJWd2JQSVh2VG5QTGJvbEY0MnlxTU9ZM01SOG83b3V1YWJxQjlWTFgzZm1R?=
 =?utf-8?B?TDZFOXZHcncxNzB6NWo0T1A4SFA5M0lMWnlXK2dNaGwzSXpMZ3owZEpFekdL?=
 =?utf-8?B?bWJicUJiaUJjUmJmUGZpcjRXRmlDS2hlZFQ4eTdBMG04dVBZcG5HdlptQ3VC?=
 =?utf-8?B?V1hIdGxIYjVUVFhDY2J3b1VCQ3ZHUHd4alY4RXcvKytQVjVuNFVqVEVMblJ4?=
 =?utf-8?B?OXpGeWRWNjdwc0NmUEpzZjRXdjliQlZhUk4raDNjOXZkRjJlVjNYV1JmcU5X?=
 =?utf-8?B?clBCTGlxYVRQYWU2RUlodm03a3lzYmNIQnBMckh1Sk1Yc3gwc3lyWkZ6QTNH?=
 =?utf-8?B?NExJK2l6c2kwckJ0Yy93VjIyWnd2K3kzQno3bzMzUmxDTVlmNmltenJWamgx?=
 =?utf-8?Q?r1C9bMIbOB7Yzr6Q3+2hXBMkq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB46552023EF8A47BD4D80E4F84FBA81@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BweuUM2s6NVSNvZJrKvGDwUFT9Si6ymWWGKoaLjDR/cxGhZzmBj000N06YrLM9nxd16bRrUTwuBP1+l3MX5gyNhdY6NnAot21bk27a97IcQ4UrnrffAdglB2/FJeImKJlBQxRPpq8hY5kOY7ibW+6Yh+lPe8AyS0a0doUPH1zOWSKL5Rc6oYnmJ/Gckb7IO8lqci2+g6C2Uto+YtsuI9M35JZhs9ZFoiVNprRv93VlNlw3foOwVir+2+457yGafvQOu4QHpqCZqGDvtExDRiDyhmg/oDAYTVzRuOW12wwrt8021t8G83Qzh1iyZc1Agb/NZK5Y5mhZsPfBu2dZOmxNMNOAGmHjzpBmouhUpgLYTpwJiBpOxkSnjAS1Lx/QZJXnhC1DM7DSvLPovZaG1UZNssMNL6jjKdwq3o11eqvBgJ9ZRijdp1/DHb8pcwf3TFUtPhlixeRYKw0H3W/231YkaIlFZYey9bS5vnI0buuyVXQ4SX2tSmBGmq21P0Tx1FzgZ9sFP5KfVnmwDpCLU0bb2XGpD+ahIB/o8dbC6scQqwUi2LxTbP4DjUZChl0QTFiCmAM2IYNuChtd6AcAhkiMBioM/PJ4ExkSbOdCG9+CM6ICuaOz3Q3O1ZmCT/PyZCOdMj73davQvDAY8MYsmVDRuJsv5x2Br16BMiFzC24MsIkPSzd+9GTI8Iyamanz0X3NA5myOFosbvg2HVc62IearfVay7BnxiS6BRENmbXJ3nDR979zWfIPun+osV8ezIdkKykWysg+o9Tsr5bsac5WquMVcW8wGy5Wj5fF1oLXqdTeO1KDAR16bbFy1nsL0jBwyC2L15UvMmcuRp6PzRCIDrd2ZkrKGAe2+JUhWhQeRIDiBnHZghyvG5PmJar94oojBZUp3asuCH89CqObk+1Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e4bb6d-d0c0-445f-9e74-08db60d38733
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 06:03:02.5657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LycZCD6B8CmnIE1yJeR1SXZ1BAWUjbRMUQLZDyQ5dqD7mT88rwY7KXsFQ6KsUYdx0C0wER+oW0kAqd2rM46zZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8918
X-Proofpoint-GUID: 59Oby_6Fa6L3snTFAYM4AO94HAKYO0YN
X-Proofpoint-ORIG-GUID: 59Oby_6Fa6L3snTFAYM4AO94HAKYO0YN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_03,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305300049
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNS8xOC8yMyAwMzowMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IFRoZSAucmVtb3Zl
KCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1h
a2VzDQo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0
byBkbyBlcnJvciBoYW5kbGluZyBieQ0KPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZl
ciB0aGUgdmFsdWUgcmV0dXJuZWQgaXMgaWdub3JlZCAoYXBhcnQgZnJvbQ0KPiBlbWl0dGluZyBh
IHdhcm5pbmcpIGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBU
byBpbXByb3ZlDQo+IGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdA0KPiBzdGVwIG9mIHRoaXMgcXVlc3QgYWxs
IGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkNCj4g
cmV0dXJucyB2b2lkLiBFdmVudHVhbGx5IGFmdGVyIGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQs
IC5yZW1vdmVfbmV3KCkgaXMNCj4gcmVuYW1lZCB0byAucmVtb3ZlKCkuDQo+IA0KPiBUcml2aWFs
bHkgY29udmVydCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUg
cmVtb3ZlDQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4NCg0KQWNrZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlh
bkBzeW5vcHN5cy5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3Jt
LmMgfCA2ICsrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5j
IGIvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jDQo+IGluZGV4IDVhZWUyODQwMThjMC4uMzE1
N2RiOWYyMWJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jDQo+IEBAIC0yODgsNyArMjg4LDcgQEAg
c3RhdGljIGludCBkd2MyX2xvd2xldmVsX2h3X2luaXQoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3Rn
KQ0KPiAgICAqIHN0b3BzIGRldmljZSBwcm9jZXNzaW5nLiBBbnkgcmVzb3VyY2VzIHVzZWQgb24g
YmVoYWxmIG9mIHRoaXMgZGV2aWNlIGFyZQ0KPiAgICAqIGZyZWVkLg0KPiAgICAqLw0KPiAtc3Rh
dGljIGludCBkd2MyX2RyaXZlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0K
PiArc3RhdGljIHZvaWQgZHdjMl9kcml2ZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KmRldikNCj4gICB7DQo+ICAgCXN0cnVjdCBkd2MyX2hzb3RnICpoc290ZyA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKGRldik7DQo+ICAgCXN0cnVjdCBkd2MyX2dyZWdzX2JhY2t1cCAqZ3I7DQo+IEBA
IC0zNDEsOCArMzQxLDYgQEAgc3RhdGljIGludCBkd2MyX2RyaXZlcl9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqZGV2KQ0KPiAgIA0KPiAgIAlyZXNldF9jb250cm9sX2Fzc2VydChoc290
Zy0+cmVzZXQpOw0KPiAgIAlyZXNldF9jb250cm9sX2Fzc2VydChoc290Zy0+cmVzZXRfZWNjKTsN
Cj4gLQ0KPiAtCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gICAvKioNCj4gQEAgLTc0Niw3ICs3
NDQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MyX3BsYXRmb3JtX2RyaXZl
ciA9IHsNCj4gICAJCS5wbSA9ICZkd2MyX2Rldl9wbV9vcHMsDQo+ICAgCX0sDQo+ICAgCS5wcm9i
ZSA9IGR3YzJfZHJpdmVyX3Byb2JlLA0KPiAtCS5yZW1vdmUgPSBkd2MyX2RyaXZlcl9yZW1vdmUs
DQo+ICsJLnJlbW92ZV9uZXcgPSBkd2MyX2RyaXZlcl9yZW1vdmUsDQo+ICAgCS5zaHV0ZG93biA9
IGR3YzJfZHJpdmVyX3NodXRkb3duLA0KPiAgIH07DQo+ICAg
