Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03996ED709
	for <lists+linux-usb@lfdr.de>; Mon, 24 Apr 2023 23:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbjDXV4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Apr 2023 17:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjDXV4a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Apr 2023 17:56:30 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A59659D
        for <linux-usb@vger.kernel.org>; Mon, 24 Apr 2023 14:56:28 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OJ6JqV015138;
        Mon, 24 Apr 2023 14:56:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=WCdYNa1gSiCM5Cll8ZTXv5jcNfppY98wtaz8cF7vu64=;
 b=e9yFjK+R+Yf+51qCBXQ9trBaIuyVLEK/jEJTKfI9enqejk5JYQYReSGa4UzD3Z6C3Npn
 ekNUXRO4l5rmzTDkCQ4erAgd+ZE77l2tE8CQ3kCicdyf7dPCCl5J74Nul4UcRdmZHjhN
 B7iue+kpWPRYM64UG/p86fOaqnbwF2hoUVMZ/nAsZxaHVhT8sV0CSJXhMHQl9x2epWIM
 OoBGUEh2AUJSYDVj+XEsOr8xZRQpw9mIGorQJkldXb1sVG79eWtoY0E5BNgZdvT/c4wy
 E0QLkXUQr2jLvXTnoL1XyUZCjzaV/2cNLeEG5Nexv/C2QLJkqQnN7QpnzUqqGA654G/1 8Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3q4yqp6eca-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 14:56:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1682373384; bh=WCdYNa1gSiCM5Cll8ZTXv5jcNfppY98wtaz8cF7vu64=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ju4SpDQ0GVAcyqYvc1+eNLthTIRqCIA/Nifg4E20wy5F3xdBHsaF8yK5lcWtpGP9t
         UM1E9VQDdc5xoxKbd9d7t4p2g3VUhYuFJBIQ2mMEgPwzOyRahVgaAlYlGzjhOZdtkN
         +xg5keFgLZZtdgPERJ6rj7ePskj/OUpU5vKVy9giD3Setls7qkpGebVkPuWCy0tXsf
         HTUQ6bcake98pUcpphyf34Zd1j+cYm8MymhOtb+Y9OkDD3SLO6F2MsDtLRzMznh8vN
         pDc32cvkl+hLdm4CMWKQuAeDQDzq+g4vMrSVL8L5rkcT/AuOP7kSESEpNlQnA9Le2D
         QsfkZJFmeM7RQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2B4D9404D1;
        Mon, 24 Apr 2023 21:56:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (unknown [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B9080A0063;
        Mon, 24 Apr 2023 21:56:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ii29rOJX;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 38FF6404F3;
        Mon, 24 Apr 2023 21:56:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hutRmtlr3IrDvh8p3osKZNd5Fh9XPEThLW5y18gaadVb1qHp0G/ja95w4vmAMQZ6Yl9GftmY0CKygQiVdSf7tBEfA5WAjMkqHZICEaRhN4+EAg9Eu3EGWXCKUFWQ8GLWGKJtxCFsuhqFtgF0H8l0QAJKRSbbUIe32jb9xRuYZeFDWqc33RdOKjjh2usRifHJj9sPkaXVDkF0vPT0OAPfFj5r1kOUZYUVepRM4Myv0pz6qV7L8DqyQOYLtwkfh5kXdMHFvRXd9cEJziqmDEDYLbhEWWM7xHc3SwBi0cmvZpklBdahEEh1L/Ks/1+BWN8/FRv1+vMPIifsjTJxLpC9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCdYNa1gSiCM5Cll8ZTXv5jcNfppY98wtaz8cF7vu64=;
 b=lWWznIdEcMQHeCDGdPmQkqAmM5lmkK+cE/plI8O3wjRWR6yY+VXrdBWTaOXOIM0XwqC80WE8++GBbAqe5qPJyqJ6DCVAn1jsZ5whmy2bStpr3ucV/p6OFg3oKmWjmTV+9wCz7jxatOq1Nd5GKBnv+yUbcfDrsXL5TXkTTekDKIql/oWur2JahEpdfZvl4BI4NTzLU10VE8KtzMlY7hgwuW+KVED9bk1ZPL23fj0swnjD7C38Crk/KlivUIj/uKWhLYP7KGw6T8YL7HfoQHYnALgROrprAekIlJhYo2NwzqdEGQ8B9atQEBtm+vkEWGlvvSP63gdcpOY/7YNuedOBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCdYNa1gSiCM5Cll8ZTXv5jcNfppY98wtaz8cF7vu64=;
 b=Ii29rOJXmMT5XGLgdzDiUqSb6VxeW9B4XSdPJKLd7HelQo00IeCGLECP9rBRV0tlflDrd5vP11WEz7Z01yAmMbNHO+w3c99e5f5NavVW5r2DgvBAKAYvVFqA9qFKQQN3YHxRhPCGvCePmv572HSVyyKlLpaZcXzcAoXSg7YFSu8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB5312.namprd12.prod.outlook.com (2603:10b6:5:39d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 21:56:19 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 21:56:19 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: update link state on each device level
 interrupt
Thread-Topic: [PATCH v3] usb: dwc3: update link state on each device level
 interrupt
Thread-Index: AQHZdA+28pmFb13CXU68IQyyegnyPa87BwsA
Date:   Mon, 24 Apr 2023 21:56:19 +0000
Message-ID: <20230424215612.vcji26wau4f3plse@synopsys.com>
References: <1682053861-21737-1-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1682053861-21737-1-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB5312:EE_
x-ms-office365-filtering-correlation-id: 9dba9b77-10a9-4bb9-3759-08db450ebc48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uyndnhkMCblZC0fpNVKP/APWHkvXmqU/XkmlXwHtMzXWHvaomeWNi3FIpFrwUMyLfO1DLnpshsxxCvaRomkK5lVBLmkQFaTKxG+TUglXwbOCsGgf5JkocJAo2faiAIxzSBCZ5e2OZ5SemAFPmxYN4WQzsSe8ycfbacGBj+5AVUKi32dDQBan4yxrKVSNrisVA3ZMJVzDulw7lMrezXSKPpiOucUVThghYm0qd41QvPepW5Nv0odqjBeyrKnZaJmvhj36eYv1O8+rvV0xiDpV0ttf0rePZ9ZOCDWjlXcRYQ4umg8SuGsxFOrXw9tzKsUtQ0uC/BFN/z25cDzhWM3XNP7Sye71cWOA8Y8IleKNte6eOtBJOmh7+BewqRQXbK+cgaHmu7jYiX0y8b8WE4UqPnMWau6Ogb0J5Talv9281tc741qDZdXZkfqNjbmoU+xqg850c7jvMIOfxflplhvSUvE3YdH9qC+4igN8Q+DIUe13M+xvTkycBNb3KWpfW3M/I2lNoqzHE0yx7M45JumhRhOIXgPmUViUnRd9XFceeLMJY8dRai1s5YoXdNZRJqAcI35z0QIryj104OPCrjjBK5YEQBtSK/oqk2eI2/yTUffTDyWIjCZwThvm0rioFJq86puvb/+R7DbmmrwVAfMU0A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(966005)(38100700002)(122000001)(6506007)(6512007)(26005)(1076003)(2616005)(186003)(8936002)(83380400001)(15650500001)(2906002)(8676002)(5660300002)(36756003)(478600001)(54906003)(6486002)(71200400001)(38070700005)(316002)(4326008)(6916009)(66446008)(66556008)(76116006)(64756008)(41300700001)(66946007)(86362001)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmpLK3V3b3Nod3pnQkZkQVBkRE1MOU1PN3ZRMVNLcEpzUG9jdTI5OFFGWTlR?=
 =?utf-8?B?dmZUY0lOV3VGdVRNaEJwMjJmVGpna0VIUmZaWnRqY3kwRFdPeVhScWM2UXVU?=
 =?utf-8?B?MHdWeGsvU3MxTDAzYnJVVEp3N1lrV3Ixc2NnVGJlV2lsUG8vZy9qbDh5aVdt?=
 =?utf-8?B?dExlc2NqNVB2TWY0aGJvRU80QVBGbmsyZUlOLzBvUENMZXJNaEFXR1RNU1Ny?=
 =?utf-8?B?bENIV3FzVHF6WTNpbTZkdUJDUFUzeU4rS081Q3orb081VllpYXA2WnZiK01L?=
 =?utf-8?B?VXFnaldLcWJkeHB5QWphYUpzZ3RnNUtEU2hkZzZkcW5iR1JEVzNhRUZ1UCtZ?=
 =?utf-8?B?UVVUWHNldmVVMllEcTlrcW50MEtJMmkwNEoyVFBXNGh5NmcyMjBPbDNxVXZk?=
 =?utf-8?B?OWk5WkhQaTZVMDdiekdJYzNvWXpMNHVyRmZDMVpFY3RsT3dMTnNXbHo0dGFK?=
 =?utf-8?B?aktjSTVGb0dVc1Z3cXFRb05Bd1ZFbmpKOGZydTQxZkRZWUJRKzlzQVcrLzhK?=
 =?utf-8?B?M0hVRXdZUFlCcGFHemRPSmJjT0dBZ3lJU2xoM3hEeFp4OEl2SlpmT1pUelpN?=
 =?utf-8?B?YjRLK29nTWtoRXZ2TXZzbitXWHM5QkQyR0p5OHRmZ1BGNythNHZoTzFJVDhn?=
 =?utf-8?B?aUJ4amt2UWNSc3kybTFjM0g5dkl0Sy93Z2I3ay9zdnh4UXdmOVV1eVdiY0cy?=
 =?utf-8?B?RlNyd1lDdnNteWJFcUcvcG9jSkhFY1NOM1lmVzNBTHAxSjN0UmtWTUNabWJL?=
 =?utf-8?B?OGlpUThBYmgwa2FKYi9GVzlEQ0o5Ujg3VzdkRTB6V0IrNWx6VDVmMmtHSmRO?=
 =?utf-8?B?Y3N2M1pIaFVsMVNyRFV6MGpSVCt4VjBpVFBqZnhHNmltWDh4RmpLQUJnU0Er?=
 =?utf-8?B?WDVVcHRkRTduMVI4SEJEOWx5S3ZDZVc4MFRzUHJlSm80ck5BUnY4SDlCZ2h6?=
 =?utf-8?B?a3lMSzFFYmJ2NHJUc3BSQzNXdFp3czJzcmY1OEVIUWpUYWU5NGgzbHJUd2h4?=
 =?utf-8?B?QmlSOHp2eDB2aURSaDRiOURIK0gwaCsvRTVsSTJqSElLWVMzYW9VZjc5T3d1?=
 =?utf-8?B?SzM1d0drVWlZSmNpc2Y4S1dObTJtQXd4N1Erb3VERmtncmprQ3BzVVRxWVdm?=
 =?utf-8?B?QUI2aXlaOVdVdElGQTA0eERPN0wyZTlDb291Z0FLRW5VcVZrUkxkaXgvdTFR?=
 =?utf-8?B?MmJZc09lWU1uSEdINEl4eFBoa3VsN09HblR2clBoZGp2UVVxMFd1bFc2a25w?=
 =?utf-8?B?UElnKzNTU2lUczdYS2hKWlo5WGgwUHp0MktrM0Vnb3M3UFVXTnNrRHZEWExO?=
 =?utf-8?B?d3o2MHZpSXM1OG1Kb1lrdkxJOHVNVXFWVFhnRnRjeDFNcjFwZ2NQcVpCaFkz?=
 =?utf-8?B?TGlBc1poR0JqY2xrMDNuR3JsQmFxdVRzNHE4Yk0yTmhMSjBROTFRYlA4aklG?=
 =?utf-8?B?NThadFFxczVMUW1RWVZTMjhSSzZzdmg5eFlmKy93YWo1RmhjZitMSk9GeUJu?=
 =?utf-8?B?eGQ3cDBXYURKRUNRYXovbHU1c3RHL0k0ZnhjK3BSbUYvb0FDZXNmam1xdFhV?=
 =?utf-8?B?SWhDamdLSzNpZXF5OHMrclJreVhQcU0rdkFGejdzWVVBNy96SlVRTmoyeVZ3?=
 =?utf-8?B?cmQzQjVQWjNXTU5qV1VyUis4aHYrNm95YWl0M2R2SW85VDBSUGI3TEhTYmJa?=
 =?utf-8?B?bGhUbGk2dXVieUpWd3NraytMdVhEQ1dpM3F5OWxTRDREQ0p5VHdpbmtZUXYx?=
 =?utf-8?B?ZnVxSjYwek9IVVhWanJaeWZsR0ppNzJGVFZTYnM0c1Z3Y1JDWHkybkdlWVB4?=
 =?utf-8?B?Y2Z3UkJnTzRaK3BXMXI1K2YrMGkyS0VNZGNLcXpEam1rNEZuT0VBNVA1WEM4?=
 =?utf-8?B?aVRaZXgrNU9nYitDQkFUeDJlUEUrN01IQU5yZm54Y3l4d2xtN05FU1UydmIy?=
 =?utf-8?B?c0lRd0hRdGxOUU1IbmhGejB3UjFpVEdxb3duVHZta1ZsZFNTZW4weld5eVMz?=
 =?utf-8?B?bm9WTGRkRVZLUk9YSWRFcFJXdGJycjVQVEVXSTRJcnJoL1plbS9ka0orVGl3?=
 =?utf-8?B?QVBBZzFOQm9FR2NMUkVENW82ZmY1ZWNOVDhKTXZrSW55ZW1FMks0UXRFVmFZ?=
 =?utf-8?Q?dhULq0Kz1kVJHEt4ryEDhjZE0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A392B8A8497D24CA0957999E658B8B5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Z5qgcTWaKKzz5munIk2uJkpBbjkpRBqi4uNXe9oC+Vx9LCyga2WCN1EcG0WqtsraCstKN5u5OJgC1jALOemR4bcnA49pm9PUYKu5mRriLD2euCXVND8BpgSzPDTyQrs6zuDiAtD+5uwv5wxQfBKYMW8kxlJb7Degdn8fZa8BbTiEBIuKt8r11hNK174BdjA4doFVWVCyeaXy42PA7ObLmI0MgaNBNH4ekwJObeZZ61CyzIGVqsO/b6Sd208cZuKpJ2QvqYqfB7ULwZ9k1pYmCeubpjD8jzHV3E1vgDkpPwBsOlJ3Hrg7vaKUUx0eoTQQIvxkYXHeVVWrH8TfF//qgs65WeWriHiVxq2M5uy2XE78NwwhiM8ziYhVYNuZxGz8UhNYA+GuTrIQRNiuVkOZsRBar5z19vqZG5ioN/BjHxD1h+2y9j1Id2dOjvC8HCBkuB73ovxaYvoMFK+uxIGWtB81ysmummYzFciJnYx1tcHxT7DkMtWtD2CLgkbKdNOyJ1j9KRHsoOMC2BUdfZCDWvQus8zUubhD/sptV0S1qs6owNnk65bMxCw/xDjhCx9M8H6bgyOdyU/fbZu1wyKyzgfGU9rxItKDHQ3wwded1toauODSXL9KqTMMlT/w7PkvkUCmVg4XGqy9CfJprB2qAow35Wi8nAx3Q8a4NrmXFwfQSRuIpLMefjNOqScn2ZUOpte628ij3emBfhGMeV/FOuApWGHsT9MH99ZcY6lDdOhphML5owVzRBHaoUp9aCV73tEqVzGcYZy5gVHF36qdA76/VSrUFsG3wvd/Cz7Dt7hsOV3rdxuycPsBYWu/QGMqn2eZ3dG7C8YP2R1MdQjO1aCr1E9IufbfBVnjKlyio9bFWTnku1pF6i9/7JKBvTKuENszS3etxaRFdDGkqQ+j2w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dba9b77-10a9-4bb9-3759-08db450ebc48
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 21:56:19.3748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ha47x4+4vaPExnXvae/+o7kzT8KbLSU8Lm0q8q+nVYioOAQSE9jqmxkkZMU09YqKORkh9HyvwQsWbEj7dheclg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5312
X-Proofpoint-GUID: wCybPuM127Dtu5Qw5aiJK-ttZabqN-oR
X-Proofpoint-ORIG-GUID: wCybPuM127Dtu5Qw5aiJK-ttZabqN-oR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240198
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBBcHIgMjEsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IFdoZW4gd29yayBpbiBn
YWRnZXQgbW9kZSwgY3VycmVudGx5IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZl
bA0KPiBsaW5rX3N0YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBu
b3QgZW5hYmxlZCBmb3IgbW9zdA0KPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiBzdXNwZW5kIGV2ZW50IHRv
IFVEQyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVu
DQo+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBkdXJp
bmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gc3VzcGVuZCBpbnRlcnJ1cHQgZXZl
bnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gDQo+IEFzIGluIGdhZGdldCBtb2RlLCBk
ZXZpY2UgbGV2ZWwgaW50ZXJydXB0IGV2ZW50IGhhdmUgbGluayBzdGF0ZQ0KPiBpbmZvcm1hdGlv
biwgbGV0J3MgdHJ1c3QgaXQgYW5kIHVwZGF0ZSBzb2Z0d2FyZSBsZXZlbCBsaW5rIHN0YXRlIHRv
IGl0DQo+IHdoZW4gcHJvY2VzcyBlYWNoIGRldmljZSBsZXZlbCBpbnRlcnJ1cHQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiAt
LS0NCj4gdjM6IChyZWZlciB2MiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIwNDI0NzItMjEyMjItMS1naXQtc2VuZC1lbWFp
bC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFaSGFzOUxXWnU4MXJV
NnhrZ01kcENCZWpIa1IwNXVUQlNORnU3eldGRmRnWF9uXy1SQVE3dnV1Q1ZBZEk1SU4xN0loR2hy
aVhJUDJIM3ktRmJoazNWVF9RRS1oUTlRJCApDQo+IG5vIGNvZGUgY2hhbmdlIHNpbmNlIHYyLCBj
aGFuZ2VzIGNvbXBhcmUgdjEgYXMgYmVsb3csDQo+IDEpIGFkZCBhIGZsYWcgc3VzcGVuZF9pcnFf
aGFwcGVuIHRvIHNpbXBsaWZ5IGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KCksDQo+ICAg
IGl0IHdpbGwgYXZvaWQgcmVmZXIgdG8gc29mdHdhcmUgbGV2ZWwgbGlua19zdGF0ZSwgZmluYWxs
eSBsaW5rX3N0YXRlIHdpbGwNCj4gICAgb25seSB1c2VkIGluIGR3YzNfZ2FkZ2V0X2xpbmtzdHNf
Y2hhbmdlX2ludGVycnVwdCgpLg0KPiAyKSByZW1vdmUgc3cgc2V0dGluZyBvZiBsaW5rX3N0YXRl
IGluIGR3YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVwKCkNCj4gMykgYWRkIGR3YzNfZ2FkZ2V0X2ludGVy
cnVwdF9lYXJseSgpIHRvIGNvcnJlY3Qgc2V0dGluZyBvZiBsaW5rX3N0YXRlDQo+ICAgIGFuZCBz
dXNwZW5kX2lycV9oYXBwZW4uDQo+IA0KPiB2MjogdXBkYXRlIGFjY29yZGluZyB2MSBkaXNjdXNz
aW9uDQo+IHYxOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtdXNiLzE2NzUyMjEyODYtMjM4MzMtMS1naXQtc2VuZC1lbWFpbC1xdWljX2xp
bnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFaSGFzOUxXWnU4MXJVNnhrZ01kcENC
ZWpIa1IwNXVUQlNORnU3eldGRmRnWF9uXy1SQVE3dnV1Q1ZBZEk1SU4xN0loR2hyaVhJUDJIM3kt
RmJoazNWVDk1T0cwUm1BJCANCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDEg
Kw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDQwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBkNTY0NTdjLi44NjIyZjlj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMTMzMiw2ICsxMzMyLDcgQEAgc3RydWN0IGR3YzMgew0K
PiAgCXVuc2lnbmVkCQlkaXNfc3BsaXRfcXVpcms6MTsNCj4gIAl1bnNpZ25lZAkJYXN5bmNfY2Fs
bGJhY2tzOjE7DQo+ICAJdW5zaWduZWQJCXdha2V1cF9jb25maWd1cmVkOjE7DQo+ICsJdW5zaWdu
ZWQJCXN1c3BlbmRfaXJxX2hhcHBlbjoxOw0KDQpDYW4gd2UgcmVuYW1lIHRoaXMgdG8gc3VzcGVu
ZGVkLiBBbHNvLCBwbGVhc2UgZG9jdW1lbnQgbmV3IHN0cnVjdA0KbWVtYmVyLg0KDQo+ICANCj4g
IAl1MTYJCQlpbW9kX2ludGVydmFsOw0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA5ZjQ5MmM4
Li4yMzljZmMxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTI0MjIsNyArMjQyMiw2IEBAIHN0
YXRpYyBpbnQgZHdjM19nYWRnZXRfZnVuY193YWtldXAoc3RydWN0IHVzYl9nYWRnZXQgKmcsIGlu
dCBpbnRmX2lkKQ0KPiAgCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJCX0NCj4gIAkJZHdjM19yZXN1
bWVfZ2FkZ2V0KGR3Yyk7DQo+IC0JCWR3Yy0+bGlua19zdGF0ZSA9IERXQzNfTElOS19TVEFURV9V
MDsNCj4gIAl9DQo+ICANCj4gIAlyZXQgPSBkd2MzX3NlbmRfZ2FkZ2V0X2dlbmVyaWNfY29tbWFu
ZChkd2MsIERXQzNfREdDTURfREVWX05PVElGSUNBVElPTiwNCj4gQEAgLTQxNzgsNyArNDE3Nyw3
IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2Nvbm5kb25lX2ludGVycnVwdChzdHJ1Y3QgZHdj
MyAqZHdjKQ0KPiAgCSAqLw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBkd2MzX2dhZGdldF93
YWtldXBfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsIHVuc2lnbmVkIGludCBldnRpbmZvKQ0K
PiArc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfd2FrZXVwX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAq
ZHdjKQ0KPiAgew0KPiAgCS8qDQo+ICAJICogVE9ETyB0YWtlIGNvcmUgb3V0IG9mIGxvdyBwb3dl
ciBtb2RlIHdoZW4gdGhhdCdzDQo+IEBAIC00MTkwLDggKzQxODksNiBAQCBzdGF0aWMgdm9pZCBk
d2MzX2dhZGdldF93YWtldXBfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsIHVuc2lnbmVkIGlu
dCBldnRpbmZvKQ0KPiAgCQlkd2MtPmdhZGdldF9kcml2ZXItPnJlc3VtZShkd2MtPmdhZGdldCk7
DQo+ICAJCXNwaW5fbG9jaygmZHdjLT5sb2NrKTsNCj4gIAl9DQo+IC0NCj4gLQlkd2MtPmxpbmtf
c3RhdGUgPSBldnRpbmZvICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ICB9DQo+ICANCj4gIHN0
YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdChzdHJ1Y3QgZHdj
MyAqZHdjLA0KPiBAQCAtNDI5OCwyMCArNDI5NSwzOSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdl
dF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAlkd2MtPmxp
bmtfc3RhdGUgPSBuZXh0Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAtCQkJCQkgIHVuc2lnbmVkIGlu
dCBldnRpbmZvKQ0KPiArc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQo
c3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4gLQllbnVtIGR3YzNfbGlua19zdGF0ZSBuZXh0ID0g
ZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNLOw0KPiAtDQo+IC0JaWYgKGR3Yy0+bGlua19z
dGF0ZSAhPSBuZXh0ICYmIG5leHQgPT0gRFdDM19MSU5LX1NUQVRFX1UzKQ0KPiArCWlmICghZHdj
LT5zdXNwZW5kX2lycV9oYXBwZW4gJiYgZHdjLT5saW5rX3N0YXRlID09IERXQzNfTElOS19TVEFU
RV9VMykgew0KDQpEbyB3ZSBzdGlsbCBuZWVkIHRvIGNoZWNrIGZvciBkd2MtPmxpbmtfc3RhdGUg
aWYgd2UgdXNlDQpzdXNwZW5kX2lycV9oYXBwZW4gZmxhZz8NCg0KPiArCQlkd2MtPnN1c3BlbmRf
aXJxX2hhcHBlbiA9IHRydWU7DQo+ICAJCWR3YzNfc3VzcGVuZF9nYWRnZXQoZHdjKTsNCj4gKwl9
DQo+ICt9DQo+ICANCj4gLQlkd2MtPmxpbmtfc3RhdGUgPSBuZXh0Ow0KPiArc3RhdGljIGlubGlu
ZSB2b2lkIGR3YzNfZ2FkZ2V0X2ludGVycnVwdF9lYXJseShzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAr
CQkJY29uc3Qgc3RydWN0IGR3YzNfZXZlbnRfZGV2dCAqZXZlbnQpDQo+ICt7DQo+ICsJc3dpdGNo
IChldmVudC0+dHlwZSkgew0KPiArCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfTElOS19TVEFUVVNf
Q0hBTkdFOg0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlkd2MtPmxpbmtfc3RhdGUg
PSBldmVudC0+ZXZlbnRfaW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNLOw0KPiArCQlicmVhazsN
Cj4gKwl9DQo+ICsNCj4gKwlzd2l0Y2ggKGV2ZW50LT50eXBlKSB7DQo+ICsJY2FzZSBEV0MzX0RF
VklDRV9FVkVOVF9TVVNQRU5EOg0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlkd2Mt
PnN1c3BlbmRfaXJxX2hhcHBlbiA9IGZhbHNlOw0KPiArCQlicmVhazsNCj4gKwl9DQoNCldoeSAy
IHN3aXRjaGVzIHRvIHRoZSBzYW1lIGV2ZW50LT50eXBlIGhlcmU/IFRoaXMgbG9naWMgaXMgY29u
ZnVzaW5nLg0KDQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2ludGVycnVw
dChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVudF9kZXZ0ICpl
dmVudCkNCj4gIHsNCj4gKwlkd2MzX2dhZGdldF9pbnRlcnJ1cHRfZWFybHkoZHdjLCBldmVudCk7
DQoNClRoaXMgaXMgbm90IHdoYXQgd2UgZGlzY3Vzc2VkLiBQcmV2aW91c2x5IEkgc3VnZ2VzdGVk
IHRvIGxlYXZlIHRoZQ0KZHdjLT5saW5rX3N0YXRlIGZvciB0aGUgcXVpcmsgKHVzYl9kd2MzIHJl
dmlzaW9uIDwyLjUwYSkgYW5kIG5vdCB1c2UgaXQNCmZvciBvdGhlciBzY2VuYXJpb3MuIFRoZSBk
d2MtPmxpbmtfc3RhdGUgd2FzIHVzZWQgYXMgdGhlIF9wcmV2aW91c18NCmNhcHR1cmVkIHN0YXRl
LCBhbmQgbm90IHRoZSBjdXJyZW50IGNhcHR1cmVkIGxpbmtfc3RhdGUuIE5vdywgeW91DQpjaGFu
Z2VkIGl0IHRvIHRoZSBjdXJyZW50IGxpbmtfc3RhdGUgb2YgYW4gZXZlbnQuIEJlY2F1c2UgdGhp
cyBvbGQgdnMNCm5ldyBsaW5rX3N0YXRlIHdhcyBjb25mdXNpbmcgdGhhdCBJIHN1Z2dlc3RlZCBu
b3QgdG8gdXNlIGl0IGF0IGFsbCBvdXQNCnNpZGUgb2YgdGhlIHF1aXJrIGNvbnRleHQgaXQgd2Fz
IGluLg0KDQpJIGJlbGlldmUgaXQncyBzdWZmaWNpZW50IGlmIHdlIGNhbiBqdXN0IHVzZSBhIHRv
Z2dsZSBmbGFnICh5b3VyDQpzdXNwZW5kX2lycV9oYXBwZW4pIHRvIGhhbmRsZSB5b3VyIGNhc2Uu
DQoNClRoYW5rcywNClRoaW5oDQoNCj4gKw0KPiAgCXN3aXRjaCAoZXZlbnQtPnR5cGUpIHsNCj4g
IAljYXNlIERXQzNfREVWSUNFX0VWRU5UX0RJU0NPTk5FQ1Q6DQo+ICAJCWR3YzNfZ2FkZ2V0X2Rp
c2Nvbm5lY3RfaW50ZXJydXB0KGR3Yyk7DQo+IEBAIC00MzIzLDcgKzQzMzksNyBAQCBzdGF0aWMg
dm9pZCBkd2MzX2dhZGdldF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJZHdjM19n
YWRnZXRfY29ubmRvbmVfaW50ZXJydXB0KGR3Yyk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFdD
M19ERVZJQ0VfRVZFTlRfV0FLRVVQOg0KPiAtCQlkd2MzX2dhZGdldF93YWtldXBfaW50ZXJydXB0
KGR3YywgZXZlbnQtPmV2ZW50X2luZm8pOw0KPiArCQlkd2MzX2dhZGdldF93YWtldXBfaW50ZXJy
dXB0KGR3Yyk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfSElCRVJf
UkVROg0KPiAgCQlkZXZfV0FSTl9PTkNFKGR3Yy0+ZGV2LCB0cnVlLCAidW5leHBlY3RlZCBoaWJl
cm5hdGlvbiBldmVudFxuIik7DQo+IEBAIC00MzM0LDcgKzQzNTAsNyBAQCBzdGF0aWMgdm9pZCBk
d2MzX2dhZGdldF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAljYXNlIERXQzNfREVW
SUNFX0VWRU5UX1NVU1BFTkQ6DQo+ICAJCS8qIEl0IGNoYW5nZWQgdG8gYmUgc3VzcGVuZCBldmVu
dCBmb3IgdmVyc2lvbiAyLjMwYSBhbmQgYWJvdmUgKi8NCj4gIAkJaWYgKCFEV0MzX1ZFUl9JU19Q
UklPUihEV0MzLCAyMzBBKSkNCj4gLQkJCWR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KGR3
YywgZXZlbnQtPmV2ZW50X2luZm8pOw0KPiArCQkJZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1
cHQoZHdjKTsNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEV0MzX0RFVklDRV9FVkVOVF9TT0Y6DQo+
ICAJY2FzZSBEV0MzX0RFVklDRV9FVkVOVF9FUlJBVElDX0VSUk9SOg0KPiAtLSANCj4gMi43LjQN
Cj4g
