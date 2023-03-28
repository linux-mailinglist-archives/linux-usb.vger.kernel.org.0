Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F836CC93B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 19:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjC1RZ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 13:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjC1RZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 13:25:25 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533E82D5B
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 10:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IolFvx6Y89NwmpnOZVkNg3x9dN7ATboft6neLnJSdwjK1Btk1DIpz0PLu2oIA5NFMQ1nniHcg00wjVNH9sJ0lsAzXYZLfi0J7Ebla4Aspqj2PWb52IPmieo+jbmlnDGY+jo21Crs4jokRZXmZ3FOwwGiwwAV2+gzSJdzr7iwx1bj5D2SIxPZQ0H/w0M6UNAR+kdo5tK8r+4qX+4DtDetFN0prdqO5HPFdL+/mqL471SJ2njQCIws6dIuZp8WOaNhEBVW4io0kSNkDZFTocSkd8DaCgxJ4mFejYEmFrqIP8cDkcF9OXOyLm7woomJMxcYST6EqMZ+VQ3Kqv2T0GxZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYazL4QDWmNmH/YNDLqMlpw2GdVTXz4kx72N1AtgzPc=;
 b=GEMAcYqvMkJNRS9u5VkGJpRyp5d4uFpcOJGa+GH0a/5DZ2LjKZRQQAy6rSPl3a6ZBsO6pxDS0IhBWgHDYrOATjY6ddOCXLZ+32CTc6pxXl04R8/nkznVPh4zP4g713AQ4NdTiCcvGzagznbhIUzgb6e/8mucurrzg3GFLnbVsCKGF7WZ4cZPQjla8hFCAu+Y/rmc7lycB5aRxUjrNt57Zr6OVa7mpkl3e7dyZHIRG7ag3ah9ULAbxyCP9HIP3+2LicbhMmlbadRUz9l/B8bpPUWAcG8xpGg5KrE8bUzZ9dwuHDE31pi/YAPAIX9in/Ox5YCMSyRnxR3/vifqC/Ev9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYazL4QDWmNmH/YNDLqMlpw2GdVTXz4kx72N1AtgzPc=;
 b=fhPaCVrMBcqGK6qZivNOETYQzT0iM0QzSnGKLvs0TUZocWFkwI7VQVPc6A8iZbn7b3jvU3Y5aBz5WG/2z/KU19XH6rWlyURtBj7+gf0LBxshBOZdY4DHv6qPmlcZ3hmId5FtQvnZLQ7wwtXIcznHz8EEZ01id+XOYt2g7zhqD4ktvBjb3Tmuj1jEsdanuexetdre0gLvBqbYtGkMhV9oRUqHT4N/azGJwWp9dabZnkODcjKRUNeNOmzAT5DYYRDUmhBAUK/LdvE0pL4NLmPPVumazr3VGxEfwo+yEa3tDMkmrwm+1Rq+BZ8uwfufisUgLuMX2dXUVJmYipZr0M1htg==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH0PR10MB5082.namprd10.prod.outlook.com (2603:10b6:610:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 17:25:20 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 17:25:20 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb tree branch usb-linus merge plan ?
Thread-Topic: usb tree branch usb-linus merge plan ?
Thread-Index: AQHZXKg0f6oFrouED0immaY74o4uma8GrYOAgAAlGICACaiVAA==
Date:   Tue, 28 Mar 2023 17:25:20 +0000
Message-ID: <a61062edbd266f6c8a260fd30886a97242133ea0.camel@infinera.com>
References: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
         <ZBrps8reH2AYqZoJ@kroah.com>
         <7e2d175b1e018d116bff9087c364d7fc398338c2.camel@infinera.com>
In-Reply-To: <7e2d175b1e018d116bff9087c364d7fc398338c2.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH0PR10MB5082:EE_
x-ms-office365-filtering-correlation-id: a23ad775-2dc2-486b-305c-08db2fb16820
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZOdsOXOAg9x1fCFwRe6pQn6LViwGyU812l/wezB04d0QHoNziuoH6DRWpFWeY9r5iHVpvX34Glm2taIESHyz+qyLQb3PL9tXVDnGA5Cb6ptRqzKGDT2ICJPMdMGil7smbPJHsNoPDJ2J4GRnt4/vp7bfW+G5jXtjZXbnlOoPwMzA/efNjPRYYKYNUjQJYwFZ4qJ9RNmrwaqLi5J1ukdNpQATuOGLjTrGgpJWt81Zq69Lf8wOjCyjOcZvMIsRif2v0bCx6CmlK8lVucbYLzEBSwaTy0OAXYLmW0BuMsQFSqsk9sQIAsl2ZL/QETE+2Y8/EwEnE7JwQWhWEPaJuFQvW/uRMkTRyLvaVGTTWB08l+sOabU7k6H/KO4BYC5uPUdUFohAcFTxqHoZ8OqNaaF1kMXzWOI9FxDXzaM60DJO25cLg0qDK4UWiT6NoHC/Di3heU2Ya3Susa5tFc8Gz/QfemqtG3p+jK7653Pv7TgJp02IkULqu+Yt3e4jwkkjGgxyP15LowjnLeawIKHaGlAIca/wYDuYqccz59cPJ6zShId6ZL3yqBQkTNVOyZN/uzVcGZX9HUA1Zd9+to0FvNBEZzcs/O5WkTQAb4k/t9JzHuk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(966005)(6486002)(478600001)(8936002)(2616005)(45080400002)(6512007)(6506007)(316002)(71200400001)(64756008)(66446008)(66476007)(91956017)(66946007)(6916009)(8676002)(4326008)(186003)(76116006)(66556008)(41300700001)(122000001)(5660300002)(2906002)(36756003)(38070700005)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGxkbTJiWDhGMENmazJ2Tndmb1FmVmM2T3R0cFdDaHNaVTIwOCtKWlZ2emF1?=
 =?utf-8?B?ME9zbmdzRk5oRWpCenlqbitFR1hvSkpzZVFpK3ZtTCszVzNsajJydmpGTkF5?=
 =?utf-8?B?UHd4WmNzWkNXYVdPeEJNK3g0Qnhrdjd1cWVtcVJVL0VneE5oZEVzK253a3JP?=
 =?utf-8?B?OXFWTXdNLzB3SU00SlVTZ2dDYlFiMHVnZCszb2ZtUEZYeFpjMTRYR2lRNXZU?=
 =?utf-8?B?Z3VuYzZhTHZCKzQrT1NhcTdnR0VnVnBONW1SL1NHVjFBOEFpOHJ3ajdLSFRZ?=
 =?utf-8?B?KzZXYlpSTG1HbUc1RkRoUTFNeG1XblV1U2Joc2tXeVVhTnpQS284c2NOTjRz?=
 =?utf-8?B?cnl2VmJEWHpWdTBKazBsS1YrdGRlK1pQVEd1d3ltNHV1Q3VCTzRuVFd2UURy?=
 =?utf-8?B?eG5zQ0J1czNkQWpKeTJxYTh1U3F1cjZRT2tWME1TaFppOEh4dG1JbUVEbUdh?=
 =?utf-8?B?U2VTR2JxTmRXVkFJVGFtaE5qbGJVcUI1dXB0N3JiVkh0MUhqVEZpTDNVMVRq?=
 =?utf-8?B?Z3luTlk4T09EUFJnZnlCLy9hQXJLaFpyK0NvT1AxY216RXZWbTJXa2JWWUtQ?=
 =?utf-8?B?aWRGcDh3RlZUUnd3MjkxRCtTWEw0aUhjTDZsMGZUYnFwZDh3RjNSWDJzY2t2?=
 =?utf-8?B?VnNpWmhzQW9QcUV3OXM0UW1ScDFVdVlZWkxlYy8walNranZjTGpEelJPNnda?=
 =?utf-8?B?RTFZNlBkZEZBL2dYQjdOVmQyUlhpOFFQN1N0QmtaMENIZmxKSFZzWkpkV2xp?=
 =?utf-8?B?Z1ZESDV1aXRDb3EwQnBFRlk2WHQvUFJ1cDZERTF0VjBwTUdER3lmOW5MNlBQ?=
 =?utf-8?B?anF3WXFqSjZMcldKM3gyaVpRM2lxWnQrRDNlSXlwNHJUOEN0dll2b2t5MUVa?=
 =?utf-8?B?RytzTWVHQldlTjNodG94dnFkVE55aWFCWXgrb3AvR0Fxa3FaNlgxVzFHWitM?=
 =?utf-8?B?KzcvVW9YemdJcWMzU3hlbzVGRTIvMG9iMjFyNW1vMENWa1lOZjdFajBBQWVy?=
 =?utf-8?B?QUhHYjc2QzFjdE1wSlI1T2prSGdoV1U1cXV5SDJEaFRnVGtRV3I2bkNFMm95?=
 =?utf-8?B?WlNqczdsdlp6KzBiay9tYVBxTnhMQ2xZQUFsRkpVb3BYdExVeWptb0UycjNR?=
 =?utf-8?B?WG1RVlhuQ2lzcWU4dmxBUTFpTlNYQlRlekNLd0gralR2WGtxYnFSbnBWekxE?=
 =?utf-8?B?WmxEYXlNUm83aXlDTWZMbVNtbzVWbVEyRHVxQXlWQVltU0JTQk56QkRMZlJL?=
 =?utf-8?B?Wmk1c2Y1cmp5c1RYZXQ5QnV1dDNWckwyalJOc0JjZmN2bFZlVkZHZkhyaC9x?=
 =?utf-8?B?RjJ2NVZvUlN5UENJdnU3ZUhsMXNrZXNyRVVZREFIK2hJTjRFOTkvM0E2Y085?=
 =?utf-8?B?bEVaWDdlS3lxM0ZTQVRsZHhsdUs4ZmloL2VBbmRlc0xoRUY2SkQwTG9EOCsr?=
 =?utf-8?B?Qkh2MElKN0swYXJTd3ExZmJ2Nm1uRDBGV2VlR200ZDhWUTQzamR6ekVnWGNN?=
 =?utf-8?B?MURIWjJHUURjZElPTlVxZXpDZ20veEZycFloa1ZaUGROUXVFY1dneUMyV1E1?=
 =?utf-8?B?djNDRkpBM1Q5WGFrZHpGVzNGMWYvL2tFaVJnUkFRVnI5MFp3cHl2RzU4NUFB?=
 =?utf-8?B?THhFRXFVMzBQZCtObC9KR0J3aFE0eGE0VXBzN0V1a1NSQWFUVVlpMVRUMG1n?=
 =?utf-8?B?RU01bmxpcnJiSzdVYlRUOXliZjJoTk05K2JrSzgrdHB2M0JoZkpXMlJkcXZV?=
 =?utf-8?B?d1IrTjRVNEJJL0VCTVpXZGo2cWZpSXpmc2xvRHA2U2xrYmhya21INDVYYzVw?=
 =?utf-8?B?OHpUc3dOK0pad3EvcWxFVlFOdDJmR2dzT3JvOHlBQUZ2RFF3REt3YW12R1Ns?=
 =?utf-8?B?YVRNUXFrV29DdE44MVJBZGRKUy9vSXhJN0ZMTGdKK09GTTdkbGhQampvVVA3?=
 =?utf-8?B?QnFRWGhxdmFxRFRyK2pHVm5qMFlacFNCSHRmbHdYMkRteVVBK3ZldXJjLzBW?=
 =?utf-8?B?bng4MWZCWkNQVGVhS1NQVDVNUjBsRHVkN2Q4cWdnbDhEeWpEaDR0bWs1Wm94?=
 =?utf-8?B?MmNHVEFxYno1TmxEeXR1VFRSZ1FwSTdhSmpGRlVrcUJXUXdqWlM0T1Ayb0Ri?=
 =?utf-8?B?eFVVcytpci9paTJaZExVOTZZQytjazQxdHppdEJ3SC92VXNpVFA5RUV4eUg4?=
 =?utf-8?Q?PvwGIRJK4OdJ0C77Y3qOVE8SvGMFDu5lSvI7Gz4J2+LZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4197450F88BDF44BBC8B190B2C1D5E0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23ad775-2dc2-486b-305c-08db2fb16820
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 17:25:20.5629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NPeyA4fHrJBlJmLD/qU9K32oZurSg+v5Ff9nwpRp00bQcnN9xb6Ml+7LXWSdP5yet1TD5i2Rqm1WHtNkAcNDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5082
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE0OjU1ICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjMtMDMtMjIgYXQgMTI6NDIgKzAxMDAsIEdyZWcgS0ggd3JvdGU6DQo+
ID4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgMTA6MjI6MjhBTSArMDAwMCwgSm9ha2ltIFRqZXJu
bHVuZCB3cm90ZToNCj4gPiA+IEluIGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2Nt
JTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZncmVna2glMkZ1c2IuZ2l0JTJGbG9nJTJGJTNGaCUz
RHVzYi1saW51cyZkYXRhPTA1JTdDMDElN0NKb2FraW0uVGplcm5sdW5kJTQwaW5maW5lcmEuY29t
JTdDZDBlZmU4MDIxZDBiNDNhNzA3YjkwOGRiMmFjYTkwN2IlN0MyODU2NDNkZTVmNWI0YjAzYTE1
MzBhZTJkYzhhYWY3NyU3QzElN0MwJTdDNjM4MTUwODIxNzEzMzk1MDYzJTdDVW5rbm93biU3Q1RX
RnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsx
aGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9ejN2WjlQSjA1VHk1SnhF
NzZoYlBQcGhKZXI5QXRBV1I5bkhpQVp1am9EYyUzRCZyZXNlcnZlZD0wIHRoZXJlIFVDU0kgZml4
ZXMgdGhhdA0KPiA+ID4gcHJldmVudCBPT1BTIGluIHN0YWJsZSBMaW51eC4NCj4gPiANCj4gPiBX
aGF0IHNwZWNpZmljIGNvbW1pdCBhcmUgeW91IGNvbmNlcm5lZCBhYm91dD8NCj4gDQo+IHVzYjog
dWNzaV9hY3BpOiBJbmNyZWFzZSB0aGUgY29tbWFuZCBjb21wbGV0aW9uIHRpbWVvdXQNCj4gdXNi
OiB1Y3NpOiBGaXggdWNzaS0+Y29ubmVjdG9yIHJhY2UNCj4gdXNiOiB1Y3NpOiBGaXggTlVMTCBw
b2ludGVyIGRlcmVmIGluIHVjc2lfY29ubmVjdG9yX2NoYW5nZSgpDQo+IA0KPiBUaGV5IGhhdmUg
YmVlbiB0aGVyZSBmb3IgMTMgZGF5cyBhbmQgSSBzdGFydGVkIHRvIHdvbmRlciBpZiB0aGV5IHdl
cmUgZGVsYXllZCBvciBtYXJrZWQgZm9yIGEgbXVjaCBsYXRlciByZWxlYXNlLg0KPiANCj4gPiAN
Cj4gPiA+IEkgZG9uJ3Qgc2VlIGFueSBvZiB0aGVtIGluIExpbnVzIHRyZWUgYW5kIHdvbmRlciBp
ZiB0aGVzZSBhcmUgcGxhbm5lZCBmb3IgbGF0ZXI/DQo+ID4gDQo+ID4gSG9wZWZ1bGx5IHRoZXkg
d2lsbCBnZXQgc2VudCB0byBMaW51cyBsYXRlciB0aGlzIHdlZWsuICBJcyB0aGVyZSBhDQo+ID4g
c3BlY2lmaWMgcnVzaCB0aGF0IHlvdSBuZWVkIHRoaXMgbm93Pw0KPiANCj4gTGF0ZXIgdGhpcyB3
ZWVrIGlzIGZpbmUuwqANCj4gDQo+ICAgVGhhbmtzDQo+ICAgICAgICAgICBKb2NrZQ0KPiANCg0K
SSBub3RpY2VkIGFib3ZlIFVDU0kgcGF0Y2hlcyBpbiB0aGUgc3RhYmxlIHF1ZXVlIGV4Y2VwdCB0
aGlzIG9uZSA6ICJ1c2I6IHVjc2k6IEZpeCB1Y3NpLT5jb25uZWN0b3IgcmFjZSIsDQpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvY29tbWl0Lz9pZD0wNDgyYzM0ZWM2Zjg1NTdlMDZjZDBmOGUyZDBlMjBlOGVkZTZhMjJjDQpN
YXJrZWQgZm9yIHN0YWJsZSwgcGVyaGFwcyBmb3Jnb3R0ZW4gPw0KDQogICAgSm9ja2UNCg==
