Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3D66E7058
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 02:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbjDSANu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 20:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjDSANs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 20:13:48 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC708E
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 17:13:09 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IJxrG6001908;
        Tue, 18 Apr 2023 17:12:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=8L9HUHVPjQhCsopTzF5BWzuHL8J6VEdjN1aaXwi9L54=;
 b=ZirUsFh0vWBNT0lAAMBzMOJABiIPGnEK31mUvqaKJWEYGFy3cr3/4/CgUJqmI+oapX2m
 z+nVC577d3X3Icev0pL06JW6SDH5534KP/vrr/A38KhHwL8vFAn4CI89fpyoE3xa7NpB
 TEvEdHIzVU2m7PNol/1B6nIqJC+mmktmVMEBWbRuvXsKpMY2Fo2nmjUB/sPPsIiWdZ/5
 bmfgcJ0UgTz6CiqQo7grpPeOULkHjxL0O6LHiwDgnVaj1noRIWqPdHJrzqgXkreBMmuG
 ejpF+W1admBb1/vzAgAH3xwroaLfIUQ4ILOWvi8kzQtvBhtUe0xvDFhQ8/+Im5JgstRT Lg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pyu666cc2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Apr 2023 17:12:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681863122; bh=8L9HUHVPjQhCsopTzF5BWzuHL8J6VEdjN1aaXwi9L54=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ArlPqfEPx4bWt3uQ8W+Py7J8jtyHUoaXl405RQ1pwBj2SwDnwlANGtVoXpFuUJXRg
         zS0j13Egf90XdkFICYym8VvNe0xm1JiMLoWWaSIW1vixKVF8sY3kY56mTHeNTt8HSZ
         KbfjkOzx5bjeoPOY9e7Ko4eheQxafxZtAYfTAqf+5kSd8+t2/jWwtgDmI0LgQRyhpN
         Y/9n99hoYsENcTvHfoayOLgO4CzibeO8plH0y1TLJ2gWMYtDxj/6DeZQBJ0FaeV/Gq
         PKSZo9v4WI6LTIAdS1zgPZwkytoNq3ehQ4/cdq4PoNlIfV2qsADm1wbXT2+s3nFzeo
         WP+4lZqQQj/kQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D548B40A89;
        Wed, 19 Apr 2023 00:12:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D3B45A0083;
        Wed, 19 Apr 2023 00:12:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nnw7oU13;
        dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0E05440DC9;
        Wed, 19 Apr 2023 00:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzFait4IZfaZOcQQwgdsOzKrsAzu8dg+bqkfusE1g4az90IOnrMTirGMjgPmnMyWlVg5y3DmSF6lkNK17RgO3X9q7JAoYYrJXQr450U1ffam4PVSc2J55n+0PdgSwd66SGdFfy3gxNtWfA64YbP8TsCIGxprNgZlN7B5QL8ECaEEShuJ0Kg2lwtFGHeM6wb0YY5Am/SlYv1uXMrjkrYkC/crtmEkAultRN3BYFOuDY+BbSn01bnvyzBW+xo/lFe8hAwMQExd4VabeAW3nCOq9BCB4KQl4+MCN8gHKCAd9CdkZplmqZIODBGNo1zmmhN0nKK/4xwL+F9/yk4B++jtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L9HUHVPjQhCsopTzF5BWzuHL8J6VEdjN1aaXwi9L54=;
 b=CRnpf8St9KQbj9jwQkMXJhO/1sTWVKsy1Ou0BGGFVHEuIzYXkp2fDoY5CVhIRCRZqlTlBAvfhQDP4IK8whSCCJ+PUctCae+ODutUF9kv6Eo3+M+/aS8RjKFO3EqXcWI+BL2UZJpzLCM7jwShzJJN/PSZ5RrF+0pKOdwXoWz70o33tgpi4dcNw/RMXEvvYZvp9qAwQWJoZ5kff5IkY1VGlnNdulCfZ4exmeK5v8GmN8aGsI29AQkuggCUpwzygru3PquU5yqb3zn1xeYnn6ym8cY9d88UXBvipKhhiS2gTsS6Op9z71wkkrlG/Y9LIyyj46LzAl8NNhHHDbWl3Mx4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L9HUHVPjQhCsopTzF5BWzuHL8J6VEdjN1aaXwi9L54=;
 b=nnw7oU137TdYxa9xDC9SgpRJWMWoO92T/3BN/z5BSctraA/a5JCTvivJEvrUKiBP4WZEYtk2orOXCJTzzvaCnny6s0WdNUk0FrwweCR9ZbRd35cOi8NWnSZWOGQI6l5wcVp9Fn3cbXHSLdkBGsxjPyyTjY4syTXXbjgbnLE+zDc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 00:11:56 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 00:11:55 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAF/uA
