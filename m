Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6066E8516
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 00:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjDSWkt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 18:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbjDSWkp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 18:40:45 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BDD26A1
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:40:15 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33JIJNLO005213;
        Wed, 19 Apr 2023 15:38:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=DfOTx1udQclhBcGWjVE8xJmngG/JRvfZPH3A2DazmNM=;
 b=KVlKRuGHkjl47oWAvJZxYxzBaZn08oZ6T0Dk9fff6wrXHUrEy+jwTzF8OdfF51HP83YY
 8/l3p/h0Ib1u7LAVe/Cvs+eYn2QqqlrC6NdiiRxkRafu1iaFJBoSXBxkGitB06WmvCT+
 yP8D1aTNzMwFBqYZMAiIre8JLKhod4HT0K3xzib5CpFealGr4idYdfx8JC5PlElcDwNZ
 I5rfYLSI7OHOfL+AoTP2nrssq+FPox9hqsM8jwSi7TSbBTQLSKsrXM67t3lqAA2TnAWr
 9kFsWIiBMDnJF5m9o2ENmGObjpvQdxZiL81lSb/eQVAFEdSMbwJaj0W0KYeLiIE91wuM bA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pytuvwfxs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 15:38:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681943925; bh=DfOTx1udQclhBcGWjVE8xJmngG/JRvfZPH3A2DazmNM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=G2q5y55K1BX+nr2WS3QLLJnz0/jxZIlCWe0Y97F5E8qfD5PZRTzYMVMb3qMTEDOjq
         0MDilyaebMz5XSYtOgnAkrm4UAVGupkM0k+aPKN8ZYXr9qzL0VedMciF39hQEDeql3
         awI5jUYGMb97LsAQHd44IryifaxaCwO8wTe79bX8Hseo+e5K0zLhhraYHJgQVtNSFY
         TADFB1M/JCLeFY5zOk/G+tspuJfnzDvorUDm4E4Ms24ifuXaaEdJlPEM8MyVqOMx/c
         0t2tQQh83Ga/239UvvzVhPjlUQ2JoGk2noVc6cOH0CkYrpai2oYnVti6aCn6QPzyfX
         uxstQI9a/PD+A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0EE1240754;
        Wed, 19 Apr 2023 22:38:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C069DA006E;
        Wed, 19 Apr 2023 22:38:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XC0wb0H0;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 14A0D4079A;
        Wed, 19 Apr 2023 22:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=if+tiKYSiVNGlXYmUw/Ak2jxpO37o+V2PVVAlLhTBADhevpDndnN+wIOCWcXuihs2REYVM/LMwgFODpw4FdcOmu2/d3nTV023z+JGW3GruhGroyps1n0SAgO7xrTPzdgbGd12ZFus7SN9m0JW1BMedEzamwwh+TNyC+Dclt2myiWowRDkpS1UaUlemUdCeha9T5t995UztccHJ4tFHUrK9xhiPzvu+kcZyK5Rtl60OhA8y6bntSI9Bxp2jWfTSRRnbHCXrzxSc5yk8fcp/Eh3nt2Yn8C4f6nWPrEKDHvC542uOmkP8e+urU0WXYPBXHL7hLZMox4TEuusLQztkv9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfOTx1udQclhBcGWjVE8xJmngG/JRvfZPH3A2DazmNM=;
 b=m6lEaEgyv/kB9s909Bl0nLmJs3S35eSBT8SGx9YjNvyweaydkAOBmWbwp6ctZK5xaye9Msssx2YrpG74xph1jotVJWFMhVw0/QZ9YnQ735FlDj6qxYWFsqNFKJGdoVxzSvFZhKUiOAzSDe40UURVEr6cVQFRR/keNrxeqqeIaBfte0Ivsy1W6NNz/bEZ24O68QIboZnnErJvFgZiUVma+LZ65nSttRnjuoeAr4X/oEHj1FvDxqhpOCSRL+GqkJJip3Wd3zLZbnfQEu0a5Va4lQ7VueZmUzMioDrt9bhdD+lh+XajeTXIgSobYd/BXr5Q/j2lVoGw5zK9mU1IQGisFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfOTx1udQclhBcGWjVE8xJmngG/JRvfZPH3A2DazmNM=;
 b=XC0wb0H0nwfb344DfGmWVz7G9/hFGWAY/gWEpb3TybtRA/MVI2+ovgKPEc52/8LrbZGF2Luu27PEx+ZsNQcvjrewT1doUfthdJJZz/ZPuyfSrcHUL/Yt2VyAXzIdqHT8MvTArxqbNVswYA/RM2IdmOIZpOuEpQwVJ+mq5Z807Rk=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 22:38:39 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 22:38:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAARK9gIAAClmAgAADXYA=
