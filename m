Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B9D47A78C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 11:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhLTKCF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 05:02:05 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:22124 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230251AbhLTKCE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 05:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639994520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K8LBgpKbMiKdPaIKhIXVWJwHg3ksVz9VTxn1ORFVEA0=;
        b=XLLAQHVrHv2QHBR3ITuyclbXGYSdTOuemV8XBYUYCSgYIZ06Q4RGpoIMJHtQ8WMf5hacRb
        bGgrO0NBDJwbqg8WcNr5MOiIPkKCUEr+T60Jf5hVUMx8q0Ixix/dgH5huKLYCYNLCAciJp
        sYc00GomA+gxPoRSXfYT70tJUySzuEg=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-oOQ6_pw9Mm6LqtFi6mUnOg-1; Mon, 20 Dec 2021 11:01:59 +0100
X-MC-Unique: oOQ6_pw9Mm6LqtFi6mUnOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGupmfyEYMVLP3UKPolAsXG9CQcg8OwQrMQ24pOf2YKuNS1CVTYrdDL5pk+6ewNrwCWdqNB0l4qOJSqSpevqQvyqWo+zg/9WLLlMwXOJF532o+iLvdZRCVyvN0oQBIAZtgNTrTqAlt2+YX67C5VGCCqNucpRRuUAvY3Rg9eBSA3j2TvEPRVz/mf12tPyghpbEyJOsgpLNcbGhyS5k0GJeUPNFCV5OjBFW1Ls21xLW751KJ2M/O/lynoCwUOjfGR9K0rIZl/H94lrBfoPAMTfpFat+tSs7NJumaFIdlKu1NkT6wy0EWR3+ozfu+tHYJyDWOjtPsE19kS1m0LVetvRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIFfIsnKDj8ZFhPJ2s3Bmk0UDB3iZMWu+oQnYXuUD9Y=;
 b=O+xsSz/Ido8BremNNNhQCJTA33N19mDESae8tXWusM+JlFFoAV+kFEDGILksOo3I30WsEFIDhN6MQtg0jjhtj1ss+7cJDR0dfEp+Z3Q5ertd4sHXq0HV6LdTSAPcFOmMNSLOeZVb4PI47V+NIqjfEIAuZIbdvXSv48WrAksYSFAu23o2Q5hRm0A0+Oeh4L/c4JkBxLZ6q6mYm6O1ZSpprjxFuy6dZRK+YmVGBH1AwlrHSmGg5eR5qx9DsmV9wkaRKmUfFSoxUjXUhQ6DQw5/p7nbqv9LktxgWc3PbUU2jP091RRxQlyI+737Ul3caCRt0JKkf6Cdgm8Ku3RMshA0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB7PR04MB4540.eurprd04.prod.outlook.com (2603:10a6:5:3b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 10:01:58 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 10:01:58 +0000
Subject: Re:
To:     Ralf Beck <musical_snake@gmx.de>, linux-usb@vger.kernel.org
References: <trinity-09ddec50-a8ca-4663-ba91-4331ab43c9e4-1639982794116@3c-app-gmx-bs07>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <b1001f8a-df10-a3c7-f715-157f5be16fa4@suse.com>
Date:   Mon, 20 Dec 2021 11:01:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <trinity-09ddec50-a8ca-4663-ba91-4331ab43c9e4-1639982794116@3c-app-gmx-bs07>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AS9PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::7) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a72ed1-3965-4c36-3eee-08d9c39fc2b3
X-MS-TrafficTypeDiagnostic: DB7PR04MB4540:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB454044014C3BFFE73E8FC2BFC77B9@DB7PR04MB4540.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qDtr+6YSarXZuNeTtz93djS4TG/vcvpmkNoJPeS8SCIBMD6YrCYkuzwZLbxw2Fo5BxGEPMLQAoODMtIkRznvKvnuJuib8KqdN1BxYJ5YpJDyqUc92HWAJWfTy0jpar1rr2fCxgnB4zErmUHmM4Zxm0pZK+683uHbG1TWgi+s+mo4ocjr9OBwd3QJdH0GsZPfloow/b7y2Tms/3Fp89vYAys3mABpAHGUZikymfxWiMt0awXnjk4u1ROtG6g6yAwrOaQ5JafWo3CcwcEAKKDQOdbjOY4MLThryoorUMcXigUhXyHoW+3fHduBGKeeIDCvmMAA03QFjxWnuN3X63Snp6zmDDoEjXK6mCJLeuf9RrxZySdM7ZEWSPFXSkgEp1E4GW0u70Ys9tI8NZx4yr7c4z2HCS3MnXKfb4r4yXKOYwNNwBbl/AsFnkc8qvTG7TGmz1O55OUF5iZgupVM+2DADSiaVycv2QpJTmq0wNV97vDM09ZJlrXeVPtDjUeEcSLxHi4+0oiTZa6LBEZYhtpC94O5vIPZqVhLxBNGrSCEycHDhqyTPoU5Kt4oT30RCSX+2bg6bpe9GfEVkcqxevh13knrS6Ls9AzXk1g5+DHgUJeeWtBw3X/IkAp2IGH143F2vdEbgvVU0iCo+59Hd7j/RqQ0go3nUPpEc6Aj3BWw3coeD128w2L0hWN6spuUGTu+VAAsuZb8SkcE4qejnMCtF2WIJ/tU6/ns2ScWrlG7yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7116003)(3480700007)(66476007)(66946007)(66556008)(2906002)(31686004)(6506007)(38100700002)(31696002)(6486002)(36756003)(6512007)(8676002)(83380400001)(8936002)(5660300002)(186003)(508600001)(86362001)(316002)(2616005)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jraVnI3SJDA/H4Cio+jTFxknAUKBa3YIipWLuoWVRZDzwpGCoZxdqB16cdMC?=
 =?us-ascii?Q?CMbHOQ/O+hJzA1337HPqaBJhX17wI/n63ymbs4UQKW2qkKVAUirOOx/SAQ31?=
 =?us-ascii?Q?ArU3g5TqkPSDw0gg4R0ib86hmvDRwI2c5BcForeE0TudyxE1ub3SsO2TzFPG?=
 =?us-ascii?Q?0kAMJ7MxMV2FG1cf/mLLxY4rj8TLQkYTAkknRqRuuIYI2uiwR6FXJEopzzH3?=
 =?us-ascii?Q?9KdUJCt98pqjtSoQ09m34OhqNp1Vz3nwQyDoKwh73qvHDyo8olVc4ks4Jiyx?=
 =?us-ascii?Q?ttRxTDHq1xYr4v35aTpEtmxkYibRrI24n5vEMks81qzaS/BSxb78LWLscZ1w?=
 =?us-ascii?Q?D5gSED+R6ZFq+UeP259BAaxcZjiOVNauGIj+/vsKhY50Xr8NXBrJJYEA3Uni?=
 =?us-ascii?Q?6U8sAlhzJ0TgHV4e+tKvS5HcXo+wW7NHorVdf9VxWU75N/EWsphkNA2LmuxQ?=
 =?us-ascii?Q?dH/Z6iuQWctGRCeDx/L6pwC7ehTaJir00lNX5bCuE/r/Vnme+hbyLNWxYXIn?=
 =?us-ascii?Q?rf0A/fg0EJKEBqOFGOxdagWriwgTQ8k4yaZK15ib00FxbFQiIDz1gDEy6IM8?=
 =?us-ascii?Q?KwQ9xYW0lFOJyrPr90ECqaxBFPriCjolKs0Q5qhmGQu77rmLUueJnXevnknJ?=
 =?us-ascii?Q?WFYYuSbCxZ0zK1EsU9SZFXWXCEl7kQTWf7RGV4kbKQ8SK/CIB2ap+8CC+GTy?=
 =?us-ascii?Q?Oy/heB503y8mvvWDwXhSwZ+MrhIfEMTepAp4nl4/S4K3DcGn6qMaJbwGzBRs?=
 =?us-ascii?Q?Z7/c+c561ouof0CzVdHDIEimvYzoZ9pLAG32Cx4p4QwbWBkKpren+x5s/BBx?=
 =?us-ascii?Q?TI3rEakb5iFZvzuk37ge+nx3Vnoq2UpqG1zHImWjCHXHt/+l+Wzh8TUlKPV9?=
 =?us-ascii?Q?Tp9b1Qsg15p8FJBYiUi/zKW0/1qz4B1rTZJtcKjnQkrd1PcnL0UlHTol0dvS?=
 =?us-ascii?Q?PnTwIrf7zgzpKshjcBGSKol6+/3v1v0Mwb7L9YV6zipUbuVTgnQBrO9ZWluF?=
 =?us-ascii?Q?mu/k2UHpP5fBNqqGVoN0wt5qKX2MFXnnKLC5ARrqNzOuO32L5g9UNRlwKHRj?=
 =?us-ascii?Q?+XXCDSiHEpYuFSYr6NMT7h2Kv0dd1T1ZzxVv4JX50dBqt9KIMK+L+q3DoOVH?=
 =?us-ascii?Q?GKU6wrYuUH2GALcuTRGKnbuZ+BIzGXmdTM4dI/4iRzcLEa3dx/tLhn3TR9BS?=
 =?us-ascii?Q?4fjJG216evMEixbP5mBS36bru8QGI82RYYagY/i3OnoiS5f0NrHx0ojp2Nbp?=
 =?us-ascii?Q?UYNQ4n/d01e3EEwGaA33vjxtoMzPvlYoEHxFyhcD52+UQPcYyfisacO+09oA?=
 =?us-ascii?Q?TQkrnnlNz8Jtad9cCyg5xgHONCjaJNkHPnbrJJVUUrNtIUKi1IhfBHU5EfGl?=
 =?us-ascii?Q?rrNQl9/Ngxyv45Wg01/ZJHERdjqBNBvE4Y1I+go4ezv29HPNe4u1LAf/zcmP?=
 =?us-ascii?Q?I/0WuCjaQdZfTzsIcGtMat+dlSNB4s/zxKlkbn552CoEzmjN0m/lo/bBRP8p?=
 =?us-ascii?Q?s9qWskBLsr+ji3C/h3m+0IBLAtJ6KhxblWuScgJsjjyCHQZ2rAjX5VRU85DE?=
 =?us-ascii?Q?z170moP/DkFbXdVRiKR02DLkL+kjfYkDmBjqArfnZoiXs92zHXHRdX4UCZYw?=
 =?us-ascii?Q?mFbeakNpW9BqMErRxIvWzvuVqMQj3xT9q3AoSIC8MXZzqNHwKz4VXGOfM9xN?=
 =?us-ascii?Q?vYWdmtuaG/B+Jnoee1Fp2BApCPg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a72ed1-3965-4c36-3eee-08d9c39fc2b3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 10:01:58.4878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beouJ5el2E5d399PdWR/SdOv36j+lEASwM08bTfdkWbTWzivojiSNZnc/b20DI4ANe+IPisWvVt6tEnz+5AeYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4540
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 20.12.21 07:46, Ralf Beck wrote
> One set with audio class specific interfaces for use by an audi class dri=
ver.
> The other set with vendor specific interfaces for use by the vendor drive=
r.
> Obviously the class specific interfaces and vendor specific interfaces ar=
e not intended to be use by a driver simultaniously.
Such devices are buggy. We usually define quirks for such devices.
> There must be another solution to deal with this. It is unacceptable to r=
equest a user of these devices to have to disablethe duplicate endpoint che=
ck and recompile the kernel on every update in order to be able to use thei=
r devices in vendor mode.
I suggest you write a patch to introduce a quirk that disables one of the
interfaces and disregards disabled interfaces for purposes of the check.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

PS: Please use a subject line when you post.