Date:   Wed, 19 Apr 2023 00:11:54 +0000
Message-ID: <20230419001143.pdxflhzyecf4kvee@synopsys.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
In-Reply-To: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA1PR12MB6726:EE_
x-ms-office365-filtering-correlation-id: 7b39d896-454d-4adf-71e4-08db406aaebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5JjvIyMMI1ApFX7nFqpFRh6vFsz7r/3lo6aPyT8wmGyqMOd3MdKxGbWibULr58dKO7oSNAfR4uBnU0ZsVv4j4WILNKzZRc1ebzoWdazsbVaiUhmndnzX5Ls6/m+uG1tVmR3Yt0IR4ZcMhcIRJBK9CteLqUN6M7sAA3fDITpKdmalH2kpPNvk6bIpYTROW+muoLj6HAn+H+Tnpgv6DeSfB/cD0ptQ8ELA1922e9www5zptdny0cZJJWUHv2lPAJ8ow63mtgmJKvImIos0Cg6WOPlXI5vdN5Q7PZ+YmqhKqWFlz8ncepYEUew+WduDc9uOGzE/vnJbv5qc2n6OyD9Pc0txb2fQ9KeoY3r/vPoDVtvCLVjYa+faMSG4MjR0K2U69EbPKpYzDEWntsp6eDrO1WUi7xVEPVAMW6X4oiUmin4aPqKUcPOEBIPXsgZw4x9jzNliSkuoHv8LWvAXA3eWmIh9K5Pf6Ko8JNxXv+729ERl6mAEJK15vF48O1VgJ5sf5T5TVXN6q6Dzfybb1o+J5d9ctRFnknniDYGGqohlNzHCwa64MV9cTBOCIAQOtV0PvVeFylwTj2hnhV88lO7+XFB5dxoRw7Rf5zHNx8MxqNuyvNq2Y/xooBGqm+0XAR0zbwOtcOe8aRatEgj2DnXZUA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(5660300002)(86362001)(2616005)(53546011)(966005)(83380400001)(6512007)(122000001)(186003)(1076003)(26005)(6506007)(38100700002)(8676002)(38070700005)(8936002)(478600001)(54906003)(71200400001)(6486002)(316002)(41300700001)(36756003)(76116006)(66446008)(66556008)(64756008)(4326008)(6916009)(66946007)(66476007)(2906002)(30864003)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0lvaXJBdDU3aCtFMmFYbVRUSjBsNkpRV05mY0VuZ0tkNGZzVzZITC9Ha0cz?=
 =?utf-8?B?cEdzS3NhdlE1S0plUUdQemJGSVRLMWQydWZUTnhlTVM3dHptRmJ2amI4bWpB?=
 =?utf-8?B?NzVBcFB3bGJoTVlFRmcwK01sd2RlOW9lQ2hFNXhIMDgzLzhiQWdPZXZMRUtn?=
 =?utf-8?B?ZHBia0RLN1hqZHZYUE5rdUo1cXlFNWR3VmFpaVI0MmNDNGdUOUlVb1JsZ1A3?=
 =?utf-8?B?dXpTdnJoYVBxaUJoK2JieUM0aW1Bc1N5WWlUNE8rMzVEaWhPakl1QXZGV3hE?=
 =?utf-8?B?dWxIRlNNaU8zQUZuS3pnVHlUajh1Y0ttc3d4MnZ4SmdwdUVwZVFYK25MYVVP?=
 =?utf-8?B?VWNzVVZIQVl2TC9vdmVOTXh5SXprbDRtbjFES1JiUVNjRFBkakphQTdzZ2pV?=
 =?utf-8?B?ZzZqNktER0xubEZNZEIvcTg4dUROQkNOZHZLdFl1dmVhTlk4SHpoNWd0cjhC?=
 =?utf-8?B?RVNKYmJER1RwRVdDSGV0d0tkTTN5bklwN1ZmUkM3eVFHZDFhR2lPT0Y4ZWJu?=
 =?utf-8?B?RzhRUTNMSDhuN0JVbndLZUFkWk4zVVgxbGV3ekRnZDBxYlVUeXlsenAvNi85?=
 =?utf-8?B?bkhoRU1jUmgvanVnOWlkYkh4eXdvbXpWdzNrYzFha2JLTjI3RFM4c21vUERr?=
 =?utf-8?B?WTVUSldseFRPNmVnRFZ2WC90cEsxbTczZUVBaGlyQ0hnNllHR3E2ZGdYNS9J?=
 =?utf-8?B?czVIU1l5SFBEK29TYjdHZVRyUEE0RFVldTZRbGpJdXBEamlWcUI4N2JOUUFj?=
 =?utf-8?B?Kzh4aW56eGFZVzV3RU1YZlR2WXNHbnMrbFhzU0gwYmpwelBOamhHVk9lMHJD?=
 =?utf-8?B?cFdac0dmQ2RSRTZocVJzSlNLMFM3K1VTT0RZR2FvVi9Ec3pEZkN4bDV6Ynk1?=
 =?utf-8?B?MTUxMm1sK1FZQUJNclhMa3B1ZU5YVkxVaUlvN3RYR0d6RWNMKzhVK2pwdmMz?=
 =?utf-8?B?VFowZk1zeDVYVVkzNFlmSSt6RkFnTVc3VUQrU1JQNjFxVmR6WFJEbjdGcnAx?=
 =?utf-8?B?S3FVa2VxK2plOTUrSFF4eFVGdDl0cUppWDlwV2VGbmEzMlBxMmpicHZoVlg5?=
 =?utf-8?B?SVl5U1RZY2piSUtZWENCQndLdUE5WEhidVZNcWFLRDd4UlZkVTZja05jVkRX?=
 =?utf-8?B?MXhiQU1ab3JkNXNpdVhHTTY5NlVuUnFwbGZITUVMcGtJdFBuV0Q5SHFETjBE?=
 =?utf-8?B?TFhoZFNEV3Azem9TRUdQNm9raWVqSHF0Z1d0bGV2eCs3NDh3NWtjaDREak53?=
 =?utf-8?B?UFlmWWpHT2F2VzkvZVhNT0lIZ3RFRXJ1RGEwcitnT09EaHJTMExLUThlZ3ZR?=
 =?utf-8?B?Q1NscFFpLy93UkpvVVJ4QWlncDkrd21lZkJ4ZlRWSklFSUl2Y2VKVENMa1ZC?=
 =?utf-8?B?U0ZLd2s0NGpUSlRzVy9EVVFZY0E1VUZmODRMYTlhVmM1dllOTWhzZlJERkla?=
 =?utf-8?B?RjIrMlZud3hhMENNaDUzZTVIbVFqaEVHSkpOUjl0VEQ1MDZuZmFaZWZtMmdo?=
 =?utf-8?B?MGkydkZOeTFvMmVNeGRiOVNKUkpFak1jWW1NWFFmMnY0c0NjWXpGbWlJWnJp?=
 =?utf-8?B?MFpKQUJLcXF4eUU1YWl3ekhSN2JjK3JiVG5iYkdJZUNQSTJ2TVVZYWswem9j?=
 =?utf-8?B?NWVjb0orMGdaZy91bDJDVHh1ZHh5eTFxYjVaUGkrMW9aVEJ1TWVmeTZqcGFx?=
 =?utf-8?B?SE9sMEppU2R2QUQvUGsvOWo3WEhkNTR3eHVCODVNdlFQaDk4U09qaW5udFhQ?=
 =?utf-8?B?TFdNNzFwLzJlcHRJVHhmWWhWc1o2QkFVSTdBMWVYcER4bnFkc1ViR0g4RjZW?=
 =?utf-8?B?LzhWeUt3REpVZnVHeXJBY0JiTWNUdTg1K0xyZCt3dEZXREREYUN2SGNEbFpO?=
 =?utf-8?B?Tlp1bEVycmgyQnpKbDlwUDA3OGwzQ3UrUzllQjZQVWZraGRLODdzN1VaSDdL?=
 =?utf-8?B?RUpyUnRRNWVPcmFCWlc0bC9HSW1nRFRQa0cvVm5EUWQyY01zdCtBWGQwcm5v?=
 =?utf-8?B?aDg1YzcrZG8rRFdmZnA2YzdYRzNpcTg4aTk0allQak9QSVBITGtCVXU4bjFG?=
 =?utf-8?B?bFpIbnV1L3lzYjltRWJYaEhFcE9hSFRIZklhdnFsOHJ3Y1MwUmtOSUdhdXpN?=
 =?utf-8?B?ZEFkUWVIM3dTL1c2TjBoYklmNENwQm1GTVJOYmFod0RidlEzWmZRR0tlY1Nj?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66A6198BBE1C864D81D6119B62B7CD18@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?NGhzZUc1cHFITVA0WWNJM3hYUW9tdDNSYkg2L0JrVzFMVk5iNGRod2VYZ3U0?=
 =?utf-8?B?ZUIyclVvZ3c4T2gwWDJBMmZ3czJRU1NNc3ZxaUppQ1NUQXJFbWtmdTI0TEw2?=
 =?utf-8?B?NFZVcTBPK2tVUEJ3eHh2bHVCdjNvUGRHSWVzakF4VGdCQU5UaGE0SU1vM3JT?=
 =?utf-8?B?SFZHdzFXQjZiMEp6NmRENHVpOWY0WUdBTmtCMDJpbFh2OXVhNitVUEV2Q2xa?=
 =?utf-8?B?b1h3bWlqT3JmZXYrNzBES0lXSmt3OTNac25DM0xMS3l0Mm5zUU4xZWowZTg4?=
 =?utf-8?B?cEFBZFFUNEFkNTdCSDNQSlhaNk9TRUc0dnVnZ0VleU5WQmg3QVNmSkFVcTls?=
 =?utf-8?B?QTFnMDVIU2hHeUNqcmdubUZpNG1GaWozSyt4dmVyaUE2TERtajhvYThHMkov?=
 =?utf-8?B?RlpCTElueHR3U0xpMnRreFdWeWE2b0JtOTRYb1oyY0dYcEYvMFdtbS9NRC9Z?=
 =?utf-8?B?L3VEWm1kUW1HL2ZvbEh3VjlWa3N4eXFZa05oUElqQmJFK2ZiUWFEbEZka2pX?=
 =?utf-8?B?UzNkQlBudE9kb1hNaU9QVTNXTHZLYkZkWTZEN3lpUjNjNU00dGc1SlE5ZGt5?=
 =?utf-8?B?bzcxbEc2NnZJbFVtamlwa2FyM3h1Nld0NWtRcUlGcXZjYXZSc0RHMUNybklT?=
 =?utf-8?B?SFVRL0t4NUtDM1pVUy9YRzhDSXk4cEpZYXpTdVJnSldRekNucE1UMWpkdE93?=
 =?utf-8?B?aHlQbzNnMDlPL2dLVWhvazFRMXlxM1Ura1RhOWNBTWJqSThaTW9MekI4MDB2?=
 =?utf-8?B?VFhLRHpDeXB4c1BhRzFrS3hZcUtQMUxBcVhaOW1xWjJzYllNTmpVTWgwVWNa?=
 =?utf-8?B?RzlEbDVTL1ByV3VKSkdGeXprUXEwYk80N283VGp2emlHM3VXYTF3YnpaQ3JH?=
 =?utf-8?B?QnRZbkMxTldJU1pOZUJnQzZlU3Q5cWpJaFo0WURkbXNoTDY5Mklqa1B2UTlm?=
 =?utf-8?B?MXBpYTYxN2tBQlhIUnRCRTl5T1VzVXRycHl3UUduSFc1emFXQW1hbHFTNWVG?=
 =?utf-8?B?VHYvcG9RRExtYndTQTQ3NUh1c0ZWTFNDY1JZUHUyVGp3SmE3ZE5RMy9UbWU4?=
 =?utf-8?B?ZG8xTUY3SnkzUnFtc3BJYTRKeW1DWVlHZXJPdjdiTW4yK0QwRE1RbmxHVGZv?=
 =?utf-8?B?bFg3bVo2TkY2ektOcFExMDV1MHAxaWZjeURBeVpuSUs1bVhzRFhMOGllampO?=
 =?utf-8?B?MVhRVkdOdS9uVkFDN3E2QW00M2VaQ2J0SVpIK0o3VE0yV0FMRWlhWXlsK0lB?=
 =?utf-8?Q?Z5/TBP34Bh0+3zn?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b39d896-454d-4adf-71e4-08db406aaebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 00:11:54.5005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9ozSHvgxA4ynPa5k7DFkkdA7jC4u/ub+ZNjLT9+XmnjqhJYiToOXKNbMhHtGhT7V4Wrwd8MyxDF/e/PpWblzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
