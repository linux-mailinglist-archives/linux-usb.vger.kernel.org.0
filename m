Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7386E9D07
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 22:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjDTUWa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 16:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjDTUW1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 16:22:27 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68687270E
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 13:22:25 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KFwXgu022869;
        Thu, 20 Apr 2023 13:22:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=7DkfsyjjjGi2Bu2VtJJjmmQ/mXlwrrYMjfrwDZq2Etw=;
 b=UAjURyfVI2hWBGN/Qjql4skYhG5gXSdZt67jz7MXFT5/maoj8oTlDQxMr45bP40gw1KK
 6mJJJ2V2d4ldJoCE7wsTS1zKSC2dgScAj9PFOMTNuDSCDfnzuVQbAWRqX3km3LnYVdY/
 RvIAcTMrkEKsJrUCuDQ4zXXnTy9krzbJZFQA/PlY7ud/JpZKYzQqTEaDXREqUjwYa4lD
 46Kyu1+tPgXuDsYJKBnbMlMQe8rYyfERRtmJGeThGfSiLox8wfIiLfHQsv/iUf6RxACs
 4GZR4XlCpsA8xQeyw1vU83U9rgHG3Nidv0JZIG0xeOrl67VONzebFlWlLQYoifD93csG eQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3pytjfk034-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Apr 2023 13:22:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1682022137; bh=7DkfsyjjjGi2Bu2VtJJjmmQ/mXlwrrYMjfrwDZq2Etw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H/gTAC40l8VMmL6/RaOBjIaiHFRO5Z+eAYmTFcGXW2JoSu7VPxZ54gDMKkENmSDmY
         5csp0E5AoQlbiTXdqebUGvjdGLY3yZMBcZKUCYRyiMZfT+OLfO0LQH73/f1DKKzIas
         yTXiHRHccxPHwBgfVXX1Or9IEv/tBpfMbIeADaNiwfHcvzyZZH73MedSWoFVI4aYss
         k3+bGXd9XuXLCLpwcViJ49KceE4Wb1s5GgkVkyWcp7FHvMgKYJAnhsFX/ooSYKvHCi
         JxQF+aP6zcH25w5zya7znb+w8zzW6biCVVYj6fdGc2gdy1GkQSsm2cdJO4SJFCT/nh
         SgrxFn76QNGJw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F35A040750;
        Thu, 20 Apr 2023 20:22:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (unknown [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 84EDEA0068;
        Thu, 20 Apr 2023 20:22:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pUZ53rN7;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B93DB40617;
        Thu, 20 Apr 2023 20:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCXet70b6EimOxc+P+0dFDzc24o65+uEBswKmhUp3bbpQ7FRTHPr69JTmlYKnbC3+Z7aMpPrUQBzTfbEB0DICqfweDrHryO3rXQKBI+xewOsngAg4dZj3Z9rezYmRiUfdfpNZy9ABpzaELtivTghN1DvZtxX7N6eIR4Yz6N62Y45YidDdRDIaN7ZdIz+6EFVhXuG00+iYJDEKkdIBKlP9nJQNexCYJt0CHIV1KfYGXsNdAUMJvoArcxkMAt4oUmhzdVMlciIO5qi6c0qnYBHE5iYckS+AlaM1Uf7vrUQWMlXXAoRzT3PofZEremlq1ccngwPhLxgTFgduuaK0ivYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DkfsyjjjGi2Bu2VtJJjmmQ/mXlwrrYMjfrwDZq2Etw=;
 b=ZTjNmLGj9v5Zzx60kOjAZo6EaEf9oDeIBYdFZg7fE2v09wfW3gqITdx/xJXy8hGw660EPUk8MoVZmGIdDQklaY5TAmbm0sTzh7bm/yPc8Y0DO5hNQbCnTHujtCSpBkzopKf4SHJhWsAYVgnRXkdv43cZpLo0vcnMexT9dICXuPNpuEShtQZdAXYnHbqVpQBk5F+iO0osig6BrACpcOU9nOu7f766PwQkgATUTkYrrmcX4XULTUaOW+HLp+l60dMiQsFvSOasP6ADAboKSEAzCC0qVkI7JIU69l8ZjbPZOhUd6U7Ezox2hdtyw+n/vsFOcA2DoQUsDj19SsVsc9XRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DkfsyjjjGi2Bu2VtJJjmmQ/mXlwrrYMjfrwDZq2Etw=;
 b=pUZ53rN7Sea6xLc6LhiFmKVrenw2egc18N/ypM4JYfHV36+h2CeQ5nfV3lw+A3CeKapT3XUQOHFJMHfhHHyNGW0jze2wBXYHprKxuNnEDlXHcbJubbeH9NN5jBVOHmLSBEGyn1F0JEim120F2Mj2fGsKs7CaWfLWBtfErSy7q9A=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Thu, 20 Apr
 2023 20:22:12 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 20:22:12 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Avichal Rakesh <arakesh@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAARK9gIAAOv8AgAATwoCAAMkrAIAAYfwA
Date:   Thu, 20 Apr 2023 20:22:11 +0000
Message-ID: <20230420202206.2n2szlpkrxlagheq@synopsys.com>
References: <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
 <857134d6-1537-4879-9c1e-b7067d0fdeb3@rowland.harvard.edu>
 <20230420023123.hkde4t2ayrrri2lb@synopsys.com>
 <8c0da0fc-ac5d-42f4-9071-14fb78539f65@rowland.harvard.edu>
In-Reply-To: <8c0da0fc-ac5d-42f4-9071-14fb78539f65@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN2PR12MB4438:EE_
x-ms-office365-filtering-correlation-id: 66b0ecc7-7b5f-43d1-7cc5-08db41dcec93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eGxpknjsUBVW14YXt5TLEOr61Bfk6djIWgGb/KtPWH9aM+lVrrU+O3sCDHa4kM9Dv92RYRm05hCuohe8Vev6lHgyvQKdDn15jqcTSvZo3j0vW5Uy/1QRs3LYrkeU3cuQslRriZBNcGvKvzwrcxAXMifS2/cd+dRoMHUJjkq8RVhAx19XyEttNUZ+BIlhY13kPfnRYSx3ej/wsXcp3dJGYUV8KCBJ3FBk4dNEDHrn+MYh2StOYEjQ9nVa+UiE273AnvzogbMop60Hn3Mwfr5nJj7xwAf88vtDrl/OsTlsCHv1eUloppqkehonW8XThvdycYVimtEPiwj9gUmS5tYkDtXZ9K3CflvImt/KXdJOPi9OQ5iPww4/TcldSlS/NfN3Ravkncfek5fBLABOd83tTvHV8PRYY9a4cBEqZ0QkHL0IyjVLndt1fttx222AvH5r24u45PLveGdsMZAZLUyL8D6AugNspZ8FHegcUQ6P4mu/6Q0V/vYpWmoVyJOa9AK2lGPQ07MKp8GchTga7fKNqotCQ8wz735FIRMMZ3/1um8gqw8PQMpw2mSNUbhS9UE8vockCQshjDKwi6nMHMpydlg973uFswun+tnQYcl91vAL4YTClNcmFffhxA/GMkaH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(36756003)(186003)(6916009)(4326008)(54906003)(316002)(66556008)(64756008)(66476007)(66446008)(66946007)(76116006)(6486002)(478600001)(71200400001)(8936002)(8676002)(5660300002)(41300700001)(86362001)(38070700005)(2906002)(122000001)(38100700002)(2616005)(26005)(6512007)(1076003)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2t0QkV0aFdTclh2OU1JeWw4aXJKT2kvNlJwMUo0c2txTmp4NWtTOEdFWVZp?=
 =?utf-8?B?NVY3TWtoTHpjZ3Y2d014ZW11SkluS09Pai84S2JoMXI5ejJCZyt3NVhvQ2d3?=
 =?utf-8?B?WlNTS214U3REeTVEeVZvS2xpY3VlZzZoaHpLQ2hRQzQrcWlJSjB0b0llS0Nw?=
 =?utf-8?B?TTBjZTZXbFhEZENLUXgyd0J0aERMcTNUL1p1QndFTW8yY09IeE5jYjZ4Ky84?=
 =?utf-8?B?cjhpOExOcURQM0xnWGpwYmsydzlPeHN6ZndneVN1eEZDZFA5a0xnU2hsc0dh?=
 =?utf-8?B?dzNKVUhWY1NnNk5CaDBYbm1sekJDN0JycnJTN2lSRWhqUENSSjZPb0RtQ1Ex?=
 =?utf-8?B?R2hqaU1pbDk1djljb3Z1OStFNXFVZmErNHdkS3NacHJzUXhjQzZYYzJCc3k5?=
 =?utf-8?B?SzVvYkJ1NVd4cFZKV2tSUG53WWd2SGl3U2Y1MU9mTmRPZWFaL3A0ai9xUVJl?=
 =?utf-8?B?TW9pdy9Ga1VnRSs4QWcxY2JDbWlrSVI3elZpM2w2Ly9jdFdtWWtkYWk1UXYy?=
 =?utf-8?B?OWVoYlIrTG1sK0tVOTZBazVHK3Y5ODZzSy9EWG15SWhBMHZqT04xSFM0ZmEz?=
 =?utf-8?B?Y1JDY0N6OFZjOVMzWSttMU5lcEhCTGQ5S0QwcXZyUTFaSFQvMTMyRkZUSDR3?=
 =?utf-8?B?eGlyMEpEWmV0d1FnVVFRd1haZGl6UlF6U3F3MUREcFlPNFk4b1JkeEpnS25J?=
 =?utf-8?B?RHZ3ZnhTMUJZeVFsc3ZVMW5XelN4eVNubEJ3Ly9jcEt2WUxyV0kvY3NPZm40?=
 =?utf-8?B?TzExWlI2U3Mzajh3Znl2TW52SzdXSWZvNUo2UGJUc1ZOWG95dW1XRitseDRk?=
 =?utf-8?B?c0VrN2J4OFdBdXAzS0cwY053QStON1MrWStlcUtuNnE1UGJxOGFQVE9GeWpM?=
 =?utf-8?B?Y3NVdEl5Zk1heVhSWjlWNWg0dnNrSGtmMnhseTIydzZMK3dPM2kzTFRCMUxq?=
 =?utf-8?B?OUdIeWk2cHVQeEcyd0FzaVczS1U3dlZpcnJuM2lDZVphOTI1YW1Xd3RmWFJ0?=
 =?utf-8?B?c2UydDQzdEtsTU9mR0pWY0Z3ZmZIU0M4bXZWdUdDQmFNMVEvRkZoOW05R1ZM?=
 =?utf-8?B?WW9IYVcxbGU2d1BWUG9RREZwcVQyakZ3Uk9lTWxoSTlrL0xSbVFoaGdwcVpC?=
 =?utf-8?B?TzE0MzVNUWVKQzUxajBUem1JYlorV2JXQ1BRK1dpUHJTZXRIVFdmZStaWDBa?=
 =?utf-8?B?VjVXMXptYlZjWEpvZFhNSVVqNEVuMXdSWDh5RFNuaUJ4RFRJaktXaUh1aXhl?=
 =?utf-8?B?WlZuZitxTkR5MU9oZzlVeitHU05wV0dKQkFvOGRZaS9kc2xVQnJCT3YrUWdm?=
 =?utf-8?B?VE9MMlFuMHo3alM4UlgvbDFIUzhuODliaWhWNnFNRWZ4SkE0MGxrNmhNVE9Q?=
 =?utf-8?B?VEtEVVU0MmRUNmhIb21ucEsyUEpWVVo1a3A2K1d3SDFVZ01LeFp0RUdZeDhK?=
 =?utf-8?B?cGRuWGVMQXd3VXR5ZEIxZCtQK1EveUZkWWsySHFHd3BhRCttS0trSzl1QWVR?=
 =?utf-8?B?ZFQ1Nldmck1xbW4zemNtRXhDdnhxZnZzK3I4OHpiQmZnd0VtV0V4MTdYUmN0?=
 =?utf-8?B?VThzdUlGMnlJM05oVGxRSWpzVmFhUW0wdlpIdFR0c1IyL1pnZ3kxMjFVRWFG?=
 =?utf-8?B?WVBxV3gyT0dQSmIrTnZxWUhnL1BxZ1paaDlGQzM0QTVFUVptanM0SE5ucGEw?=
 =?utf-8?B?WnRaUkFxaHJFTGNFbUV0ZlFneWVlY1lPSnJhWUI4SXhnaWJPSzNIR3lrRFVz?=
 =?utf-8?B?RVptRkJZQmRyV0ZMM2hkTFd1NnJxbkE5UEpKNFBSc1B1Q3huVWltWVFPRnYx?=
 =?utf-8?B?cmprWmg5aGI3UndSalRNT0VlK0I2c2NrZGhHS0hOWnozekZQcmxmeUZiTktD?=
 =?utf-8?B?UUxXdTliOWRUZ0pud055NTVIaURiUk4rUHZWcWM4TlJVREJTbWNUQW5XZlJQ?=
 =?utf-8?B?SkN5dXpBcUhDME1qRm0rUFg0K3B3M2xuNkkzWjdzZ09IdVhnK0dYVDl4WHdM?=
 =?utf-8?B?TElrb1ZFazJBbHRXdlhZem8vbDk4MUJoWmZnelZSNUREUTdlMUtCa1VpVGdm?=
 =?utf-8?B?MWxUOWUyK3g3bGQ3M1MyOEZhVXJyck5nbHB3WWEvUGZaNXVTdUN4M2JYSmJU?=
 =?utf-8?Q?+czDO26yos7Zpj1kBcf5Ve//Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74D2A2CE566F484C9CD9A9CE27BCAB80@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?clJPWWlPa0oyRGE5WmNkWGZKYjFFRjVNQVFRMTVGbEtYQWZsR202ZHQyRU5L?=
 =?utf-8?B?SXBIMjVzYW9CdzM2MUJ0dDEzN3hHUWZ3L1Q0aUhnekRVOG44WlJna0lNM2Rv?=
 =?utf-8?B?YndNQy9ZUzYwam9EY3lxOThMTXNnTVRNVWFKYzFmV0RxeFVUbUFyYUlIRmZK?=
 =?utf-8?B?ZkcxWFhLdlpHNENpR3pzM0huYmxZbng5WTg1cXRrL2xleEI5UkpsMVZqc2hu?=
 =?utf-8?B?L3ZabEFzVmNyUUY1OHNkaHVET0lSdGFqREEzZDFIZ1VPd3h1SjJBVTdDUEhU?=
 =?utf-8?B?YmxKc21UbmgyVzVHRVk4M2VkSnVkUG9QK254YWFSNUpORVJyci82VzZsT2J5?=
 =?utf-8?B?THNkSDNHY0dFQ2RWQWo0ZnVpY24rNVlsczcraU9zOEo4azhOck9BZTVuUGFa?=
 =?utf-8?B?STllQyt2T0puUVNRYUdQSDY4ZGpacjB2WFU0WUJ3OXpFZFN3dDJ5c2Z6MWNk?=
 =?utf-8?B?STZBRlRHL2xuSGVNWFE2Nnc2WFJVQXdJelZseENOaDA3aFlETVYra0l5cVJT?=
 =?utf-8?B?dDRoMWNLNFZjMWNEWWNteGVXTjNCVXhDb2tLUEtsbCtYM2d0RS9JZG5oYXNG?=
 =?utf-8?B?a005RkM2c0ZJdDg0K1owWjRPQ3JyNFJlQzVLUnFRZ1dEa2QzT1pHZDlkZlVl?=
 =?utf-8?B?MWVkeWtNdVM3RVY5QytPMDZaVnRqQlZJNjBWN2NSZzR4Y1hUOXZaZi9FZ2xG?=
 =?utf-8?B?Vy9CN01uZDc2RFltb3FrRmREUGw5YkROSGRhbXVQVUgwZGxwOVhNaVZOa3VJ?=
 =?utf-8?B?anlENzlQZE5jTW4xS29QNE9mdGs1bnpZVUEyOGFnU3dCbHdKK25yMlMxdmlS?=
 =?utf-8?B?a3UwK0hhbzZMWTRBc09FYUpxa0lLNGdzQXh4Lzl5VDhDbmU0LzBXZ253UXFH?=
 =?utf-8?B?QWZTOVNvMHVlMkRWVzBsUHdheGlPZTEzcjZOYVZjZVc1Snc1czJsbnkwNDRo?=
 =?utf-8?B?RUNpU1JwN2w3UURFMDJTUjJzSUx5MktSdzl0YnZLdHpvNVBEVXkxdVprcFA1?=
 =?utf-8?B?Sk55QXVCaU9RbExZRzd0dGJFNVZJaTg2TEJwZlltRk9FTExTR3A2YW5GcGx3?=
 =?utf-8?B?VzhHSzVrVjkyK3hQSkNEODd4VEg0bVdFRWhXeTRQNkpUcW0vVFlVaCtRL1c4?=
 =?utf-8?B?RE9ndndDYk11RXpqVjNObkJwTHd6dTNNeXFWNnNXTHljWitIc0szdWVoTjBn?=
 =?utf-8?B?RjlIZjk1bmFRam0wRXNpNWZ4VnEwcEk1VzUvT2U1eC9LYkUzL3VnTUxoY2h4?=
 =?utf-8?B?WFVEeUhScG82SDYxUDRGU3ZES3pMaitJSVI5VXRzY3RBVVUvZGs2V1N4anBF?=
 =?utf-8?Q?nLZbXGNp0pTeg=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b0ecc7-7b5f-43d1-7cc5-08db41dcec93
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 20:22:12.0342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DB3BCYLhO7VnG2q67K3IHbcnARumGdLvIO+YoJA2uKOt5DepGiBNcvifo3ZCVpoVtCjTjaChGZ5AxXOui7OIbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
X-Proofpoint-GUID: DeGIUlGm-5vJXg55FSnQ3qxcjte3Irqp
X-Proofpoint-ORIG-GUID: DeGIUlGm-5vJXg55FSnQ3qxcjte3Irqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_15,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304200170
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBBcHIgMjAsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgQXByIDIw
LCAyMDIzIGF0IDAyOjMxOjI1QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBX
ZWQsIEFwciAxOSwgMjAyMywgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgQXByIDE5
LCAyMDIzIGF0IDA5OjQ5OjM1UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4g
QnkgdGhlIHVzYiBzcGVjLCBmb3IgSU4gZGlyZWN0aW9uLCBpZiB0aGVyZSdzIG5vIGRhdGEgYXZh
aWxhYmxlIGFuZCB0aGUNCj4gPiA+ID4gaG9zdCByZXF1ZXN0cyBmb3IgZGF0YSwgdGhlbiB0aGUg
ZGV2aWNlIHdpbGwgc2VuZCBhIHplcm8tbGVuZ3RoIGRhdGENCj4gPiA+ID4gcGFja2V0Lg0KPiA+
ID4gDQo+ID4gPiBJJ20gbm90IGF3YXJlIG9mIGFueSBzdWNoIHJlcXVpcmVtZW50IGluIHRoZSBV
U0ItMiBzcGVjLiAgVGhlIGNsb3Nlc3QgSSANCj4gPiA+IGNhbiBmaW5kIGlzIGluIHNlY3Rpb24g
NS42LjQ6DQo+ID4gPiANCj4gPiA+IAlBbiBpc29jaHJvbm91cyBJTiBlbmRwb2ludCBtdXN0IHJl
dHVybiBhIHplcm8tbGVuZ3RoIHBhY2tldCANCj4gPiA+IAl3aGVuZXZlciBkYXRhIGlzIHJlcXVl
c3RlZCBhdCBhIGZhc3RlciBpbnRlcnZhbCB0aGFuIHRoZSANCj4gPiA+IAlzcGVjaWZpZWQgaW50
ZXJ2YWwgYW5kIGRhdGEgaXMgbm90IGF2YWlsYWJsZS4NCj4gPiA+IA0KPiA+ID4gQnV0IHRoaXMg
c3BlY2lmaWNhbGx5IHJlZmVycyBvbmx5IHRvIHNpdHVhdGlvbnMgd2hlcmUgdGhlIGhvc3QgYXNr
cyBmb3IgDQo+ID4gPiBpc29jaG9ub3VzIGRhdGEgbW9yZSBmcmVxdWVudGx5IHRoYW4gdGhlIGVu
ZHBvaW50IGRlc2NyaXB0b3IncyBiSW50ZXJ2YWwgDQo+ID4gPiBkZXNjcmliZXMuDQo+ID4gDQo+
ID4gVGhpcyBpcyBmcm9tIHVzYiAzLjIgc2VjdGlvbiA0LjQuOC4yOg0KPiA+IA0KPiA+IAlOb3Rl
LCBpZiBhbiBlbmRwb2ludCBoYXMgbm8gaXNvY2hyb25vdXMgZGF0YSB0byB0cmFuc21pdCB3aGVu
DQo+ID4gCWFjY2Vzc2VkIGJ5IHRoZSBob3N0LCBpdCBzaGFsbCBzZW5kIGEgemVybyBsZW5ndGgg
cGFja2V0IGluDQo+ID4gCXJlc3BvbnNlIHRvIHRoZSByZXF1ZXN0IGZvciBkYXRhLg0KPiANCj4g
QWgsIGJ1dCBjaGFwdGVyIDQgaW4gdGhlIFVTQi0zLjIgc3BlYyBkZXNjcmliZXMgb25seSB0aGUg
U3VwZXJTcGVlZCBidXMsIA0KPiBhcyBtZW50aW9uZWQgaW4gdGhlIGZpcnN0IHBhcmFncmFwaCBv
ZiBzZWN0aW9uIDQuMS4gIFNvIHRoZSBjb25zdHJhaW50IA0KPiBhYm91dCBzZW5kaW5nIDAtbGVu
Z3RoIGlzb2Nocm9ub3VzIHBhY2tldHMgd2hlbiBubyBkYXRhIGlzIGF2YWlsYWJsZSANCj4gYXBw
bGllcyBvbmx5IHRvIFN1cGVyU3BlZWQgY29ubmVjdGlvbnMuICBJZiBhIGdhZGdldCBpcyBjb25u
ZWN0ZWQgYXQgDQo+IFVTQi0yIHNwZWVkLCB0aGUgY29uc3RyYWludCBkb2Vzbid0IGFwcGx5Lg0K
DQpSaWdodCwgdGhpcyBtYXkgbm90IGJlIGEgcmVxdWlyZW1lbnQgZm9yIHVzYjIgc3BlZWRzLiBS
ZWdhcmRpbmcgb3VyIGR3YzMNCmNvbnRyb2xsZXIsIGl0IGtlZXBzIHRoZSBzYW1lIGJlaGF2aW9y
IGZvciBib3RoIHVzYjIgYW5kIHVzYjN4IHNwZWVkcywNCndoaWNoIGlzIHRvIGF1dG9tYXRpY2Fs
bHkgcmVzcG9uZCB3aXRoIGEgMC1sZW5ndGggcGFja2V0IGZvciBJTiBpc29jDQplbmRwb2ludCBp
ZiB0aGUgaG9zdCByZXF1ZXN0cyBhbmQgbm8gZGF0YSBpcyBhdmFpbGFibGUuDQoNCkJSLA0KVGhp
bmgNCg0KPiANCj4gKEFuZCBpbiBmYWN0LCBubyBtYXR0ZXIgd2hhdCB0aGUgY29ubmVjdGlvbiBz
cGVlZCBpcywgdGhlcmUncyBhbHdheXMgYSANCj4gcG9zc2liaWxpdHkgdGhhdCB0aGUgZmlyc3Qg
cGFja2V0IHNlbnQgYnkgdGhlIGhvc3QgdG8gYmVnaW4gYW4gDQo+IGlzb2Nocm9ub3VzIHRyYW5z
ZmVyIG1pZ2h0IGdldCBsb3N0IG9yIGNvcnJ1cHRlZCwgaW4gd2hpY2ggY2FzZSB0aGUgDQo+IGRl
dmljZSB3b3VsZCBub3Qgc2VuZCBhIHJlcGx5IGluIGFueSBjYXNlLikNCj4gDQo+ID4gPiA+ICBU
aGlzIGlzIHdoYXQgdGhlIGR3YzMgY29udHJvbGxlciB3aWxsIGRvLiBTbyByZWdhcmRsZXNzIHdo
ZXRoZXINCj4gPiA+ID4geW91IHByZXBhcmUgYW5kIHF1ZXVlIGEgMC1sZW5ndGggcmVxdWVzdCBv
ciBub3QsIHRoZSBob3N0IHdpbGwgcmVjZWl2ZQ0KPiA+ID4gPiBpdC4NCj4gPiA+IA0KPiA+ID4g
RXZlbiBzbywgd2hldGhlciB0aGUgZnVuY3Rpb24gZHJpdmVyIHN1Ym1pdHMgdGhlc2UgMC1sZW5n
dGggaXNvY2hyb25vdXMgDQo+ID4gPiByZXF1ZXN0cyBtYWtlcyBhIGRpZmZlcmVuY2UgaW4gdGVy
bXMgb2YgZmlsbGluZyB0aGUgc2xvdHMgaW4gdGhlIA0KPiA+ID4gc2NoZWR1bGUgYW5kIHByZXZl
bnRpbmcgbGF0ZXIgcmVxdWVzdHMgZnJvbSBiZWNvbWluZyBzdGFsZS4NCj4gPiA+IA0KPiA+IA0K
PiA+IFRoYXQncyBub3QgbXkgcG9pbnQuIEF2aSBjb25jZXJuIHdhcyBob3cgdGhlIGhvc3QgbWF5
IGludGVycHJldCAwLWxlbmd0aA0KPiA+IHBhY2tldC4gTXkgcG9pbnQgd2FzIHRvIG5vdGUgdGhh
dCBpdCBzaG91bGQgYmVoYXZlIHRoZSBzYW1lIGFzIGJlZm9yZS4NCj4gPiBCZWNhdXNlIGV2ZW4g
d2l0aG91dCBzZW5kaW5nIDAtbGVuZ3RoIHJlcXVlc3RzLCB0aGUgY29udHJvbGxlciB3b3VsZA0K
PiA+IGFscmVhZHkgcmVzcG9uZCB3aXRoIDAtbGVuZ3RoIHBhY2tldCBhbHJlYWR5Lg0KPiANCj4g
SXQgd291bGQgYmUgZ29vZCB0byBjb25maXJtIHRoZSByZWFzb25pbmcgYnkgY2hlY2tpbmcgdGhl
IHNvdXJjZSBjb2RlIA0KPiBmb3IgdGhlIFVWQyBob3N0IGRyaXZlci4gIEJ1dCBJIGV4cGVjdCB5
b3UgYXJlIHJpZ2h0Lg0KPiANCj4gPiBJbiBmYWN0LCB0aGF0J3Mgd2hhdCB0aGUgVVZDIGRyaXZl
ciBzaG91bGQgYmUgZG9pbmcsIGJ5IG1haW50YWluaW5nIHRoZQ0KPiA+IHJlcXVlc3QgcXVldWUg
d2l0aCBkdW1teSByZXF1ZXN0cyBhcyBzdWdnZXN0ZWQgaW4gdGhlIGJlZ2lubmluZy4NCj4gPiAN
Cj4gPiBQZXJoYXBzIHRoZXJlIHdhcyBzb21lIG1pc3VuZGVyc3RhbmRpbmcuIFNlbmRpbmcgMC1s
ZW5ndGggcmVxdWVzdCB5b3UNCj4gPiBzdWdnZXN0ZWQgaXMgYSBwZXJmZWN0bHkgZ29vZCBzdWdn
ZXN0aW9uIGFuZCBVVkMgZ2FkZ2V0IGRyaXZlciBzaG91bGQgZG8NCj4gPiB0aGF0IGluc3RlYWQg
b2YgcmVseWluZyBvbiB0aGUgd29ya2Fyb3VuZCBpbiB0aGUgZHdjMyBkcml2ZXIuDQo+IA0KPiBB
Z3JlZWQuDQo+IA0KPiBBbGFuIFN0ZXJu