Date:   Wed, 19 Apr 2023 22:38:39 +0000
Message-ID: <20230419223835.drmyqjhwx6cc4htg@synopsys.com>
References: <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
 <CAMHf4WJOPGdcL9-rZcSgUgXSkzrqMqa1H8CdpsM=EH8rqNMuUQ@mail.gmail.com>
In-Reply-To: <CAMHf4WJOPGdcL9-rZcSgUgXSkzrqMqa1H8CdpsM=EH8rqNMuUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH0PR12MB5073:EE_
x-ms-office365-filtering-correlation-id: a52ec1c2-36b7-49a9-437c-08db4126d214
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QfDWx2Y4x4YnA0e6dzLzLoHgojOBEN1imQZKXDEkf8FcxLzp29EOWqpEWQV4hZThC0Tcms6/5evXg1tjh59JymEVWWNS+KoB3OQO1bY/WvVWIFjvOho7UOAp2zwA8IkU3fU32RqReFRekWLmVrYVnG6e5ngyt6RtYqyMlWC981aePJLYCjQw+kdkGBJNlVD2q3wnBrYFTCQj+nMfg2ZELo6Ahx2ywb4BUQvNkxVQanPPb9ZlFK29uvEAW/duFAtRdboCqUSXGPojSQYb3zO4kJHh7+BP6jFg0NhB2CdaXuqfblo3kpOKudnhXyr3uxeP7omsPr0G1dCzlyw8tG1lPTrab73LObfKbwsETCzcLBtNZw4Qn+McVJIM3drHifnD3PMmzE0sgakvyiyfGRAqLHBaUUgtDyr5rddVBDb4iSzUK2fNJeIfHAkiWt5sQ/a8tVVhks4Cb2rBKF+9ZUWYI1yVNrvoJWio/jQOZN61KUmOtGWRwE7mphOUQccisfv7HXGB0rP73BqDXFDPZCazpV6lVnvvca9zJuh/nEXbeTyHMafs5AWX/8L3+Ej2a1pYztowXlP0ulPmzBnLKOHgXGzAlw9kIiqgxTcN0i3vxwGKek6L7gjNUG/ofKA7W0z0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(38070700005)(38100700002)(2906002)(8676002)(8936002)(66899021)(5660300002)(36756003)(86362001)(6486002)(71200400001)(6512007)(1076003)(6506007)(26005)(54906003)(478600001)(2616005)(83380400001)(66946007)(53546011)(186003)(76116006)(316002)(41300700001)(122000001)(66556008)(66476007)(64756008)(66446008)(4326008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnY5dGdiVW9PcGpLSjhnRnJ6YWFkT2lpOWx6L3dqZWhRZHhJNWpzV3ZlTFBC?=
 =?utf-8?B?VVNMcklpclJISHRaQVNTaytLVDNqd0Y4SVB5c1c5N3lqR3VZUTBpNDIxVE5u?=
 =?utf-8?B?Q0NDNFRLZW8yK2srRlk5L291eTNFbkhHa01JdWJNNFlaM2NZb29MTy9OdnI0?=
 =?utf-8?B?QnNVZG5pTTJ1Rk9yQ0t4NXF1eU9QSVl4YTNSTzZVekthY1dmQzI2K3ArV0pn?=
 =?utf-8?B?bkhrS3BTbERLMjF0OUY1SDNtK0hSWXNXOTE4TzhVR2JHWUlpMkgzeUhpUEh1?=
 =?utf-8?B?a09meDlzRGhtVXh2TFUzYjFuNVQ5Um9TNk52STNqam52MzVtVEdpaXdlWkd2?=
 =?utf-8?B?UnBYaXdBRzNlV3IyUEo4UUpiY3lEemdoVllRbEhoNnE5MXVnajhkckVuRStz?=
 =?utf-8?B?Z1BUV1lTZFNQaTZCd2g0NWcvWm5hVUNoOGIzeDlOTEdNVys0WUhMY1VzTllN?=
 =?utf-8?B?RW1oekwwZlVpZFhDc09uUTZIbjd5Q0RBSzlOQ0NwQ2JKUHRnR0pHSTl6R25F?=
 =?utf-8?B?a3d2azZ2WEcyYWsvanRDSU9YVGlLTkVvTWQ0OHZHeVNCdUJXdENJWExKSFhY?=
 =?utf-8?B?VkExTzhoRVRMUGs3d21TN1V5dzMxSExpNmJQSGJjWEVDaW5rZ2dHZ3lrbFpC?=
 =?utf-8?B?eDhqeXRuZHdla3V3eCtWOERXZ2lPaUFkYnlDcWhEdEdMQTkrbGxacWtOaEdE?=
 =?utf-8?B?N1JDMjVjaVJSZE5DZ3NYVnJyTXo5QXNLdUpOK0JHK1RkVndsR2hkd1V3S2Nj?=
 =?utf-8?B?SzQxb2VSN2NybnN6VTV6bFpoSlVTdnZ3U3l1YWMvQW8rNlYwRmhzcUtEbDlS?=
 =?utf-8?B?a01HRHUxV1lVZWJqN2dQRkpHZEFEaThyOU15Uk5hNmpBNTBDN0ZWdjBtWDNB?=
 =?utf-8?B?VDA3eDZDYXFnMi9FZnZ5Mm5vaGtTcTNRL3dSY2JQNnl3MFovWUdOckFnY1M0?=
 =?utf-8?B?ejNJU3J6YkVEYXk4ZExnNnNVbUkxSHBMamY2cHNBSmlxaG10MkNQQVlJY1Iy?=
 =?utf-8?B?YWtGSDV3ekNJV2hpNVA5b09pWHVjaWRkNEQvaW45eUluc2czMzlDTWZZMTk2?=
 =?utf-8?B?WFZhT2xUZ3AxWW40SmxwenNBdU9tSUx5YndLbzMxYStBRHR6L2J1RkNQdWkv?=
 =?utf-8?B?Q1FtVlk4SmlCYWEvRUhhMExIWHl2S3Z2d3Q5cjhrT3hzSEVLbzB1dElkempY?=
 =?utf-8?B?WVVjVXVPeWF5RlBiVEpaTnRsNzJjM2hoZG43N2FLa1NQY1ZYNGcxTVlRbnNQ?=
 =?utf-8?B?MUprQ1luRzhvVHNOUmRtOXFmZGZMRCtHZWFNN0FrdndaWnRDd3hzTjU0bWkz?=
 =?utf-8?B?WHhuLzB1Wm8yVGJCajBYSURGajA3RzRrbGpSRXVuZFZjdVptN2xaazQyZ2pk?=
 =?utf-8?B?ZUhkVkpZaFNyYjkvTjVqdHlVMTZTVEtlUzVzZDRzSFNYS1pIV284RnFwSUpI?=
 =?utf-8?B?VXJaSUt2VEdMUHdFWUVYbUk0ZnltQkJiS0ZLZWl1N2FVZFdkWlFCOUtlVlFN?=
 =?utf-8?B?bEoxdXdNdDBhaXFXOHVpLzZPNUQwWkR3OTRqMUZ4S1hCTmJ6cXNoMk9jNmg3?=
 =?utf-8?B?eHkza0RDS0NvZXNCOE9YU250N3lXWEdhaTkyLzJmWnk4ZjBHMmRTdGZwck92?=
 =?utf-8?B?Q05mRDR5OGtsVW9CbmRTbU1jMkduQUd0bHR6dVpkN2g0TjkweVptUXArYjRB?=
 =?utf-8?B?N3FlYjMxbFJyT044ZVVwcWwxbW1LU2hSVDhNTkc4Qjl1OTUzNHZYKytOMHJW?=
 =?utf-8?B?QjIrd2NDQzdVaFlhc2ZZbkwwM3NCQXQzVmU2M0JEdzNEb0NmSTdSMzM3bFVL?=
 =?utf-8?B?VkkzTmZieXhrUlZ2WHcrbklFcTVQQ2FJRHRILzQ1YmVNNVRuSVdKelUxWTdy?=
 =?utf-8?B?NUNkcjBEUG1MK1hOSnVxUzR6Ym51d21YNkNjaXkvbURRZDRvcFh3ejhSN2FC?=
 =?utf-8?B?RTVwVTB1QitUR3hxbkxMWkFad0RTZW5GbFZaTmUxK0U4U1JuSk9UOGRjeWVs?=
 =?utf-8?B?d2xCSEFveVF3cDBVcHZUWWdoQ01KaXI3VWhsSEFlc3p1ZVYwb1pNYUU4czNE?=
 =?utf-8?B?d2ZHdDlRVjVjTWwydVNMM0Z6ZlVsbnJRY2Q0My9xdjhSVXRiNGZzYThabk5T?=
 =?utf-8?Q?hAyJm79Z5QXZlX1TuOPWJ13zG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD2AD97B4FD0EE4B90C2AB4A5BD38F94@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?dDJRenFRQVJBcnJ1ZlpFNDlFaTEzdHN2QWxRdWczbzFmUVg5dXhRTG5ic2ts?=
 =?utf-8?B?MTYvS0gvRzlJUFhQNHljMStjSlBIenNiTEZ5N2hadTlIRXZnNVJpNnpNdzJN?=
 =?utf-8?B?a3dtc25qUytHczNlbTBKUEdOY2lyaTNxc1dwRGNqRzNSUnNPSnFQN2w5dGt6?=
 =?utf-8?B?RU9BaU42V0Z0amJHNUNNTzFaMEtNMllzNHV0bXlsMmRkVjVZMzE0VGg5bU1Q?=
 =?utf-8?B?QnNxMDRGQWtualNTbytLSng5YnpzT1JIOFZaaCtxTkRxQVd1QmRsRzNxdXZB?=
 =?utf-8?B?M1ZLV3dxTW9VelBCZlhkSUV4NGRHQTNRSzZpVndVdHhNR2lwRGlGa1pUZUY1?=
 =?utf-8?B?M2RnY0tIU0ZyVkVyQ3JZdkFsZ2w1TzRiQm9KZU4xc2VBZDk0d3o0cGpyWkZt?=
 =?utf-8?B?NXZNbStEVVg3V0UzblVKZWJmYnFKTVJJanc3TnNPK3VBak5haE5uYi9qNUV2?=
 =?utf-8?B?TFI5TDcrM0FjWHRFYVhqY0FKZFd4NjY1V1B6MnVnTW9lUURNVlZNbUZBREJ6?=
 =?utf-8?B?R3pjVklVVWlCYVBKWkJaT3F6dkt5V21Yck5DWjQxNEhVRHZJd3VaMjFwQlIr?=
 =?utf-8?B?TW5yUWdVVHNCY1VKNUlucHdIdWpnM0gyRkYvWFVBWEFieElYdVkxTnU2TlZX?=
 =?utf-8?B?Tkdzc0sydmRudkRiS01NQnNXSWF6SW1Zbm0vWWRzemVBVEx3akFlNUQxcVdM?=
 =?utf-8?B?enk5Qm9VMk1uU0dubkcweEl6eFQzZDJsSk01U1hRTEVyc0p6ZGxKeWEwaVE4?=
 =?utf-8?B?Mm5QZGcxS1VGMUc5Rm1BQ2d1SGtQTzFZVFVyMllCdmZVczNabWo4eEJwbHEr?=
 =?utf-8?B?VlovbGMvaGdpbUxONHcvTGJZS2RXQzBLalMyM1p2Zy91YlpQUFN0Snp6VGdz?=
 =?utf-8?B?VDkxMldnTmd3MUNDN1cxTVF2aWJWc0xhVHB2Z2dkc29zMHRkaHZqeW1HRTVk?=
 =?utf-8?B?eG1sRUVXOHdhNS9aS2dnYmw5U0hycmMrd0p2Q1Boa2VnYUZJWVVZQVFvODVv?=
 =?utf-8?B?MUdTUkxXTjd6WE5zYXVXclNGbGhzRFRPcGYyaFhMYmIyNFVWR1BzQmMvYW5x?=
 =?utf-8?B?UE1naGZwSE52NGVpNUxmRkFBNVRXZGM1VXZuSzNpTjBQWCtocTVVaTA3WGtX?=
 =?utf-8?B?U1ovWE52Y0w4RmErK3orblhwZmRRSzg2cklHSHFmTTF6cGYvV2lUNWs3VUxH?=
 =?utf-8?B?Mld3cjFKWTc3YVhyRXhsNDRSTHRhLzVXS2FmdktsSnEzaWJSWjk1MGRlK0pp?=
 =?utf-8?B?RkNpMDFTVE5yVEZmTVdjU0N3S3JoNDhOekRxMkNkVWRaRFU5aWJqY3dNRWNn?=
 =?utf-8?Q?3RHvKfTICGLJU=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52ec1c2-36b7-49a9-437c-08db4126d214
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 22:38:39.1609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vJ7YC4eR+VOL06atPfXGxr3fkgvISUbmuOcAt1in9QaZnF81ccT6I4PStxh8qRr+mkdy6e/adTVpNtkBrRJ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073
X-Proofpoint-ORIG-GUID: -jpwEKKOBi-iZAXu-gmBUQVvrPmelv1O
X-Proofpoint-GUID: -jpwEKKOBi-iZAXu-gmBUQVvrPmelv1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_14,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304190195
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBBcHIgMTksIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAxOSwgMjAyMyBhdCAyOjQ54oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3Bz
eXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIzLCBBdmljaGFsIFJh
a2VzaCB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDY6MDfigK9QTSBBbGFu
IFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1PiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+
ID4gT24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMDM6NDU6NTNQTSAtMDcwMCwgQXZpY2hhbCBSYWtl
c2ggd3JvdGU6DQo+ID4gPiA+ID4gSSBzZWUsIGFuZCBJIHRoaW5rIEkgdW5kZXJzdGFuZCBHcmVn
J3MgcHJldmlvdXMgY29tbWVudCBiZXR0ZXIgYXMNCj4gPiA+ID4gPiB3ZWxsOiBUaGUgVVZDIGRy
aXZlciBpc24ndCBmYWxsaW5nIGJlaGluZCBvbiB0aGUgdmlkZW8gc3RyZWFtLCBpdCBpcw0KPiA+
ID4gPiA+IGZhbGxpbmcgYmVoaW5kIHRoZSB1c2IgY29udHJvbGxlcidzIG1vbm90b25pYyBpc29j
IHN0cmVhbS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEZyb20gd2hhdCBJIGNhbiBzZWUsIHRoaXMg
bGVhdmVzIHVzIGluIGFuIGludGVyZXN0aW5nIHBsYWNlOiBVVkMNCj4gPiA+ID4gPiBhbGxvd3Mg
dGhlIGhvc3QgdG8gY29uZmlndXJlIHRoZSBjYW1lcmEncyBvdXRwdXQgcmVzb2x1dGlvbiBhbmQg
ZnBzLA0KPiA+ID4gPiA+IHdoaWNoIGVmZmVjdGl2ZWx5IGNvbnRyb2xzIGhvdyBmYXN0IHRoZSBj
YW1lcmEgaXMgZ2VuZXJhdGluZyBkYXRhLg0KPiA+ID4gPiA+IFRoaXMgaXMgYXQgb2RkcyB3aXRo
IHRoZSBVVkMgZ2FkZ2V0IGRyaXZlciwgd2hpY2ggY3VycmVudGx5IHBhY2tzIGVhY2gNCj4gPiA+
ID4gPiB2aWRlbyBmcmFtZSBpbnRvIGFzIGZldyB1c2JfcmVxdWVzdHMgYXMgcG9zc2libGUgKHVz
aW5nIHRoZSBmdWxsDQo+ID4gPiA+ID4gYXZhaWxhYmxlIHNpemUgaW4gdXNiX3JlcXVlc3RzKS4g
RWZmZWN0aXZlbHksIHRoZSBVVkMgZ2FkZ2V0IGRyaXZlcg0KPiA+ID4gPiA+IGF0dGVtcHRzIHRv
IHVzZSB0aGUgImZ1bGwiIGJhbmR3aWR0aCBvZiBpc29jIHRyYW5zZmVycyBldmVuIHdoZW4gdGhl
DQo+ID4gPiA+ID4gY2FtZXJhIGlzbid0IGdlbmVyYXRpbmcgZGF0YSBmYXN0IGVub3VnaC4gRm9y
IGV4YW1wbGUsIGluIG15DQo+ID4gPiA+ID4gb2JzZXJ2YXRpb25zOiAxIHZpZGVvIGZyYW1lIGlz
IH4yMmtCLiBBdCAzMGZwcywgdGhpcyByZXByZXNlbnRzIDEvMzANCj4gPiA+ID4gPiBvZiB0aGUg
YW1vdW50IG9mIGRhdGEgdGhlIGNhbWVyYSB3b3VsZCBnZW5lcmF0ZSBpbiBhIHNlY29uZC4gVGhp
cyAyMmtCDQo+ID4gPiA+ID4gaXMgc3BsaXQgaW50byA4IHVzYl9yZXF1ZXN0cyB3aGljaCBpcyBh
Ym91dCAxLzEwMDAgdGhlIG51bWJlciBvZg0KPiA+ID4gPiA+IHJlcXVlc3RzIFVWQyBkcml2ZXIg
bmVlZHMgdG8gZ2VuZXJhdGUgcGVyIHNlY29uZCB0byBwcmV2ZW50IGlzb2MNCj4gPiA+ID4gPiBm
YWlsdXJlcyAoYXNzdW1pbmcgMTI1dXMgbW9ub3RvbmljIHVmcmFtZXMpLiBBc3N1bWluZyBzb21l
IGZ1ZGdlDQo+ID4gPiA+ID4gZmFjdG9yIGZyb20gdGhlIHNpbXBsaWZpY2F0aW9ucyBpbiB5b3Vy
IGV4cGxhbmF0aW9uIGdpdmVzIHRoZSB1dmMNCj4gPiA+ID4gPiBkcml2ZXIgc29tZSBleHRyYSBs
ZWV3YXkgd2l0aCByZXF1ZXN0IHF1ZXVpbmcsIHdlJ3JlIHN0aWxsIHJvdWdobHkgdHdvDQo+ID4g
PiA+ID4gb3JkZXIgb2YgbWFnbml0dWRlcyBvdXQgb2Ygc3luYy4gRXZlbiB3aXRoIHBlcmZlY3Qg
J2NvbXBsZXRlJw0KPiA+ID4gPiA+IGNhbGxiYWNrcyBhbmQgdmlkZW8gZnJhbWUgZW5jb2Rpbmdz
LCBhbiB1bmRlcnJ1biBzZWVtcyBpbmV2aXRhYmxlLg0KPiA+ID4gPiA+IERhdGEgaXMgYmVpbmcg
Z2VuZXJhdGVkIGF0IGEgZmFyIHNsb3dlciByYXRlIHRoYW4gaXQgaXMgYmVpbmcNCj4gPiA+ID4g
PiB0cmFuc2ZlcnJlZC4gRG9lcyB0aGlzIHJlYXNvbmluZyBzZWVtIHZhbGlkPw0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gSnVzdCBhcyBhIHRlc3QgSSdsbCB0cnkgdXBkYXRpbmcgdGhlIFVWQyBkcml2
ZXIgdG8gY29uc3VtZSAyNjYNCj4gPiA+ID4gPiB1c2JfcmVxdWVzdHMgcGVyIHZpZGVvIGZyYW1l
ICh+MS8zMCBvZiA4MDAwKSwgd2hpY2ggc2hvdWxkIGJlIGVub3VnaA0KPiA+ID4gPiA+IHRvIGtl
ZXAgdGhlIHVzYiBjb250cm9sbGVyIHF1ZXVlIG9jY3VwaWVkIGZvciB+MS8zMHMuIElkZWFsbHks
IGJ5IHRoZQ0KPiA+ID4gPiA+IHRpbWUgdGhlIGNvbnRyb2xsZXIgcXVldWUgaXMgZW1wdHksIHRo
ZSBjYW1lcmEgd291bGQgaGF2ZSBwcm9kdWNlZCBhDQo+ID4gPiA+ID4gbmV3IGZyYW1lLiBUaGlz
IGRvZXNuJ3Qgc29sdmUgdGhlIGlzc3VlIHdpdGggbGF0ZW5jaWVzIGFyb3VuZCBjYWxsYmFjaw0K
PiA+ID4gPiA+IGFuZCBhbiBpc29jIGZhaWx1cmUgbWlnaHQgc3RpbGwgaGFwcGVuLCBob3BlZnVs
bHkgdGhlIGZhaWx1cmUNCj4gPiA+ID4gPiBmcmVxdWVuY3kgaXMgcmVkdWNlZCBiZWNhdXNlIFVW
QyBxdWV1ZXMgZW5vdWdoIHJlcXVlc3RzIHBlciB2aWRlbw0KPiA+ID4gPiA+IGZyYW1lIHRvIG5v
dCBzdGFydmUgdGhlIGNvbnRyb2xsZXIncyBxdWV1ZSB3aGlsZSB3YWl0aW5nIG9uIGEgbmV3DQo+
ID4gPiA+ID4gZnJhbWUgYW5kIHRoZSBvbmx5IHdheSB0aGV5IGdvIG91dCBvZiBzeW5jIGlzIGZy
b20gJ2NvbXBsZXRlJyBjYWxsYmFjaw0KPiA+ID4gPiA+IHRpbWluZ3MuIEkgYW0gYXNzdW1pbmcg
dGhpcyBoYXMgYmVlbiB0cmllZCBiZWZvcmUsIGJ1dCBteSBMS01MIHNlYXJjaA0KPiA+ID4gPiA+
IHNraWxscyBhcmUgZmFpbGluZyBhbmQgSSBjYW4ndCBmaW5kIG11Y2ggb24gaXQuDQo+ID4gPiA+
DQo+ID4gPiA+IE5vdGUgdGhhdCB0aGVyZSdzIG5vdGhpbmcgd3Jvbmcgd2l0aCBzdWJtaXR0aW5n
IGEgMC1sZW5ndGggaXNvY2hyb25vdXMNCj4gPiA+ID4gdHJhbnNmZXIuICBJZiB0aGVyZSdzIG5v
IGRhdGEgbGVmdCBidXQgeW91IHN0aWxsIG5lZWQgdG8gc2VuZA0KPiA+ID4gPiBfc29tZXRoaW5n
XyBpbiBvcmRlciB0byBmaWxsIG91dCB0aGUgcmVtYWluaW5nIHNsb3RzIGluIHRoZSBjb250cm9s
bGVyJ3MNCj4gPiA+ID4gc2NoZWR1bGUsIHRoaXMgaXMgYSBnb29kIHdheSB0byBkbyBpdC4NCj4g
PiA+ID4NCj4gPiA+IE9oLCB0aGlzIGlzIHZlcnkgZ29vZCB0byBrbm93LCB0aGFuayB5b3UhISBX
ZSBqdXN0IG5lZWQgdG8gcmVhY2ggYQ0KPiA+ID4gc3RlYWR5IHN0YXRlIG9mIFVWQyBxdWV1aW5n
IGVub3VnaCByZXF1ZXN0cyBtb25vdG9uaWNhbGx5IChldmVuIGlmDQo+ID4gPiB0aGV5IGFyZSBl
bXB0eSksIGFuZCB0aGUgdXNiIGNvbnRyb2xsZXIgY2FsbGluZyB0aGUgJ2NvbXBsZXRlJw0KPiA+
ID4gY2FsbGJhY2sgdG8gZ2l2ZSBpdCBtb3JlIHJlcXVlc3RzIHRvIHF1ZXVlLiBBbHRob3VnaCBJ
IHdvbmRlciBob3cgdGhlDQo+ID4gPiBob3N0J3MgVVZDIGRyaXZlciB3b3VsZCBpbnRlcnByZXQg
dGhlIHplcm8gbGVuZ3RoIHBhY2tldHMsIGlmIGl0IHdvdWxkDQo+ID4gPiBldmVuIGNhcmUuDQo+
ID4NCj4gPiBCeSB0aGUgdXNiIHNwZWMsIGZvciBJTiBkaXJlY3Rpb24sIGlmIHRoZXJlJ3Mgbm8g
ZGF0YSBhdmFpbGFibGUgYW5kIHRoZQ0KPiA+IGhvc3QgcmVxdWVzdHMgZm9yIGRhdGEsIHRoZW4g
dGhlIGRldmljZSB3aWxsIHNlbmQgYSB6ZXJvLWxlbmd0aCBkYXRhDQo+ID4gcGFja2V0LiBUaGlz
IGlzIHdoYXQgdGhlIGR3YzMgY29udHJvbGxlciB3aWxsIGRvLiBTbyByZWdhcmRsZXNzIHdoZXRo
ZXINCj4gPiB5b3UgcHJlcGFyZSBhbmQgcXVldWUgYSAwLWxlbmd0aCByZXF1ZXN0IG9yIG5vdCwg
dGhlIGhvc3Qgd2lsbCByZWNlaXZlDQo+ID4gaXQuDQo+ID4NCj4gSWYgdGhpcyBpcyB0aGUgY2Fz
ZTogdGhlIHVzYiBjb250cm9sbGVyIHNlbmRzIGEgMCBsZW5ndGggcGFja2V0IHRvIHRoZQ0KPiBo
b3N0IHdoZW4gdXZjIGdhZGdldCBkcml2ZXIgZG9lc24ndCBxdWV1ZSBhbnl0aGluZywgd2hhdCBz
dG9wcyB0aGUNCj4gY29udHJvbGxlciBmcm9tIGFzc3VtaW5nIHRoYXQgdGhlIHVzYl9yZXF1ZXN0
IHF1ZXVlZCBieSBhIGdhZGdldA0KPiBkcml2ZXIgaXMgYWx3YXlzIGZvciB0aGUgbmV4dCBhdmFp
bGFibGUgdWZyYW1lLCBhbmQgbm90IGZvciBvbmUgaW4gdGhlDQo+IHBhc3Q/IFRoaXMgaXMgZWZm
ZWN0aXZlbHkgdGhlICJhbHdheXMgcmVzY2hlZHVsZSIgc3VnZ2VzdGlvbiB5b3UgbWFkZQ0KPiBi
ZWZvcmUgYnV0IGFzIGEgZGVmYXVsdCBpbnN0ZWFkIG9mIHNwZWNpZmljIHRvIHV2Yy4gQXJlIHRo
ZXJlIGNhc2VzDQo+IHdoZXJlIHdlIHdvdWxkIHdhbnQgdG8gdGVsbCB0aGUgZ2FkZ2V0IGRyaXZl
ciB0aGF0IGl0IGZlbGwgYmVoaW5kPw0KPiBBcG9sb2dpZXMgaWYgSSBhbSBtaXNzaW5nIHNvbWV0
aGluZyBmdW5kYW1lbnRhbCBoZXJlLCBpdCBmZWVscyBsaWtlIEkNCj4gYW0gOiguDQoNCk5vLCB0
aGUgY29udHJvbGxlciBkb2Vzbid0IGFzc3VtZSB0aGF0LiBJdCB3b24ndCBxdWV1ZSBmb3IgdGhl
IGZ1dHVyZQ0KdWZyYW1lIGlmIGl0J3Mgc3RhbGUuIFRoZSBVVkMgZ2FkZ2V0IGRyaXZlciB3aWxs
IG5lZWQgdG8ga2VlcCBmZWVkaW5nDQpyZXF1ZXN0cyB1bnRpbCBpdCBjYXRjaGVzIHVwIHRvIHRo
ZSBjdXJyZW50IHVmcmFtZS4gUmVtZW1iZXIgdGhhdCB0aGUNCmlzb2MgZGF0YSBpcyB0aW1lIHNl
bnNpdGl2ZSwgaWYgaXQncyBub3QgZ29uZSBvdXQgYXQgYSBzcGVjaWZpYyB1ZnJhbWUsDQp0aGVu
IGl0J3MgZHJvcHBlZC4NCg0KVGhlIGNvbnRyb2xsZXIgZHJpdmVyIGNhbiBlbmQgdGhlIGN1cnJl
bnQgaXNvYyBzdHJlYW0gYW5kIHJlc2NoZWR1bGUgbmV3DQpyZXF1ZXN0cyBmb3IgdGhlIGZ1dHVy
ZSB1ZnJhbWUgc28gdGhhdCB0aGV5IHdvbid0IGJlIGNvbnNpZGVyZWQgInN0YWxlIi4NCg0KQlIs
DQpUaGluaA==
