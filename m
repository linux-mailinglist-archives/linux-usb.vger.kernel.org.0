Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A056C477D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 11:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjCVKWe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 06:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjCVKWd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 06:22:33 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70D25C9F7
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 03:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqVluA93L2p00abdEYra8ZjaRoY5I6HojbkbCgnj4buvTANUiO5iVERbVVf/hqt4FiXaiMjfg7CybeUETbCBphHKpS8Znv+RS5/jO9iZRqsEQc7ZS4oQN+ZTXmE+Lv3OpV8mABZ2eQEKoBBVi/mEqjMjdfsjaNJpBihyMsvEDQ4TatptwLst6kDBTjVwNGG9ZDfQIXaLYC4hwyOveMbOS4/RAkT7KGMdYKM5SoKaF0XU1mPWwQV8RXAY5nssR1ZXIa4w3yEgEL9A7QJe8gJerqOFSemvJ/p4CXWYJmGHPXhNqiZ8RP9cvx2lQM2CnmyhLCHLEU3sI0a79jxTd+5HAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE7YSUJf+336/OluobsIT7fyr9Xpybn6gLReA5+boxA=;
 b=SKXsk0nT3aNmKREfxn+xAFW2F5J9vdRGOh2/AmMCyp1wgAeoO1GfZAa9OTRCuqdtz3P/kSZWs737qRoR/0UBdAZ6wiPPzzlo/6bA6AG2N85+R7Jv/2eP3qKyX8+rw6GSuyELkvH1ssijEWx3i3M4+myjPLRZw/dgXBR98Gc4Eio8B/+RqJmgwDbs+Scvxhp9yth3TTneI2IDQt6UJ7rIHkXbKbdlsVkjWXZaaAh+Fv7mWDcRBKrACx0Uf3fIQBVLSiEqnbUYAf/W5yKkxMIZk+Q3D8kk+ydtxzj8XvvRZjyGfmOQwwWMyh59VgvWDZw+SHbU6Mz0NflApWK+3N2pdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE7YSUJf+336/OluobsIT7fyr9Xpybn6gLReA5+boxA=;
 b=GVnuF6+Iu3/XnHdwonsOrdDTY/LsrU+rFnyTKQJUigBu/5mu9RHJ3WV3TM26drbw/Udb2Re0WZH4kmbSpdFvI2dA/jjq7Dx3gLkhmqPuhRyuaEPYZSoJJQW5D4j4qrdSpwF2++aoy7vnVC+xXA7/9J2BB5g1comRk57f77b2UJi/vj4iCuE8C6n3kM474TklXOxEVT2cdyE83Sa4h0wVFsGpKcPRR5YOZATItfDV9EbQb8OYgtMsKfAFAv3TQoP99chIubOK2epsxupMyZCVks09yA+EVxm+QWuc8+Osv6eOf6/xHWVJIP5HJ1sSu+fXAX/m2bF5WTdQjEyas4CBJw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DS0PR10MB7479.namprd10.prod.outlook.com (2603:10b6:8:164::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 10:22:29 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 10:22:28 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "greg@kroah.com" <greg@kroah.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: usb tree branch usb-linus merge plan ?
Thread-Topic: usb tree branch usb-linus merge plan ?
Thread-Index: AQHZXKg0f6oFrouED0immaY74o4umQ==
Date:   Wed, 22 Mar 2023 10:22:28 +0000
Message-ID: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DS0PR10MB7479:EE_
x-ms-office365-filtering-correlation-id: 97c8f10c-5c25-4cd8-5041-08db2abf56ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1hZY0g6njoOz93nehK8rQf5iE1Al0EfPrVbpX51OtVGX04fUKxFy2rS4MdikMxXYmBsLdzlzPedV+Q/mwXUnvR7DM7fZvs1zOtCv861P9PQ6wZ87XTpnW+zLvXo4HlltPAVAQCiDFHdIBiS3Bi7Wt0ZVWayEcwPICcvD1+9JTTGlaYAoj5SxUbvweLjrF5dXxYKTCFhGPZB4RudEsmBcO3pWQW8z2GjF0id9XAYL+KiKuVD3G9WQQI/HOdXa9HRGN+1M03T7N4gQxTRoJu6of7Q0Hl6yrlCeAtheh0y5SNAK2RAoVvVBTnChxM6CZ7566V43xq5EsfCW0HzB93g26Y+QbcZ+jW5wI5fzaLG/pqK3rBQPLj7OeJaRCr8d6VSoww6mubvUG4DwThBy6eGFZj+K0Ddh8KUwRtX2EpFPtWFfu1pdH+/rF04WT/g4LByPHkJ4OBxt7DRCrn10y7Oe7KckRT/BF+wx6usKo/OQZ/PHoI9F4NGg6Nkv4l1l6zydBl1jZI9NQWNTdHcppgosotezZ+89zOt8bBRiTSj5Q1jzAq1UgJFx0oqkhUDGin8L+KsdQgcRDZpplhwwAUlSi8XRru2qVdXB+a75F/BS2KIB8t+RbDdNWm0vklZjFvA71UBg19BQQ3vw4V9cf4QE1ZjFApx3Mn6Kdui20Esx5AVJWhgEsww/RvMV9Jq3jaRH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199018)(71200400001)(558084003)(2616005)(316002)(6506007)(6512007)(6486002)(966005)(5660300002)(478600001)(186003)(38100700002)(110136005)(38070700005)(86362001)(66556008)(91956017)(2906002)(76116006)(122000001)(66946007)(66476007)(36756003)(64756008)(8676002)(8936002)(66446008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0VwdDA5Z3lSMUpOS1Z6c1BkbkJIOHNBdkJIbklHVHo0WjcwcWc2dHhrdmxs?=
 =?utf-8?B?SzM4a3hQVTVWTjBNdCtVYTdqWHZ3aUM1UE5LNCs3UmxxSWo0ZHJRcFlxekJj?=
 =?utf-8?B?eUVoakdFdWpBNjlURzBGSjY2SXkwUEhmaG5OSXRHVytweTdXdmpwNFdGblpm?=
 =?utf-8?B?VTNmK2s5SE4zUjZ1WnFiQzlxYWcxMHdITG1mWHc3S3RMMHlja2xLNjBoV2dM?=
 =?utf-8?B?cEpJaGlBZElWOFo2N3RJZEMvU3E2SmVWSjUrR0tiK0Q1WWdvUlNYTVVGVVFi?=
 =?utf-8?B?dGZqeFdvaHJWZlRla25UbFp4WWxjRnNIVFJLbGl6U051Q3F4bHZIRGJMUk5D?=
 =?utf-8?B?UGwxVmZ3WDRIbEx0Tk9CTnJ1LzZHVEVQa3lCQS9EeGY0ejhIcG1xRElLaWNL?=
 =?utf-8?B?NXE0a2p1UmZFYVpMbDBMZVhHU3JUeGZwZmhsblB6c2pxN1FHY0F3K3NPVTM4?=
 =?utf-8?B?ZUx6YnZKczQxWG53Y3lsajlPb1h3d0UwbkVLSlBLcDJjM0dYUVB6S2h4WWp6?=
 =?utf-8?B?UXdqVjdEVG01SDhnY3R0R0RDRWNkdWNoVkVQNTRTakRneW9wOW9DU1ROQ0NL?=
 =?utf-8?B?c2tsSVBBTzNQOGU4MjZET1pGTVBQSmxuUlNRcS9ZK2E1ZDlKcTdnVEV4bElQ?=
 =?utf-8?B?cUdwWHFVckNpTkdSaHE5MVZ2aFhVK2xsbTl1Z1V0SC90ZnFvR3kzaXdPck5l?=
 =?utf-8?B?VlFUOU1CTXh5UDdsTlB3Wko5WGxaRU8zS2VjMFBpNGJDUUYrd0ZMUG1iY0U3?=
 =?utf-8?B?MEllUGE2bjdXWE9lK3VXRjZrNTN5d2FvRHA1bXF5NmZ4Z014OVlYelMrVEVX?=
 =?utf-8?B?bFJvQTRvdzRFZzdMR05oaDBTaVBLWkRxYUQ1TThMbnpnS1FSNmRCM1VDVDJa?=
 =?utf-8?B?WkczWHpESVZoYnpzUlhmcTZaT3R5N3FjUTJVamdtampMUEpHb2hhOHZVMFll?=
 =?utf-8?B?QU12ZUhuc2NQaENvNUFJODhMMG1Nb2xybEhhY0MzZ2xTQnM0OExQbHBPdmFB?=
 =?utf-8?B?Qkt3R0xLSHl6Z20rNzRTdzBlNG8xL25EZElQQkNXS3h6NWlNZ3VkWGpRUGlD?=
 =?utf-8?B?SzB6aytCZ2tZNXR4Mit2TG9FeSs3MVZFS1R5bGlRNklOb2laM00yb1doT2FK?=
 =?utf-8?B?bU94S2tjZHNkQVpoYmV4TVk0SStSZ3B1aVBHNVVxTEI2OEpES1dlSEdNVVdP?=
 =?utf-8?B?SWc1dVZSbFAvTW1KZFpjY1NuV2RUUUR6NUVtRmsrMjV2Y0hLSGNhTVRWdkR3?=
 =?utf-8?B?aENkdWpLUVZ4dGpnQTVrSFdBdzhvSFhqM3FjTFR2eTdDRjFpc05HK2ZHamRD?=
 =?utf-8?B?a0hveXowZXpCM3ViaThrWlVuSjEvajJCQ3h1YnVCREloNXJDOGYyZDZDQlBM?=
 =?utf-8?B?NXJhNnhZVWpzM1ZuZ1o1aGxPYVg5MzhjOHBZeisrTGVENENlK2xmMTVoeWh3?=
 =?utf-8?B?czVXSDhrVitJcGQwMjNtYk55YVkrMzhGcEJxZDVLRDFRNWxWNUE2WGk2T0Ju?=
 =?utf-8?B?Rk9CMDNPNkxiK203dDFuS0g4MUQ3dDFJZTFpbGs4MElXS3pOK1E3OS9IN0Zu?=
 =?utf-8?B?Tm9sNmlxRS8zVHhIWE54VFNvVVJVdjd3aWROdkdydEZkd3ZtVGlYMjhFQlo1?=
 =?utf-8?B?SWtwTngrQkl4V2JNUVNaYlV0UVB3TUVyT1RtaC81b1k5SlhMNnl3a2VFMG00?=
 =?utf-8?B?c3N6empQblpnSlhMd2RoL3Q0RS9KTjJPYkxwa1hvQm9yelJkQ2JLcCthcWNF?=
 =?utf-8?B?SEd4d3ZpRDhkL3crUHJQSFk2MXMxN05TSkhPd1ByQzRVOHVNOFhoRGdJUTcw?=
 =?utf-8?B?OHJzSGo4SjdtcnFlblBESnRDNS9ZV0srOWhYK1ZRMDZ5dkRjdG9KY2YyYm1M?=
 =?utf-8?B?RWt0VXk1a3hBM2RBaVdGUmszOXZTejZwRlZudDdnM3F2YmJiRDN2bHE3RkU3?=
 =?utf-8?B?Q29rdXU0VzlkUVJxQlpUbzVGQzBObHZvdE1FZXVpclkza0k3czU2QUNLdGNh?=
 =?utf-8?B?dEVxL0lnZHo4VnAwTmZRSEsrNnNySTRHNzM5NExQL3VBdWNHSzNRS2ZPSTJs?=
 =?utf-8?B?c0NpaWNNdklYSWFTb1VvbHJubnVLWXdBOUxkWTQyUzh3S1JTQzhCMit2WnND?=
 =?utf-8?B?enNpZ3h1QUM5UlR4RUc2UklmMDYvN3F1TEh5U25KOXZKQ1JCTWJ5L2hraFZU?=
 =?utf-8?Q?QHRvEqBmgqFuw1+TWbqvciPscEFLaGy6R46Ezyv/ywqx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <523FA929AEB77E42888E2EF63AA2DB8C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c8f10c-5c25-4cd8-5041-08db2abf56ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 10:22:28.8010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRRRm9yzW1+AIeBpFy/C7ZnBCiXDuQh7o9r8iAxrA4RjfjrTz+TtFDjrwfn0FhiQJmej/9YIy997YWH+3IXzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7479
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SW4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2to
L3VzYi5naXQvbG9nLz9oPXVzYi1saW51cyB0aGVyZSBVQ1NJIGZpeGVzIHRoYXQNCnByZXZlbnQg
T09QUyBpbiBzdGFibGUgTGludXguDQoNCkkgZG9uJ3Qgc2VlIGFueSBvZiB0aGVtIGluIExpbnVz
IHRyZWUgYW5kIHdvbmRlciBpZiB0aGVzZSBhcmUgcGxhbm5lZCBmb3IgbGF0ZXI/DQoNCiBKb2Nr
ZQ0KDQo=
