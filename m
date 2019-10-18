Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5819CDBCC1
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 07:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390975AbfJRFOt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 01:14:49 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:13074 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727606AbfJRFOt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 01:14:49 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9I3iJbG021364;
        Thu, 17 Oct 2019 20:45:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=LJoY2+XmZjbZ99duS4omd2ij6NvlkpBYbWV8mn0nQtw=;
 b=PBgR4zrU8XKNJsi/8oqPmL3UGSFXOK+OumFB2HH9J7Ac6NMNCQCestA6mOzNOjf5ZjAm
 r+Zhg9S49ua4c+wKKU4Zm/ugWR7WKRVvvBoZp02EaSB0GyP1sK4howE07niGFQlpZTFA
 RwUx0pbJx8ddHz4Llbaggd1dVipcX3stWzcy9rdrPRtoL1Dm0kRLHCSw/CTABW4ymEQe
 mhHVJ2G7TjSlrnt6C7dg0HyTUv1cY2QPblzinH1c+nWwFXVUSDFGJT8XBEi4Q/KWQIF/
 8R2X5PE+3/ukmgB1YMJWQ9BmXA7qwNLsuV5oDu+2ODtSzDcbBuPoJXkTUnNNcIyJJ9rA hw== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com (mail-dm3nam03lp2056.outbound.protection.outlook.com [104.47.41.56])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2vkadyptbm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Oct 2019 20:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMXPHSWbiV4IAFui+nHZ93TAwEHHSn4xZqUC0yhX1bg+3vY5CnX3RgM2eJjKcz9g0h8V8NdfsfXagJPl7GdL369pqWlPXtIPZQ+57AWmmrhmYjAHgR6dkytgwIkbzfy1q+TtRPc2VqWo1tWIbQPAR0FLRqZAjphnt8l82MStojBKynhMT+plG/R1hzVHS9Y6khY/gXsB0OiT2MKItbPrm3yIyWm4Vc7oDL672CF3oRxyvdwRhfWcX07JFfbOl+RabaIL43AZ+LHczuotoACQEJC1qudb08Mj5Wjg+maDy9D7L5g+wGNcp/yX9tgQds5qjRivqnbbOKLCo84BQptx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJoY2+XmZjbZ99duS4omd2ij6NvlkpBYbWV8mn0nQtw=;
 b=oFEFslrm565eCiBb1aOfrTYuEnnO9MneQKrxfRUgVfbOryiwyX3hyZlR2xsgvCb+pTOXpbndXAxsdZtRTm3JXLvJfYTXtiDgyd3GfoFnf0eqWeFdZnm4qOr10X12eE86UmSVkXEEqlj91NV8B99bGvLzCl3Ts3GbCcduw1Ovrzzcq+7gPD6EYTH3sbiUiVh3+s670d5VBUdLzZZmQ6IiF8DY6yy89zAXk++QQBvD9nbeBywGowD5agWfBATNfqNpNSnQy16GysvvX/1BrQ52tUVUJRuAmYu4w+1ciIIz7Z/1SZXU8Y0MaAoXi8urzhrlHwE2PuJ+K7MyOHY0tMIIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJoY2+XmZjbZ99duS4omd2ij6NvlkpBYbWV8mn0nQtw=;
 b=e3ChQM4+wdH/7YR4xFUfkNUs+sVxikgH8787rdKLabXzENvwvZ4Z4OnMRp0V4yFD44NR9dJ4/6qyZVwLxjsU/YzxBgJgOYefDqy7wbjhrM/FhmLERiAchrPsmf8vaKivMCzOb9WG5Cc2sURRf0CBvdoKqX+Re0nKhUvs7wYny6s=
Received: from BYAPR07MB4709.namprd07.prod.outlook.com (52.135.204.159) by
 BYAPR07MB5880.namprd07.prod.outlook.com (20.179.91.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 03:45:14 +0000
Received: from BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::8dae:bee9:340a:b770]) by BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::8dae:bee9:340a:b770%6]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 03:45:13 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        "linux-kernel@lists.codethink.co.uk" 
        <linux-kernel@lists.codethink.co.uk>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: cdns3: include host-export,h for cdns3_host_init
