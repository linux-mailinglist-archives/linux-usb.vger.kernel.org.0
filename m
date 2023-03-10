Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F7F6B3B26
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 10:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjCJJpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 04:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbjCJJpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 04:45:00 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C501A4BA
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 01:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+6gFhFcG6EXHFo5LpC6uj7Nqh84jd1kjudzEAuIqKSaHA+Ty5ts5jT5j7T/BDsDoPyQwJZbMMCjXuRop5bJlUSKpPcuWMMQntn5LEg+iZ4UhDe58p7uHzMdr/akq2jjmesR7/JDYO4iy+lXP1zBqWSYHhaHl3iGINiKdRUf6LDix1InAxmslUqCmQdi50S9lRnakt2td2/3Ms327I8yx/LC+75JhmWFnqwFhcy0ZFATuV22GlO9H+crORBI58jNMwU4BPLLf1sSMXXgOSsSfwbogoygCdWmYtlyXGXSYfSAaxBN5Gd7tDW0n7+o+dgo03+pxdoXvFU0tx27UT9QXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm0DsmrjK1Tvn9myVVwPFztUMh8c5cMLHg9MT2zG9SM=;
 b=gDeNRePAWdaewMl6npiY0kZ/lcDzLXpT2ps30v6hDRKsaR3Nzd85yUw37RQcPwrb9Jd6STT0TwgvFpMscMQhBmCuJSB958Kx1qjcD3CWvEl2UwnFEpSPOQqG8nIPkkh0e0ZRAAe7IEZpW3fKWtTvjbtqHJc/ntaVUuYcUOzVuv5Nj7ouV8UqDST+oLxr0qTWOQ3zIZB1NSShnqCxM/Y0NGE86GUDVh8bF4QvRUAoul+roHa6Px8Ih3uFGFSZJVrQWaHelur85/ugMotYZ17pGIxRV4PhVAP8fZZqgk0duxYfHPVHoRutPAl5b95H05r0NY8A8ZP0j0osBfOXFoh5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm0DsmrjK1Tvn9myVVwPFztUMh8c5cMLHg9MT2zG9SM=;
 b=gjrtnafelrha3Ioaud8wptyP0OUVzWKWOJijOvzorqCeNo9A8QCZQY6WFNJvKhE+fjeSWisA8gbvvmePXOkSHwVqIVQp9zaInpCZr0lisZb+UEiiw7NLg6afwAW04yDWoTDWQ6gdqnsug/c0onL/Pje0PMTuomwec9L6yaju0bCHcjbPh7zz8qqkohQXoLc2Va/gWOwbB6bjtXuZ7dDHCeBK1iJrRI/trOfJjSS8bNLBWdZxhBHMntgzbf+0xm3FlJW+UwTTxCo5Oe3FM4c11V02+LwVgwtrZVNgi8FMOzZ/Mu/3kGIt0VbBMwXGUjq0bjAhFs0IndWiYkePIKdLvw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by IA1PR10MB6217.namprd10.prod.outlook.com (2603:10b6:208:3a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 09:44:26 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:44:26 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Topic: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Index: AQHZUzTnvuOBWwNTH0CfFBqIVx8BDw==
Date:   Fri, 10 Mar 2023 09:44:26 +0000
Message-ID: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|IA1PR10MB6217:EE_
x-ms-office365-filtering-correlation-id: 02e70b4a-5529-4380-2134-08db214c09b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfbD53DE8kLJsdVhPSGDgKxpRRkNxgaMWf5Lur7hYw847v5m7K6AflQMRwKzRt6kn1/os8svacjkMhCQxH2FiuvhCiD1s2rMnzvpIpQhcFQPPU4IDblxWD459JJ1+L2RMqu839PMyQZUlhbLPdVJnpURqYqnGT+nni77dvknmdE4g+jzusFnnn15jT2Tz9pYuQvbkVbHhOyM3sKaj8xpc2wjGBM1QmGkAImYLbMQNHNcsGdOc6vGG15grPsJwG9QgnENvDVjpIA2fbnvz7DdA2RM03Y0fApe/PDoHXS5VkbI5g5uFX1KWEZzwr1rnawUZV3OpXyQnXihMoe3+fkzeKjCTyFGErQaPqK52dPhYJk1FYNnl0Yvprz+JvI4Lfi01R8MUoLicKWV7z0TJy3yDDE0XeIALp5iR3Be3sVWf9b+J/UMoCSgAMUFitWmDU1NAVsCX0cO9TkrrVlc+w1dJiH4S8ClXINfMoUY3UEvF8G12OtsxMgUalSjOQ1IJSnVddnlrUUL+AzR6JGplLNGNsYgHiX0RwUMlDEipadioqFTehMG6TJIt5XCfk01zMFPQxcvhNhZjnW35AKx49qt1E0P7Yk5uRkAN8AVSIiADHPa/w5d0UXJsbsAiTot4VlyT6Fvlf17Pvy8GR25RbGTUF/9xPd8JQjKfgE7y8+OrbEEBcGtBi0aKAftxmhSEGBX3DU1NcNifngh3/T1QsedkSTxaIhIXKoAJQUND/mc2NI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(83380400001)(36756003)(122000001)(110136005)(91956017)(316002)(38100700002)(45080400002)(38070700005)(2616005)(6486002)(71200400001)(6506007)(186003)(478600001)(6512007)(5660300002)(64756008)(41300700001)(66446008)(8676002)(8936002)(86362001)(2906002)(66946007)(76116006)(66556008)(66476007)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3NYcDBWWHROM2NSV3R0SEhLSDBOdVpjRFVndHc1VjlYQUQ3S0RrK3V1U0I0?=
 =?utf-8?B?NWxEdkVENmRuTTMzYmUrVHdTaWZZQ01Ec0JzWUk2SnRnVS9rUlhOWGRDTmFR?=
 =?utf-8?B?MEh2ZXpaTGU0Z1l4bWRKREk1cW5QT1NYR283cjZOWW9rektabnU4Q1EwY2Nn?=
 =?utf-8?B?c3ZmSmZaemVtTCt5eTFGeXFLQ1RCUHZ6M3dnSmRRdWdDTVc4cjg4WFlLQVNu?=
 =?utf-8?B?N0V1dDRqR2x2T1ZnWEdJTU9xOFRScUlyZndRZlhQNjJneGE5QmRrNDE4eU5y?=
 =?utf-8?B?QWdnVnJZeWlQYlVkL0VZTGhsZHhQajQ5UnFlbjcwNWQvT2RRKzJOTjRraVpt?=
 =?utf-8?B?aFltR0lPNE84THBDbndDL0hBTjhpcmtRcGlaNFArT1lZNmhLVERMVnNOSmVn?=
 =?utf-8?B?VEVlVXhJVWNVMEFmaHE1RTM1U2JoMXVLZzFRK3loVlcvMnlrSkRyYmo1WCtl?=
 =?utf-8?B?eTNNSjhqNHRSK2txb3JEVVl0dWRiVlNmeFpqOWNpZE9SVXQ5T0k1aDdEYkp4?=
 =?utf-8?B?ZERvMUsrYzRHTkxDWHBBM0NOVEJRV1hUd01SaVcvTzhsM1lHTjNzclA4Yk42?=
 =?utf-8?B?VWZxQlJjSkRpbjdxNVVBUXJlSzlsdEpyOElHUWR0WTBZOVFpeC9BNElZdnZB?=
 =?utf-8?B?dFZCSVYrc2ZDbVRBTUp1STJseVJsMStkQnE4ZWZ3N25vWTM0ZGNCOUlEVXBD?=
 =?utf-8?B?TDFXMVFCWDJSc0kyWFY2bXhnMmdGV2ZvTzRibkE0VU9vTVE1VElyUkhvdjEw?=
 =?utf-8?B?K3NaN1pORytldXJrajE1NG52Q0dPTmRYNTMrTk5JdVQ3eTRoeWJFY1Q3Tmht?=
 =?utf-8?B?NlVKc2czTkdtUlFObWt1UzdOZncrWEdKNk5JcVMzTGI5aW9ST2ZEMCt0QVk3?=
 =?utf-8?B?Snk0OEorOTVQaDkxV1JlWVNNUlpLMmRQWlNxemRKMTFUaSsxeGhQclg2MHdQ?=
 =?utf-8?B?bm9sVElhQkNZUmtBRTNZanE0dHpQN0V0N1Awc2RoWHl1M05xbnpzQTc5VWNN?=
 =?utf-8?B?dHZWejRYMEhFRkExcDZoREd3blJwZy9UeXNHOVN4a3lGa2RRVG5hZERYYUNq?=
 =?utf-8?B?OEZtUlQyaVNYWkV4Y2k5djlseE5kcUlCc3NXQWtmNGJONXVaeWNUK3dWdnp5?=
 =?utf-8?B?REVrRTcwL0tteGw4UHA0VGY4a2pOeGFORGJEd2hCSFMwMkJUalpWMEFrOERJ?=
 =?utf-8?B?ODkyMW0xai9ZZ014WlpQWVN4dzM0UkVLMDNoZFByRDUxTFJzZUZVSFBwZlNk?=
 =?utf-8?B?OUZDbnYvU0F3bmtqWDFJUFlIZzZVN3B1cTErdHNrdlo1b1Zmdnl5UUx6YW5Y?=
 =?utf-8?B?VVVpVTZrN3RnSHNZVU02dmlxRDRLbWFUQ3MwT3BxaUNvRmt6NUxmN3lnRXJM?=
 =?utf-8?B?dVYzdU82QWszcS9FN2JweWUwM05za1Y5SXlNOEczRUZNcUY1N3d4blJLMjZp?=
 =?utf-8?B?VnZ6QTU3MGpaaFpMZlhoUnpKT1lRSk5TQi9XSXBGYms0WVJuSEZtREpXaEVo?=
 =?utf-8?B?cEtCRTRlWDQwMFcxcytqWUhTdXJmQnRUN1gwSndubHQxb0dQdTYzcWNHT0Zu?=
 =?utf-8?B?VTlPZEZJTlBMTURLaGJmZUtZck92UWx3UTY4dy9VMWJ5ZU9oTGg1eURuRXlz?=
 =?utf-8?B?bU9MM1FVTHM5Yng5R1JiaUMwQkVlektBbmZjOElGMENyem9QcE9QTXVPalZk?=
 =?utf-8?B?c3JFTVFwdEdtcWd3V1JsUjBGWjFJdldKeGlpSktGQW8wMEVxSnNzc3lIR1Ix?=
 =?utf-8?B?TVdjc2VYNzVBUGZ2TkVqTnJyODBTcFA0Y21Eb1RwMFV3MmNLdG8xL2k1OWpv?=
 =?utf-8?B?NjZ2VFVDaStYYW5jTk9MZFdRb2VZb2czT2dLL1JjWSthUWV0YjRvWlgyYzBF?=
 =?utf-8?B?WjZwdFVrcnBDekRSRUZqUStHdDZIUEpRazZSN3J3Wm52UVJHcnlXQlBvbVRy?=
 =?utf-8?B?NDFUSHlqK21Rc08wdGptREZLYzl1blk0WXErS0NCcjlPNzVueDBibXpWNTBN?=
 =?utf-8?B?a1lHcU45dVJ3eGxEZ3ZMZnBGRy9EOTU2aDk5MXZUZWFjeTF0dGpwRHhweCtm?=
 =?utf-8?B?RHk2OWdhcUxRck5OckJrd002bHdjZ25vMEVXWmxEc2l4Qit4OG1FbkFEUU40?=
 =?utf-8?B?L0xSVGVtNU9pVWs4NXFjbXNpcG1tWW5xcGtONEYyUENYcXFaaXNPS0dmeDNi?=
 =?utf-8?Q?iU2o8+bXFKvE6YysKlSnSJj7EcYnilnpvERVZdmHkQ4T?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A27D28E82AF42B4CAD974AE1C86DF665@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e70b4a-5529-4380-2134-08db214c09b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 09:44:26.7194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+O+SWNbo3xpX7Ln+PVF1DARxseqn12xpLuOB0B0Qlq4qb0+HhK5srDY7hNUmWtCDI7yFD4HTFpzlw3959w7+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6217
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhlIG9sZCBSTkRJUy9OQ00gY29uZmlncyBkb2VzIG5vdCB3b3JrIGFnYWluc3QgbW9kZXJuIFdp
bmRvd3MuIEkgd29uZGVyIGlmIHRoZXJlDQpzaG91bGQvY291bGQgYmUgdXBkYXRlZCB0byB3b3Jr
aW5nIHN0YXRlID8NCg0KSSB0cmllZCB0byBtaW1pYyBjb25maWdzIGxpa2Ugc286DQotLS0tLS0t
LS0tLS0tLS0tLS0tLSBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9uY20uYyAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCmluZGV4IGRjOGYwNzhmOTE4Yy4uZjc1ZjRiZmRjOTcxIDEwMDY0NA0K
QEAgLTE3LDYgKzE3LDcgQEANCiAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQogI2luY2x1ZGUg
PGxpbnV4L2V0aGVyZGV2aWNlLmg+DQogI2luY2x1ZGUgPGxpbnV4L2NyYzMyLmg+DQorI2luY2x1
ZGUgPGxpbnV4L25scy5oPg0KIA0KICNpbmNsdWRlIDxsaW51eC91c2IvY2RjLmg+DQogDQpAQCAt
MTQ4LDkgKzE0OSw5IEBAIHN0YXRpYyBzdHJ1Y3QgdXNiX2ludGVyZmFjZV9hc3NvY19kZXNjcmlw
dG9yIG5jbV9pYWRfZGVzYyA9IHsNCiANCiAJLyogLmJGaXJzdEludGVyZmFjZSA9CURZTkFNSUMs
ICovDQogCS5iSW50ZXJmYWNlQ291bnQgPQkyLAkvKiBjb250cm9sICsgZGF0YSAqLw0KLQkuYkZ1
bmN0aW9uQ2xhc3MgPQlVU0JfQ0xBU1NfQ09NTSwNCi0JLmJGdW5jdGlvblN1YkNsYXNzID0JVVNC
X0NEQ19TVUJDTEFTU19OQ00sDQotCS5iRnVuY3Rpb25Qcm90b2NvbCA9CVVTQl9DRENfUFJPVE9f
Tk9ORSwNCisJLmJGdW5jdGlvbkNsYXNzID0JMHhlZiwgLy9VU0JfQ0xBU1NfQ09NTSwNCisJLmJG
dW5jdGlvblN1YkNsYXNzID0JMHgwMiwgLy9VU0JfQ0RDX1NVQkNMQVNTX05DTSwNCisJLmJGdW5j
dGlvblByb3RvY29sID0JMHgwMSwgLy9VU0JfQ0RDX1BST1RPX05PTkUsDQogCS8qIC5pRnVuY3Rp
b24gPQkJRFlOQU1JQyAqLw0KIH07DQogDQpAQCAtMTYyLDkgKzE2Myw5IEBAIHN0YXRpYyBzdHJ1
Y3QgdXNiX2ludGVyZmFjZV9kZXNjcmlwdG9yIG5jbV9jb250cm9sX2ludGYgPSB7DQogDQogCS8q
IC5iSW50ZXJmYWNlTnVtYmVyID0gRFlOQU1JQyAqLw0KIAkuYk51bUVuZHBvaW50cyA9CTEsDQot
CS5iSW50ZXJmYWNlQ2xhc3MgPQlVU0JfQ0xBU1NfQ09NTSwNCi0JLmJJbnRlcmZhY2VTdWJDbGFz
cyA9CVVTQl9DRENfU1VCQ0xBU1NfTkNNLA0KLQkuYkludGVyZmFjZVByb3RvY29sID0JVVNCX0NE
Q19QUk9UT19OT05FLA0KKwkuYkludGVyZmFjZUNsYXNzID0JMHhlZiwgLy9VU0JfQ0xBU1NfQ09N
TSwNCisJLmJJbnRlcmZhY2VTdWJDbGFzcyA9CTB4MDIsIC8vVVNCX0NEQ19TVUJDTEFTU19OQ00s
DQorCS5iSW50ZXJmYWNlUHJvdG9jb2wgPQkweDAxLCAvL1VTQl9DRENfUFJPVE9fTk9ORSwNCiAJ
LyogLmlJbnRlcmZhY2UgPSBEWU5BTUlDICovDQogfTsNCiANCkBAIC0xNDIzLDcgKzE0MjQsMTAg
QEAgc3RhdGljIGludCBuY21fYmluZChzdHJ1Y3QgdXNiX2NvbmZpZ3VyYXRpb24gKmMsIHN0cnVj
dCB1c2JfZnVuY3Rpb24gKmYpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiANCiAJbmNtX29wdHMgPSBj
b250YWluZXJfb2YoZi0+ZmksIHN0cnVjdCBmX25jbV9vcHRzLCBmdW5jX2luc3QpOw0KLQ0KKwlj
ZGV2LT51c2Vfb3Nfc3RyaW5nID0gdHJ1ZTsNCisJY2Rldi0+Yl92ZW5kb3JfY29kZSA9IDB4YmM7
IC8qIE1pY3Jvc29mdCAqLw0KKwl1dGY4c190b191dGYxNnMoIk1TRlQxMDAiLCA3LCBVVEYxNl9M
SVRUTEVfRU5ESUFOLA0KKwkJCSh3Y2hhcl90ICopY2Rldi0+cXdfc2lnbiwgT1NfU1RSSU5HX1FX
X1NJR05fTEVOKTsgLyogTWljcm9zZnQgKi8NCiAJaWYgKGNkZXYtPnVzZV9vc19zdHJpbmcpIHsN
CiAJCWYtPm9zX2Rlc2NfdGFibGUgPSBremFsbG9jKHNpemVvZigqZi0+b3NfZGVzY190YWJsZSks
DQogCQkJCQkgICBHRlBfS0VSTkVMKTsNCkBAIC0xNjI1LDYgKzE2MjksOCBAQCBzdGF0aWMgc3Ry
dWN0IHVzYl9mdW5jdGlvbl9pbnN0YW5jZSAqbmNtX2FsbG9jX2luc3Qodm9pZCkNCiAJb3B0cyA9
IGt6YWxsb2Moc2l6ZW9mKCpvcHRzKSwgR0ZQX0tFUk5FTCk7DQogCWlmICghb3B0cykNCiAJCXJl
dHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KKwlzdHJjcHkob3B0cy0+bmNtX2V4dF9jb21wYXRfaWQs
ICJXSU5OQ00iKTsgLyogY29tcGF0aWJsZV9pZCAqLw0KKw0KIAlvcHRzLT5uY21fb3NfZGVzYy5l
eHRfY29tcGF0X2lkID0gb3B0cy0+bmNtX2V4dF9jb21wYXRfaWQ7DQogDQogCW11dGV4X2luaXQo
Jm9wdHMtPmxvY2spOw0KDQoNCmFuZDoNCi0tLS0tLS0tLS0tLS0tLS0tLS0gZHJpdmVycy91c2Iv
Z2FkZ2V0L2Z1bmN0aW9uL2Zfcm5kaXMuYyAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KaW5kZXggZWU5
NWU4ZjVmOWQ0Li5lN2MwYTYwYzExMDcgMTAwNjQ0DQpAQCAtMTcsNiArMTcsNyBAQA0KICNpbmNs
dWRlIDxsaW51eC9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvZXRoZXJkZXZpY2UuaD4NCiAN
CisjaW5jbHVkZSA8bGludXgvbmxzLmg+DQogI2luY2x1ZGUgPGxpbnV4L2F0b21pYy5oPg0KIA0K
ICNpbmNsdWRlICJ1X2V0aGVyLmgiDQpAQCAtMTc2LDkgKzE3Nyw5IEBAIHJuZGlzX2lhZF9kZXNj
cmlwdG9yID0gew0KIA0KIAkuYkZpcnN0SW50ZXJmYWNlID0JMCwgLyogWFhYLCBoYXJkY29kZWQg
Ki8NCiAJLmJJbnRlcmZhY2VDb3VudCA9IAkyLAkvLyBjb250cm9sICsgZGF0YQ0KLQkuYkZ1bmN0
aW9uQ2xhc3MgPQlVU0JfQ0xBU1NfQ09NTSwNCi0JLmJGdW5jdGlvblN1YkNsYXNzID0JVVNCX0NE
Q19TVUJDTEFTU19FVEhFUk5FVCwNCi0JLmJGdW5jdGlvblByb3RvY29sID0JVVNCX0NEQ19QUk9U
T19OT05FLA0KKwkuYkZ1bmN0aW9uQ2xhc3MgPQkweGVmLCAvL1VTQl9DTEFTU19DT01NLA0KKwku
YkZ1bmN0aW9uU3ViQ2xhc3MgPQkweDAyLCAvL1VTQl9DRENfU1VCQ0xBU1NfRVRIRVJORVQsDQor
CS5iRnVuY3Rpb25Qcm90b2NvbCA9CTB4MDEsIC8vVVNCX0NEQ19QUk9UT19OT05FLA0KIAkvKiAu
aUZ1bmN0aW9uID0gRFlOQU1JQyAqLw0KIH07DQogDQpAQCAtNjgxLDYgKzY4Miw3IEBAIHJuZGlz
X2JpbmQoc3RydWN0IHVzYl9jb25maWd1cmF0aW9uICpjLCBzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpm
KQ0KIA0KIAlybmRpc19vcHRzID0gY29udGFpbmVyX29mKGYtPmZpLCBzdHJ1Y3QgZl9ybmRpc19v
cHRzLCBmdW5jX2luc3QpOw0KIA0KKwljZGV2LT51c2Vfb3Nfc3RyaW5nID0gdHJ1ZTsNCiAJaWYg
KGNkZXYtPnVzZV9vc19zdHJpbmcpIHsNCiAJCWYtPm9zX2Rlc2NfdGFibGUgPSBremFsbG9jKHNp
emVvZigqZi0+b3NfZGVzY190YWJsZSksDQogCQkJCQkgICBHRlBfS0VSTkVMKTsNCkBAIC02ODgs
NiArNjkwLDEwIEBAIHJuZGlzX2JpbmQoc3RydWN0IHVzYl9jb25maWd1cmF0aW9uICpjLCBzdHJ1
Y3QgdXNiX2Z1bmN0aW9uICpmKQ0KIAkJCXJldHVybiAtRU5PTUVNOw0KIAkJZi0+b3NfZGVzY19u
ID0gMTsNCiAJCWYtPm9zX2Rlc2NfdGFibGVbMF0ub3NfZGVzYyA9ICZybmRpc19vcHRzLT5ybmRp
c19vc19kZXNjOw0KKwkJLy9jZGV2LT5iX3ZlbmRvcl9jb2RlID0gMHhjZDsgLyogTWljcm9zb2Z0
ICovDQorCQljZGV2LT5iX3ZlbmRvcl9jb2RlID0gMHhiYzsgLyogTWljcm9zb2Z0ICovDQorCQl1
dGY4c190b191dGYxNnMoIk1TRlQxMDAiLCA3LCBVVEYxNl9MSVRUTEVfRU5ESUFOLA0KKwkJCQko
d2NoYXJfdCAqKWNkZXYtPnF3X3NpZ24sIE9TX1NUUklOR19RV19TSUdOX0xFTik7IC8qIE1pY3Jv
c29mdCAqLw0KIAl9DQogDQogCXJuZGlzX2lhZF9kZXNjcmlwdG9yLmJGdW5jdGlvbkNsYXNzID0g
cm5kaXNfb3B0cy0+Y2xhc3M7DQpAQCAtOTIxLDYgKzkyNyw4IEBAIHN0YXRpYyBzdHJ1Y3QgdXNi
X2Z1bmN0aW9uX2luc3RhbmNlICpybmRpc19hbGxvY19pbnN0KHZvaWQpDQogCW9wdHMgPSBremFs
bG9jKHNpemVvZigqb3B0cyksIEdGUF9LRVJORUwpOw0KIAlpZiAoIW9wdHMpDQogCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsNCisJc3RyY3B5KG9wdHMtPnJuZGlzX2V4dF9jb21wYXRfaWQsICJS
TkRJUyIpOyAvKiBSTkRJUyA2LjAsIGNvbXBhdGlibGVfaWQgKi8NCisJc3RyY3B5KG9wdHMtPnJu
ZGlzX2V4dF9jb21wYXRfaWQgKyA4LCAiNTE2MjAwMSIpOyAvKiBSTkRJUyA2LjAsIHN1Yl9jb21w
YXRpYmxlX2lkICovDQogCW9wdHMtPnJuZGlzX29zX2Rlc2MuZXh0X2NvbXBhdF9pZCA9IG9wdHMt
PnJuZGlzX2V4dF9jb21wYXRfaWQ7DQogDQogCW11dGV4X2luaXQoJm9wdHMtPmxvY2spOw0KDQoN
CkJ1dCB0aGlzIGRpZG4ndCB3b3JrDQoNCiBKb2NrZQ0KDQo=