X-Proofpoint-ORIG-GUID: 96qPyJEtM8Jvq_ezDPn_PDFZ1e_2saW5
X-Proofpoint-GUID: 96qPyJEtM8Jvq_ezDPn_PDFZ1e_2saW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180203
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMTgsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAxOCwgMjAyMyBhdCAxMjo0MOKAr1BNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBNb24sIEFwciAxNywgMjAyMywgQXZpY2hhbCBS
YWtlc2ggd3JvdGU6DQo+ID4gPiBPbiBNb24sIEFwciAxNywgMjAyMyBhdCA3OjQ54oCvUE0gVGhp
bmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4g
PiA+ID4gT24gTW9uLCBBcHIgMTcsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gT24gNC8xNy8yMyAwNjo0OSwgR3JlZyBLSCB3cm90ZToNCj4gPiA+ID4g
PiA+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0IDAyOjAzOjAyUE0gLTA3MDAsIEF2aWNoYWwgUmFr
ZXNoIHdyb3RlOg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+PiBUaGlzIHByb2JsZW0gbWF5IGJl
IGZ1cnRoZXIgZXhhZ2dlcmF0ZWQgYnkgdGhlIERXQzMgY29udHJvbGxlciBkcml2ZXINCj4gPiA+
ID4gPiA+PiAod2hpY2ggaXMgd2hhdCBteSBkZXZpY2UgaGFzKSBub3Qgc2V0dGluZyB0aGUgSU1J
IGZsYWcgd2hlbg0KPiA+ID4gPiA+ID4+IG5vX2ludGVycnVwdCBmbGFnIGlzIHNldA0KPiA+ID4g
PiA+ID4+IChodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2NlZDMzNmM4NDQzNDU3MTM0MGMwNzk5NGUzNjY3YTBlZTI4NGZlZmUuMTY2NjczNTQ1
MS5naXQuVGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbS8pP19fOyEhQTRGMlI5R19wZyFmQjBrclVY
NnFzT1hyQnNPSHpMc3RWRldxVExMOW5jd0dGWHhseEswZWVkTFlfMjlYZHdqWFJ0Yk8tRVd2MWVY
NW9rTjFyT2VCWnNwWjIxS1NiNWIkDQo+ID4gPiA+ID4gPj4gVVZDIEdhZGdldCBEcml2ZXIgc2V0
cyB0aGUgbm9faW50ZXJydXB0IGZsYWcgZm9yIH4zLzQgb2YgaXRzIHF1ZXVlZA0KPiA+ID4gPiA+
ID4+IHVzYl9yZXF1ZXN0LCBzbyBhbiBJU09DIGZhaWx1cmUgbWF5IG5vdCBpbW1lZGlhdGVseSBp
bnRlcnJ1cHQgdGhlIFVWQw0KPiA+ID4gPiA+ID4+IGdhZGdldCBkcml2ZXIsIGxlYXZpbmcgbW9y
ZSB0aW1lIGZvciB0aGUgZnJhbWUgdG8gZmluaXNoIGVuY29kaW5nLg0KPiA+ID4gPiA+ID4+DQo+
ID4gPiA+ID4gPj4gSSBjb3VsZG4ndCBmaW5kIGFueSBjb25jcmV0ZSBlcnJvciBoYW5kbGluZyBy
dWxlcyBpbiB0aGUgVVZDIHNwZWNzLCBzbw0KPiA+ID4gPiA+ID4+IEkgYW0gbm90IHN1cmUgd2hh
dCB0aGUgcHJvcGVyIHNvbHV0aW9uIGhlcmUgaXMuIFRvIHRyeSBvdXQsIEkgY3JlYXRlZA0KPiA+
ID4gPiA+ID4+IGEgcGF0Y2ggKGF0dGFjaGVkIGJlbG93KSB0aGF0IGRlcXVldWVzIGFsbCBxdWV1
ZWQgdXNiX3JlcXVlc3RzIGZyb20NCj4gPiA+ID4gPiA+PiB0aGUgZW5kcG9pbnQgaW4gY2FzZSBv
ZiBhbiBJU09DIGZhaWx1cmUgYW5kIGNsZWFycyB0aGUgdXZjIGJ1ZmZlcg0KPiA+ID4gPiA+ID4+
IHF1ZXVlLiBUaGlzIGVsaW1pbmF0ZWQgdGhlIHBhcnRpYWwgZnJhbWVzIHdpdGggbm8gcGVyY2Vp
dmFibGUgZnJhbWUNCj4gPiA+ID4gPiA+PiBkcm9wcy4NCj4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+
ID4+IFNvIG15IHF1ZXN0aW9ucyBoZXJlIGFyZToNCj4gPiA+ID4gPiA+PiAxLiBJcyB0aGlzIGEg
a25vd24gaXNzdWUsIGFuZCBpZiBzbyBhcmUgdGhlcmUgd29ya2Fyb3VuZHMgZm9yIGl0Pw0KPiA+
ID4gPiA+ID4+IDIuIElmIHRoZSBhbnN3ZXIgdG8gYWJvdmUgaXMgIk5vIiwgZG9lcyB0aGUgZXhw
bGFuYXRpb24gYW5kIG1pdGlnYXRpb24NCj4gPiA+ID4gPiA+PiBzZWVtIHJlYXNvbmFibGU/DQo+
ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBQYXRjaCBmb2xsb3dzIChtb3N0bHkgZm9yIGlsbHVz
dHJhdGlvbiwgSSBjYW4gZm9ybWFsaXplIGl0IGlmDQo+ID4gPiA+ID4gPj4gbmVlZGVkISkuIEl0
IGFkZHMgYSBuZXcgJ3JlcV9pbmZsaWdodCcgbGlzdCB0byB0cmFjayBxdWV1ZWQNCj4gPiA+ID4g
PiA+PiB1c2JfcmVxdWVzdHMgdGhhdCBoYXZlIG5vdCBiZWVuIGdpdmVuIGJhY2sgdG8gdGhlIGdh
ZGdldCBkcml2ZXIgYW5kDQo+ID4gPiA+ID4gPj4gZHJvcHMgYWxsIHRoZSBxdWV1ZWQgcmVxdWVz
dHMgaW4gY2FzZSBvZiBhbiBJU09DIGZhaWx1cmUuIFRoZSBvdGhlcg0KPiA+ID4gPiA+ID4+IGNo
YW5nZXMgYXJlIGZvciB0aGUgZXh0cmEgYm9va2tlZXBpbmcgcmVxdWlyZWQgdG8gaGFuZGxlIGRy
b3BwaW5nIGFsbA0KPiA+ID4gPiA+ID4+IGZyYW1lcy4gSSBoYXZlbid0IGJlZW4gYWJsZSB0byBj
b25maXJtIGl0LCBidXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwNCj4gPiA+ID4gPiA+PiB0aGUgaXNz
dWUgZXhpc3RzIGF0IFRvVCBhcyB3ZWxsLg0KPiA+ID4gPiA+ID4+DQo+ID4gPiA+DQo+ID4gPiA+
IFBlcmhhcHMgdGhpcyBjb252ZXJzYXRpb24gd2l0aCBKZWZmIG1heSBleHBsYWluIHRoZSBpc3N1
ZXMgeW91IG9ic2VydmVkOg0KPiA+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMDIxMTY0MzQ5LmZmdDR5cW54dXp0c3FkZXVA
c3lub3BzeXMuY29tL19fOyEhQTRGMlI5R19wZyFlSzNWeUFxN3ZYNzB2QS1XSkxBNl9iUE1iWkZ4
MG4zM3dIMzlKSXRIendDTlZxS1NrTjJhRzBpekYwR1pQV3FZeGtnTC1mTmluV2xJVzcxSGJHR0Mk
DQo+ID4gPiA+DQo+ID4gPiA+IFRvIHN1bW1hcml6ZWQgdGhlIGxvbmcgY29udmVyc2F0aW9uLCB0
aGUgVVZDIG5lZWRzIHRvIG1haW50YWluIGENCj4gPiA+ID4gY29uc3RhbnQgcXVldWUgb2YgdXNi
IHJlcXVlc3RzLiBFYWNoIHJlcXVlc3QgaXMgc2NoZWR1bGVkIGZvciBhIHNwZWNpZmljDQo+ID4g
PiA+IGludGVydmFsLiBJZiB0aGUgVVZDIGNvdWxkbid0IGtlZXAgdXAgZmVlZGluZyByZXF1ZXN0
cyB0byB0aGUNCj4gPiA+ID4gY29udHJvbGxlciwgdGhlbiB3ZSB3aWxsIGhhdmUgc3RhbGUgcmVx
dWVzdHMgYW5kIG1pc3NlZCBpc29jLg0KPiA+ID4gPg0KPiA+ID4gPiBGcm9tIHRoZSBkaXNjdXNz
aW9uIGFuZCByZXZpZXcsIHRoZSBVVkMgY291bGRuJ3QgcXVldWUgcmVxdWVzdHMgZmFzdA0KPiA+
ID4gPiBlbm91Z2guIFRoZSBwcm9ibGVtIGlzIGV4YWNlcmJhdGVkIHdoZW4geW91IHJlZHVjZSB0
aGUgaW50ZXJydXB0DQo+ID4gPiA+IGZyZXF1ZW5jeSB3aXRoIG5vX2ludGVycnVwdCBzZXR0aW5n
LiBUaGUgZHdjMyBkcml2ZXIgaGFzIHNvbWUgYmFzaWMNCj4gPiA+ID4gbWVjaGFuaXNtIHRvIGRl
dGVjdCBmb3IgdW5kZXJydW4gYnkgY2hlY2tpbmcgaWYgdGhlIHF1ZXVlIGlzIGVtcHR5LCBidXQN
Cj4gPiA+ID4gdGhhdCdzIG5vdCBlbm91Z2ggdG8gd29ya2Fyb3VuZCBpdC4NCj4gPiA+ID4NCj4g
PiA+ID4gWW91ciBzdWdnZXN0aW9uIHRvIGRlcXVldWUgdGhlIHJlcXVlc3Qgd291bGQgbWVhbiB0
aGUgY29udHJvbGxlciBkcml2ZXINCj4gPiA+ID4gd2lsbCByZXNjaGVkdWxlIHRoZSBpc29jIHRy
YW5zZmVyIGFnYWluLCB3aGljaCByZXNjaGVkdWxlIHRoZSBuZXh0DQo+ID4gPiA+IHJlcXVlc3Qg
Zm9yIGEgbmV3IGludGVydmFsIChwb3RlbnRpYWxseSBhdm9pZCBiZWluZyBzdGFsZSkuIFRoYXQn
cyBmaW5lLA0KPiA+ID4gPiBidXQgdGhhdCBtYXkgbm90IGJlIGEgZ3JlYXQgc29sdXRpb24gYmVj
YXVzZSB3ZSdyZSBzdGlsbCBwbGF5aW5nIGNhdGNoDQo+ID4gPiA+IHVwIGFuZCB0aGUgbWlzc2Vk
IGlzb2MgYWxyZWFkeSBoYXBwZW5lZC4NCj4gPiA+ID4NCj4gPiA+ID4gWW91IG1heSB0cnkgdG8g
ZG8gdGhlIGZvbGxvd2luZ3MgdG8gbWl0aWdhdGUgdGhpcyBpc3N1ZToNCj4gPiA+ID4gMSkgTWFr
ZSBzdXJlIFVWQyB0byBvbmx5IHF1ZXVpbmcgcmF0ZSBpcyBjb25zdGFudC4gUGVyaGFwcyBxdWV1
ZSBkdW1teQ0KPiA+ID4gPiAgICByZXF1ZXN0cyBpbiBiZXR3ZWVuIHRpbWUgZ2FwcyBpZiBuZWVk
IGJlPw0KPiA+ID4gPg0KPiA+ID4gVGhpcyBpcyBleHRyZW1lbHkgaGVscGZ1bCwgdGhhbmsgeW91
ISBJIGhhdmUgYSBzb21ld2hhdCBiYXNpYw0KPiA+ID4gcXVlc3Rpb246IEZvciBhbiBpc29jIHJl
cXVlc3QsIGlzIGl0cyAiZnJlc2huZXNzIiBkZXRlcm1pbmVkIGZyb20gdGhlDQo+ID4gPiB0aW1l
IGF0IHdoaWNoIHVzYl9lcF9xdWV1ZSBpcyBjYWxsZWQsIG9yIGZyb20gdGhlIHRpbWUgYXQgd2hp
Y2ggdGhlDQo+ID4gPiBwcmV2aW91cyByZXF1ZXN0IHdhcyB0cmFuc2ZlcnJlZCB0byB0aGUgaG9z
dD8gSWYgdGhlICJmcmVzaG5lc3MiIGlzDQo+ID4gPiBkZXRlcm1pbmVkIGZyb20gdGhlIHRpbWUg
J3VzYl9lcF9yZXF1ZXN0JyB3YXMgY2FsbGVkLCBJIHdvbmRlciBpZiB0aGUNCj4gPiA+ICJ1bmRl
cnJ1biIgaXMgYXJ0aWZpY2lhbCBiZWNhdXNlIFVWQyBHYWRnZXQgZHJpdmVyIHB1bXBzIGFsbCBm
cmVlDQo+ID4gPiB1c2JfcmVxdWVzdHMgYXQgb25jZSwgYW5kIHRoZW4gd2FpdHMgYXJvdW5kIGRv
aW5nIG5vdGhpbmcgd2hpbGUgdGhlDQo+ID4gPiB1c2JfcmVxdWVzdHMgZ2V0IHN0YWxlIGluIHRo
ZSBjb250cm9sbGVyJ3MgcXVldWUuIEluIHRoaXMgY2FzZSwganVzdA0KPiA+ID4gc2xvd2luZyB0
aGUgZW5jb2RlIGxvb3AgdG8gd2FpdCBhIGxpdHRsZSBiZWZvcmUgcXVldWluZyBtb3JlIHJlcXVl
c3RzDQo+ID4gPiBzaG91bGQgZG8gZWZmZWN0aXZlbHkgd2hhdCB5b3Ugc3VnZ2VzdCBhYm92ZT8N
Cj4gPiA+DQo+ID4NCj4gPiBIZXJlJ3MgYSBzaW1wbGlmaWVkIHZlcnNpb24gb2YgaG93IGl0IHdv
cmtzOg0KPiA+IChOb3RlIHRoYXQgSSdsbCBiZSB0YWxraW5nL3VzaW5nIHVzYiByZXF1ZXN0IGFz
IGlmIGl0J3MgVFJCcyBhbmQgYWxzbw0KPiA+IGlnbm9yZSBTRy4gSSB3aWxsIGFsc28gb25seSBm
b2N1cyBhYm91dCB0aGUgY3VycmVudCBoYW5kbGluZyBvZiB0aGUNCj4gPiBnYWRnZXQgZHJpdmVy
IGFuZCBkd2MzIGRyaXZlci4pDQo+IA0KPiBJIGFwcHJlY2lhdGUgeW91IHRha2luZyB0aGUgdGlt
ZSB0byBleHBsYWluIHRoaXMuIFRoaXMgaXMgdmVyeQ0KPiBlbmxpZ2h0ZW5pbmcsIHRoYW5rIHlv
dSENCj4gDQo+ID4NCj4gPiBUaGUgY29udHJvbGxlciB0cmFja3MgdGhlIGN1cnJlbnQgdWZyYW1l
LiBGb3IgaXNvYyBlbmRwb2ludCwgd2hlbiB5b3UNCj4gPiBjYWxsIHVzYl9lcF9xdWV1ZSgpLCB0
aGUgY29udHJvbGxlciBkb2Vzbid0IGNvbnN1bWUgdGhlIHJlcXVlc3QgcmlnaHQNCj4gPiBhd2F5
LiBUaGUgcmVxdWVzdCBpcyBzY2hlZHVsZWQgZm9yIGEgc3BlY2lmaWMgaW50ZXJ2YWwuIEZvciBV
VkMsIGFuDQo+ID4gaW50ZXJ2YWwgaXMgYSBzaW5nbGUgdWZyYW1lICgxMjV1cykuIEFzIHRoZSBj
dXJyZW50IHVmcmFtZSBrZWVwcw0KPiA+IGluY3JlbWVudGluZywgZWFjaCByZXF1ZXN0IG9uIGEg
cXVldWUgaXMgY29uc3VtZWQuIElmIHRoZXJlJ3Mgbm8gcmVxdWVzdA0KPiA+IGF2YWlsYWJsZSBm
b3IgdGhlIGN1cnJlbnQgdWZyYW1lLCB0aGUgbmV4dCBxdWV1ZWQgcmVxdWVzdCBpcyBjb25zaWRl
cmVkDQo+ID4gc3RhbGUgb3IgZXhwaXJlZC4gVGhpcyBjYXNlIGlzIGNvbnNpZGVyZWQgdW5kZXJy
dW4uDQo+ID4NCj4gPiAiZnJlc2huZXNzIiBtZWFucyB0aGUgcmVxdWVzdCBpcyBzY2hlZHVsZWQg
Zm9yIGEgZnV0dXJlIHVmcmFtZS4gInN0YWxlIg0KPiA+IG1lYW5zIHRoZSByZXF1ZXN0IGlzIHF1
ZXVlZCBmb3IgYSBwYXN0IHVmcmFtZS4gSXNvYyBkYXRhIGlzIHRpbWUNCj4gPiBzZW5zaXRpdmUu
IFNvIGlmIHRoZSBkYXRhIGlzbid0IGdvbmUgb3V0IGF0IGEgc3BlY2lmaWMgdGltZSwgdGhlbiBp
dCdzDQo+ID4gZHJvcHBlZC4NCj4gPg0KPiA+IFRoZSBwcm9ibGVtIHdpdGggbWFueSBnYWRnZXQg
ZHJpdmVycyB0aGF0IHVzZSBpc29jIGVuZHBvaW50IGlzIHRoYXQgdGhleQ0KPiA+IG9ubHkgcXVl
dWUgbW9yZSByZXF1ZXN0cyB3aGVuIHRoZXkgZ2V0IG5vdGlmaWVkIHRoYXQgdGhlIHByZXZpb3Vz
IHNldCBvZg0KPiA+IHJlcXVlc3RzIGFyZSBjb21wbGV0ZWQuIFRoaXMgY3JlYXRlcyB0aW1lIGdh
cHMgd2hpY2ggY2FuIHN0YXJ2ZSB0aGUNCj4gPiBjb250cm9sbGVyIG9mIG1vcmUgcmVxdWVzdHMu
DQo+ID4NCj4gPiBXZSBoYXZlIHNvbWUgYmFzaWMgbWVjaGFuaXNtIGluIGR3YzMgdG8gcmVzY2hl
ZHVsZSBuZXcgcmVxdWVzdHMgd2hlbg0KPiA+IHRoZXJlJ3MgbWlzc2VkIGlzb2MgYW5kIHRoZSBx
dWV1ZSBpcyBlbXB0eSBmb3IgVVZDLiBIb3dldmVyIHRoYXQncyBub3QNCj4gPiBlbm91Z2guIFRo
ZSB0aW1lIHRoZSBjb250cm9sbGVyIGNvbnN1bWVzIHRoZSByZXF1ZXN0IGFuZCB0aGUgdGltZSB0
aGUNCj4gPiBkcml2ZXIgaGFuZGxlcyB0aGUgaW50ZXJydXB0IGlzIGRpZmZlcmVudC4gVGhlIGRy
aXZlciBtYXkgbm90IGtub3cgdGhhdA0KPiA+IHF1ZXVlIGlzIGVtcHR5IHVudGlsIGl0J3MgYWxy
ZWFkeSB0b28gbGF0ZS4gVGhlIGdhZGdldCBkcml2ZXIganVzdCBuZWVkcw0KPiA+IHRvIG1ha2Ug
c3VyZSB0byBrZWVwIHRoZSByZXF1ZXN0IHF1ZXVlIHRvIGF0IGxlYXN0IFggYW1vdW50IG9mIHJl
cXVlc3RzLg0KPiA+IE5vdGUgdGhhdCAxMjV1cyBpcyByZWxhdGl2ZWx5IGZhc3QuDQo+IA0KPiBJ
IHNlZSwgYW5kIEkgdGhpbmsgSSB1bmRlcnN0YW5kIEdyZWcncyBwcmV2aW91cyBjb21tZW50IGJl
dHRlciBhcw0KPiB3ZWxsOiBUaGUgVVZDIGRyaXZlciBpc24ndCBmYWxsaW5nIGJlaGluZCBvbiB0
aGUgdmlkZW8gc3RyZWFtLCBpdCBpcw0KPiBmYWxsaW5nIGJlaGluZCB0aGUgdXNiIGNvbnRyb2xs
ZXIncyBtb25vdG9uaWMgaXNvYyBzdHJlYW0uDQo+IA0KPiBGcm9tIHdoYXQgSSBjYW4gc2VlLCB0
aGlzIGxlYXZlcyB1cyBpbiBhbiBpbnRlcmVzdGluZyBwbGFjZTogVVZDDQo+IGFsbG93cyB0aGUg
aG9zdCB0byBjb25maWd1cmUgdGhlIGNhbWVyYSdzIG91dHB1dCByZXNvbHV0aW9uIGFuZCBmcHMs
DQo+IHdoaWNoIGVmZmVjdGl2ZWx5IGNvbnRyb2xzIGhvdyBmYXN0IHRoZSBjYW1lcmEgaXMgZ2Vu
ZXJhdGluZyBkYXRhLg0KPiBUaGlzIGlzIGF0IG9kZHMgd2l0aCB0aGUgVVZDIGdhZGdldCBkcml2
ZXIsIHdoaWNoIGN1cnJlbnRseSBwYWNrcyBlYWNoDQo+IHZpZGVvIGZyYW1lIGludG8gYXMgZmV3
IHVzYl9yZXF1ZXN0cyBhcyBwb3NzaWJsZSAodXNpbmcgdGhlIGZ1bGwNCg0KSG0uLi4gSSB3b3Vs
ZCBzcHJlYWQgdGhlIGRhdGEgdG8gbW9yZSByZXF1ZXN0cyBhbmQgbm90IHB1dCBhbGwgdGhlIGVn
Z3MNCmluIG9uZSBiYXNrZXQuIEl0IHNob3VsZG4ndCBiZSBhbiBpc3N1ZSB3aXRoIGR3YzMgY29u
dHJvbGxlciwgYnV0IHNvbWUNCmhvc3RzIGFyZW4ndCB0aGUgZ3JlYXRlc3Qgd2hlbiBoYW5kbGlu
ZyBpc29jIGF0IGhpZ2ggdHJhbnNmZXIgcmF0ZS4NCg0KPiBhdmFpbGFibGUgc2l6ZSBpbiB1c2Jf
cmVxdWVzdHMpLiBFZmZlY3RpdmVseSwgdGhlIFVWQyBnYWRnZXQgZHJpdmVyDQo+IGF0dGVtcHRz
IHRvIHVzZSB0aGUgImZ1bGwiIGJhbmR3aWR0aCBvZiBpc29jIHRyYW5zZmVycyBldmVuIHdoZW4g
dGhlDQo+IGNhbWVyYSBpc24ndCBnZW5lcmF0aW5nIGRhdGEgZmFzdCBlbm91Z2guIEZvciBleGFt
cGxlLCBpbiBteQ0KPiBvYnNlcnZhdGlvbnM6IDEgdmlkZW8gZnJhbWUgaXMgfjIya0IuIEF0IDMw
ZnBzLCB0aGlzIHJlcHJlc2VudHMgMS8zMA0KPiBvZiB0aGUgYW1vdW50IG9mIGRhdGEgdGhlIGNh
bWVyYSB3b3VsZCBnZW5lcmF0ZSBpbiBhIHNlY29uZC4gVGhpcyAyMmtCDQo+IGlzIHNwbGl0IGlu
dG8gOCB1c2JfcmVxdWVzdHMgd2hpY2ggaXMgYWJvdXQgMS8xMDAwIHRoZSBudW1iZXIgb2YNCj4g
cmVxdWVzdHMgVVZDIGRyaXZlciBuZWVkcyB0byBnZW5lcmF0ZSBwZXIgc2Vjb25kIHRvIHByZXZl
bnQgaXNvYw0KPiBmYWlsdXJlcyAoYXNzdW1pbmcgMTI1dXMgbW9ub3RvbmljIHVmcmFtZXMpLiBB
c3N1bWluZyBzb21lIGZ1ZGdlDQo+IGZhY3RvciBmcm9tIHRoZSBzaW1wbGlmaWNhdGlvbnMgaW4g
eW91ciBleHBsYW5hdGlvbiBnaXZlcyB0aGUgdXZjDQo+IGRyaXZlciBzb21lIGV4dHJhIGxlZXdh
eSB3aXRoIHJlcXVlc3QgcXVldWluZywgd2UncmUgc3RpbGwgcm91Z2hseSB0d28NCj4gb3JkZXIg
b2YgbWFnbml0dWRlcyBvdXQgb2Ygc3luYy4gRXZlbiB3aXRoIHBlcmZlY3QgJ2NvbXBsZXRlJw0K
PiBjYWxsYmFja3MgYW5kIHZpZGVvIGZyYW1lIGVuY29kaW5ncywgYW4gdW5kZXJydW4gc2VlbXMg
aW5ldml0YWJsZS4NCj4gRGF0YSBpcyBiZWluZyBnZW5lcmF0ZWQgYXQgYSBmYXIgc2xvd2VyIHJh
dGUgdGhhbiBpdCBpcyBiZWluZw0KPiB0cmFuc2ZlcnJlZC4gRG9lcyB0aGlzIHJlYXNvbmluZyBz
ZWVtIHZhbGlkPw0KPiANCj4gSnVzdCBhcyBhIHRlc3QgSSdsbCB0cnkgdXBkYXRpbmcgdGhlIFVW
QyBkcml2ZXIgdG8gY29uc3VtZSAyNjYNCj4gdXNiX3JlcXVlc3RzIHBlciB2aWRlbyBmcmFtZSAo
fjEvMzAgb2YgODAwMCksIHdoaWNoIHNob3VsZCBiZSBlbm91Z2gNCj4gdG8ga2VlcCB0aGUgdXNi
IGNvbnRyb2xsZXIgcXVldWUgb2NjdXBpZWQgZm9yIH4xLzMwcy4gSWRlYWxseSwgYnkgdGhlDQo+
IHRpbWUgdGhlIGNvbnRyb2xsZXIgcXVldWUgaXMgZW1wdHksIHRoZSBjYW1lcmEgd291bGQgaGF2
ZSBwcm9kdWNlZCBhDQoNCllvdSBtZWFuIHF1ZXVlIDI2NiByZXF1ZXN0cyBhdCBvbmNlPyBUaGlz
IG1heSB3b3JrLiBUaGVyZSBzaG91bGQgYmUgYQ0KbGFyZ2UgZW5vdWdoIHRpbWUgZ2FwIHNvIHRo
YXQgdGhlIGR3YzMgZHJpdmVyIGNhbiBwcm9wZXJseSBkZXRlY3QgYW4NCmVtcHR5IHF1ZXVlIHRv
IGJlIGFibGUgdG8gcmVzY2hlZHVsZSBuZXcgcmVxdWVzdHMgZm9yIHRoZSBuZXh0IHZpZGVvDQpm
cmFtZS4NCg0KPiBuZXcgZnJhbWUuIFRoaXMgZG9lc24ndCBzb2x2ZSB0aGUgaXNzdWUgd2l0aCBs
YXRlbmNpZXMgYXJvdW5kIGNhbGxiYWNrDQo+IGFuZCBhbiBpc29jIGZhaWx1cmUgbWlnaHQgc3Rp
bGwgaGFwcGVuLCBob3BlZnVsbHkgdGhlIGZhaWx1cmUNCj4gZnJlcXVlbmN5IGlzIHJlZHVjZWQg
YmVjYXVzZSBVVkMgcXVldWVzIGVub3VnaCByZXF1ZXN0cyBwZXIgdmlkZW8NCj4gZnJhbWUgdG8g
bm90IHN0YXJ2ZSB0aGUgY29udHJvbGxlcidzIHF1ZXVlIHdoaWxlIHdhaXRpbmcgb24gYSBuZXcN
Cj4gZnJhbWUgYW5kIHRoZSBvbmx5IHdheSB0aGV5IGdvIG91dCBvZiBzeW5jIGlzIGZyb20gJ2Nv
bXBsZXRlJyBjYWxsYmFjaw0KPiB0aW1pbmdzLiBJIGFtIGFzc3VtaW5nIHRoaXMgaGFzIGJlZW4g
dHJpZWQgYmVmb3JlLCBidXQgbXkgTEtNTCBzZWFyY2gNCj4gc2tpbGxzIGFyZSBmYWlsaW5nIGFu
ZCBJIGNhbid0IGZpbmQgbXVjaCBvbiBpdC4NCj4gDQo+ID4NCj4gPiBOb3RlIHRoYXQgdGhpcyB0
YWxraW5nIHBvaW50IGlzIGFzc3VtaW5nIHRoYXQgdGhlIFVWQyBob3N0IGJlaGF2aW5nDQo+ID4g
cHJvcGVybHkgYW5kIHBvbGwgZm9yIGRhdGEgZXZlcnkgdWZyYW1lLiBJZiBub3QsIGl0J3MgYSBk
aWZmZXJlbnQgaXNzdWUuDQo+ID4NCj4gPiA+ID4gMikgRW5oYW5jZSBkd2MzIHRvIGRldGVjdCB1
bmRlcnJ1biBmcm9tIFVWQyBvbiByZXF1ZXN0IHF1ZXVlLiBpZS4gSWYgdGhlDQo+ID4gPiA+ICAg
IHF1ZXVlIGlzIGVtcHR5IGFuZCBhIG5ldyByZXF1ZXN0IGlzIHF1ZXVlLCByZXNjaGVkdWxlIHRo
ZSBpc29jIHRyYW5zZmVyLg0KPiA+ID4gPiAgICBUaGlzIHdpbGwgYnJlYWsgc29tZSBvdGhlciBk
ZXZpY2VzIGlmIHRpbWUgZ3VhcmFudGVlIGlzIHJlcXVpcmVkLiBTbw0KPiA+ID4gPiAgICBwZXJo
YXBzIGFuIGFkZGl0aW9uYWwgZmxhZyBpcyBuZWVkZWQgZm9yIHRoaXMgY2hhbmdlIG9mIGJlaGF2
aW9yLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEkgYW0gbm90IGFzIGZhbWlsaWFyIHdpdGggdGhl
IERXQzMsIGJ1dCBqdXN0IHRvIGNsYXJpZnk6IElzIHlvdXINCj4gPiA+IHN1Z2dlc3Rpb24gdG8g
cmVzY2hlZHVsZSB0aGUgc3RhbGUgcmVxdWVzdHMgaWYgdGhlIGNvbnRyb2xsZXIncyBzZW5kDQo+
ID4gPiBxdWV1ZSBpcyBlbXB0eSAodW5kZXJydW4pIGFuZCB0aGUgVVZDIGdhZGdldCBkcml2ZXIg
cXVldWVzIGEgbmV3DQo+ID4gPiByZXF1ZXN0PyBEZXBlbmRpbmcgb24gaG93IG1hbnkgc3RhbGUg
cmVxdWVzdHMgdGhlcmUgYXJlLCB3b3VsZCB0aGF0DQo+ID4gPiBydW4gdGhlIHJpc2sgb2YgdGlt
aW5nIG91dCB0aGUgbmV3IHJlcXVlc3QgYXMgd2VsbD8NCj4gPiA+DQo+ID4NCj4gPiBObywgcmVz
Y2hlZHVsaW5nIGhlcmUgbWVhbnMgYWxsIHRoZSBxdWV1ZWQgcmVxdWVzdHMgd2lsbCBiZSBzY2hl
ZHVsZWQNCj4gPiBmb3IgYSBuZXcgZnV0dXJlIHVmcmFtZS4gQnV0IGFsc28gbm90ZSB0aGF0IHRo
ZSBxdWV1ZSBlbXB0eSBjaGVjayBpcw0KPiA+IGluc3VmZmljaWVudCBhcyBleHBsYWluZWQgYWJv
dmUuIFNvIHRoaXMgd291bGQgb25seSBtaXRpZ2F0ZSB0aGUgaXNzdWUuDQo+ID4NCj4gDQo+IFRo
aXMgbWFrZXMgYSBsb3QgbW9yZSBzZW5zZSBhZnRlciB5b3VyIGV4cGxhbmF0aW9uLCB0aGFuayB5
b3UhDQo+IA0KDQpucC4NCg0KQlIsDQpUaGluaA==