Thread-Topic: [PATCH] usb: cdns3: include host-export,h for cdns3_host_init
Thread-Index: AQHVhOil1G1yVVv1uUOM6DPOXlftnqdfv0Vw
Date:   Fri, 18 Oct 2019 03:45:13 +0000
Message-ID: <BYAPR07MB47099123D3A6BD193491FD34DD6C0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <20191017124427.17055-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191017124427.17055-1-ben.dooks@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-tag-bcast: {3DE89042-74AB-4755-9D53-B536026EFFC6};
 {51BD6E37-66BD-4186-8AFE-835F952BA4E6};
 {F0B656D1-F768-43A1-A424-45742A6E25CF}
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctYWU5MTAzYTQtZjE1OS0xMWU5LTg3NGItYTQ0Y2M4?=
 =?us-ascii?Q?YzMwYmQ0XGFtZS10ZXN0XGFlOTEwM2E1LWYxNTktMTFlOS04NzRiLWE0NGNj?=
 =?us-ascii?Q?OGMzMGJkNGJvZHkudHh0IiBzej0iMjE0MCIgdD0iMTMyMTU4NDM5MTA1MDIx?=
 =?us-ascii?Q?OTYwIiBoPSJCTjNkVHU0OGwxUVV3RG52VWUyNDZPODBSaVk9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFNQUtBQUFk?=
 =?us-ascii?Q?bUE4eFhValZBWXl2STI1UXRPa1JoME1jVFhBZCs2UU9BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQndDQUFDa0NBQUFjQUFBQUt3QkFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFEQUFBQSs1UWJnUUFBQUFBQUFBQUFBQUFBQUt3QkFBQUFBQUFBZ0FB?=
 =?us-ascii?Q?QUFBWUFBQUFCQUFBQU4wOUREVVJ4ZDAyMmVGVkRaRHZVNVFFQUFBQ1lzRHFO?=
 =?us-ascii?Q?NDFlNlFhNWdWME1tVUFNckFRQUFBQmxPbmwrMjVOaER0ZEkvZEJSWGUyd0JB?=
 =?us-ascii?Q?QUFBYkdSUmk2SUN0MG1iRjJwM1k2cXBkQUVBQUFCMUJIbWswY0lrUzdoaEc5?=
 =?us-ascii?Q?NkVwRXFHQUFBQUFGSGY3amhHQkJKQ3UvSHhHUU56UUtDQUFBQUFCZ0FBQUFF?=
 =?us-ascii?Q?QUFBQ3kzQmN3TkRidFM1YmpybkMybDdoS0FRQUFBRVI2dEdWOVlRWkpqb214?=
 =?us-ascii?Q?eS9kdkpiSUJBQUFBOTdIUUVyLytja0N2ZmJNVDAzOVlEQUVBQUFDNjg3TE90?=
 =?us-ascii?Q?d2E0VHBnNlpWazM4L2Q3QVFBQUFEd0o5bStMNW1aRXZob0xFc2krNG9vQUFB?=
 =?us-ascii?Q?QUFtWllCVllCVjZrYXhjaithYUxvTmRhUUFBQUFEQUFBQVFBQUFBQUVBQUFC?=
 =?us-ascii?Q?akFHUUFiZ0JmQUhNQWJ3QjFBSElBWXdCbEFHTUFid0JrQUdVQVh3QmpBRzhB?=
 =?us-ascii?Q?YmdCbUFHa0FaQUJsQUc0QWRBQnBBR0VBYkFBQUFESUFBQUFCQUFBQVl3QmhB?=
 =?us-ascii?Q?R1FBWlFCdUFHTUFaUUJmQUdNQWJ3QnVBR1lBYVFCa0FHVUFiZ0IwQUdrQVlR?=
 =?us-ascii?Q?QnNBQUFBS2dBQUFBQUFBQUJqQUdRQWJnQWdBSE1BYndCMUFISUFZd0JsQUNB?=
 =?us-ascii?Q?QVl3QnZBR1FBWlFCekFBQUFuZ0FBQUdNQVlRQmtBR1VBYmdCakFHVUFYd0Jq?=
 =?us-ascii?Q?QUc4QWJnQm1BR2tBWkFCbEFHNEFkQUJwQUdFQWJBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFZd0JoQUdRQVpRQnVBR01BWlFCZkFHUUFaUUJ6QUdrQVp3QnVB?=
 =?us-ascii?Q?RjhBY3dCNUFITUFkQUJsQUcwQWN3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFC?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCakFHRUFa?=
 =?us-ascii?Q?QUJsQUc0QVl3QmxBRjhBY0FCeUFHOEFaQUIxQUdNQWRBQnpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BYndCMUFISUFZd0JsQUdNQWJ3?=
 =?us-ascii?Q?QmtBR1VBWHdCaEFITUFiUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQWN3QnZBSFVBY2dCakFHVUFZd0J2QUdRQVpRQmZBR01BYndC?=
 =?us-ascii?Q?aUFHOEFiQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6QUc4?=
 =?us-ascii?Q?QWRRQnlBR01BWlFCakFHOEFaQUJsQUY4QVl3QndBSEFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFJQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFid0IxQUhJQVl3QmxBR01B?=
 =?us-ascii?Q?YndCa0FHVUFYd0JqQUhNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBY3dCdkFIVUFjZ0JqQUdVQVl3QnZBR1FBWlFCZkFHVUFk?=
 =?us-ascii?Q?UUJ3QUdnQWJ3QnlBR2tBWVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnpB?=
 =?us-ascii?Q?RzhBZFFCeUFHTUFaUUJqQUc4QVpBQmxBRjhBWmdCdkFISUFkQUJ5QUdFQWJn?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhNQWJ3QjFBSElBWXdCbEFH?=
 =?us-ascii?Q?TUFid0JrQUdVQVh3QnFBR0VBZGdCaEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFjd0J2QUhVQWNnQmpBR1VBWXdCdkFHUUFaUUJmQUhB?=
 =?us-ascii?Q?QWVRQjBBR2dBYndCdUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHOEFkUUJ5QUdNQVpRQmpBRzhBWkFCbEFGOEFjZ0IxQUdJQWVRQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BYndCMUFISUFZd0Js?=
 =?us-ascii?Q?QUdNQWJ3QmtBR1VBWHdCekFIUUFiQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWN3QnZBSFVBY2dCakFHVUFZd0J2QUdRQVpRQmZB?=
 =?us-ascii?Q?SFlBWWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0i?=
 =?us-ascii?Q?Lz48L21ldGE+?=
x-dg-paste: 
x-dg-rorf: true
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bc83e85-ce07-4a7f-5477-08d7537d952b
x-ms-traffictypediagnostic: BYAPR07MB5880:
x-microsoft-antispam-prvs: <BYAPR07MB58806FAE75C18C94C55FC5FADD6C0@BYAPR07MB5880.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(36092001)(199004)(189003)(476003)(6116002)(3846002)(52536014)(81156014)(81166006)(11346002)(446003)(8676002)(8936002)(7736002)(2906002)(305945005)(74316002)(2501003)(5660300002)(486006)(316002)(110136005)(9686003)(6246003)(4326008)(55016002)(25786009)(54906003)(6436002)(229853002)(99286004)(33656002)(7696005)(26005)(478600001)(102836004)(76176011)(6506007)(86362001)(186003)(14454004)(66066001)(66946007)(76116006)(14444005)(256004)(66556008)(66476007)(64756008)(66446008)(71190400001)(71200400001)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB5880;H:BYAPR07MB4709.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BexY+BK92UBXifccpzQ/Cdps81DvQz0k/W8S01Y/3esoiKFSQh/mH4ufEFUFFFNqL5iNTPMNMYIw/4LMDHUMkJgQrxTtg6B/En9tE34Nchmg5vFoAm3nZ4dXjI2Pu2dDQ0UJuZYeAtMvx1Jphq0DzzfOhIbv9OxFERRGcXUAKbB2MwlKquC4+jSdez+Xm64adCYEgd2ziWndW+fDjUQYSBeRTbUh0DObprAiFtUvTrZANzRB+hFPMiSI0ciqNU2vK0nf6sq2wE1DpNIPbWzcQISgrPHPhVNhLVLjc3FV1jTv1eHOjxcDZZhTcxU7fT0IOgry75rLlVpH2f1D66C64zhpXLvtmC5CRvXC1jNoyQPhm7LczmPWR2Q3V14FRnrCY7s7IEUvME6aQX9e3D+8T+WCW/Y/7P2HdMf2krbG87U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc83e85-ce07-4a7f-5477-08d7537d952b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 03:45:13.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FSujvEfWNjGaEOpt4be35hPP9Xer+fTdl5QLN5X6qxCSknYqeRMTYtEcSrlup9zGCiuHo2E3plx7Cgeea9jaIEwpifYlHV06YcxG1bP06u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5880
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-18_01:2019-10-17,2019-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910180035
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

>The cdns3_host_init() function is declared in host-export.h
>but host.c does not include it. Add the include to have
>the declaration present (and remove the declaration of
>cdns3_host_exit which is now static).
>
>Fixes the following sparse warning:
>
>drivers/usb/cdns3/host.c:58:5: warning: symbol 'cdns3_host_init' was not d=
eclared. Should it be static?

It should not be static. It can be called from core.c file.
It will be static only if CONFIG_USB_CDNS3_HOST will not be defined and in
this case function will be declared in host-export.h  as static.=20

For me It doesn't look like driver issue.=20

>
>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>---
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Pawel Laszczak <pawell@cadence.com>
>Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
>Cc: "Ben Dooks
>Cc: linux-usb@vger.kernel.org
>---
> drivers/usb/cdns3/host-export.h | 1 -
> drivers/usb/cdns3/host.c        | 1 +
> 2 files changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-expo=
rt.h
>index b498a170b7e8..ae11810f8826 100644
>--- a/drivers/usb/cdns3/host-export.h
>+++ b/drivers/usb/cdns3/host-export.h
>@@ -12,7 +12,6 @@
> #ifdef CONFIG_USB_CDNS3_HOST
>
> int cdns3_host_init(struct cdns3 *cdns);
>-void cdns3_host_exit(struct cdns3 *cdns);

We can't remove this function. It is invoked from core.c file.=20
If you remove it from host-export.h then it will not be visible there.=20

>
> #else
>
>diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
>index 2733a8f71fcd..ad788bf3fe4f 100644
>--- a/drivers/usb/cdns3/host.c
>+++ b/drivers/usb/cdns3/host.c
>@@ -12,6 +12,7 @@
> #include <linux/platform_device.h>
> #include "core.h"
> #include "drd.h"
>+#include "host-export.h"

Why host must include this file. This function is implemented
In host.c and is used only in  core.c file .=20

>
> static int __cdns3_host_init(struct cdns3 *cdns)
> {
>--
>2.23.0


Regards,
Pawell

