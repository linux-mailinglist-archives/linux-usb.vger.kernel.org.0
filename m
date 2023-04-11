Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0CC6DE672
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 23:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDKVcW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 17:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjDKVcT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 17:32:19 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D51F5591
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 14:32:14 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33BIaBqd021828;
        Tue, 11 Apr 2023 14:32:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=W+yZhk2l7tXsYAVJ04bRB7P2fknY2MmD8MrtRPZv4wY=;
 b=vm1B1j+RoxaiIRPTkI4AWmYRrVYpyZkG2Sq+rzT+xXzNvB7on8BLseIJPDpJLtM1QxLl
 AA3S8752SF8oA/mm80op7/LevQAxu2n+1wKoRESN6sbk6U9k/eLjo1BYzJbc5Y6HKe8G
 Ryu4uTXjV0GPt5xdSVLcHXtnYl9mW5dvlcaB0+CITDyOEiv4XAhy1zZK4xiyJclpB+H9
 zl+8XvpFk0RKG52Zy4HlEwNglJQmgUZhyr1NfFO0sPf2mPgnlJZ26S2ArYF+C2WyDdK7
 LI/7PKVHfs/PRYQsY6Xq3fdV2U+vF30UUXquiGP7pBrwromh0PXYvw/6aw7TjdxR0ccK zA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pu7h90pjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Apr 2023 14:32:08 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 23DC7C0810;
        Tue, 11 Apr 2023 21:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681248728; bh=W+yZhk2l7tXsYAVJ04bRB7P2fknY2MmD8MrtRPZv4wY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YrvmsDw9Hr11q9akRkvsQsC49yQh0hCTJ0gPHISVwS0RBCgDc7OlON/BaUHitX/z7
         r4igtCSXDpMpVcJuVYamMKhocnEsz3HolARGQKsrtZaG6CdtUZcCC3m7kQeIJpsdJz
         giqdsFKzCvusg/5pEDsotg5JerHyWypQ526D9pT2NZEyXs0WvM4f724oiIU43m0UGn
         +sXPnTfTiTgz3KyAEL8F6AGpLWoguO4nmj04iR/uigVYjeB/seVx9L5vDwq0aD6vrn
         8fCns5kft6EYizOLle/gVN6vEx5Rnm5/QQlB0AMYS0WwsDl9SucjhyrCbV0NWBucP9
         Szv2aEoNQqNIg==
Received: from o365relayqa-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relayqa-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 625F2A006B;
        Tue, 11 Apr 2023 21:32:07 +0000 (UTC)
Authentication-Results: o365relayqa-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relayqa-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relayqa-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pI2lAmIx;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relayqa-in.synopsys.com (Postfix) with ESMTPS id 05733220413;
        Tue, 11 Apr 2023 21:32:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anl041R8zrPTaUTs348HiejwInt7w908WrSQOPMMGGfj/GZAyHzAtmEld0asu7g/1Xxea5NPMAmkDYVM3GswYS434M318UiGT9LnkYB1Bu4XHT+azoOxN8vYE8uyoJefJZG2pO0YxMP8JNH1dpfyyy0uH1yuCS79m1mi6uX03OCn+5teNt5WzI1eOBPG5amPPHgB4inI+d/0wDDe/EeKPoKzKVVSrSwdH7M/S7i2mYpHDK3ll52bu968DQJOYwHCD8V2SiurjEdrjw84c+cWHP/+tudPEJsJB5MY6kj1o8/a1McNVVmEwoAsFt58o5lwyZrfj+s6T3eU/x4AqohCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+yZhk2l7tXsYAVJ04bRB7P2fknY2MmD8MrtRPZv4wY=;
 b=FI2GG1NqxsLWO/y+FI0Xqvsev3V3J0AvHomV9ovQZS7oYgrzpzpjtqBdrUPQNi5EkFT3iVZwk2gzDAqpYGpsM5OSu0M/TT7roPkHI6Pbl6ig5ELp2TWraF42TsXaLSf32zRjr1gy2lsMZgN/qJac+TSFfIiToJRUe+PsuryEImEBfxI416op3q0Ywo4CCN1Vj7MvpFrj0PrMWopS0kH9S9XegYFqwwoahUrnzpo2SQKkluITPqLm98AQzBHRg33xWAOoPtLPHSDD7M9xi3wrQiDFpGeeeMdQxNVZV4odPgIfU9EI6Fg+nrRJ7cPvhLpJ/69u30bXCJf4nbA+TODXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+yZhk2l7tXsYAVJ04bRB7P2fknY2MmD8MrtRPZv4wY=;
 b=pI2lAmIxYCnSxS5Ss+Zie/ZT7lYAWwhnmFlumYz2lR3QTVDMSu0voB5D21FASBq7w7lV6ck6ckV6B5qlw3RLrpy2BYIXoCQmXqmHZd5G5AEaStzulWPzV3Nl1ikCdg8tdf9mXiYt3OwuAvulv94YP0T0wDV+ODHdHwi+t/9++OY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB6874.namprd12.prod.outlook.com (2603:10b6:303:20b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Tue, 11 Apr
 2023 21:32:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25%4]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 21:32:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Stanley Chang <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] usb: dwc3: core: add support for disabling
 High-speed park mode
Thread-Topic: [PATCH v2 1/2] usb: dwc3: core: add support for disabling
 High-speed park mode
Thread-Index: AQHZbDd+hqEScU/KoU+seSSzshL+Ha8moacA
Date:   Tue, 11 Apr 2023 21:32:01 +0000
Message-ID: <20230411213158.r7i6thg67okbovjp@synopsys.com>
References: <20230411053550.16360-1-stanley_chang@realtek.com>
In-Reply-To: <20230411053550.16360-1-stanley_chang@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB6874:EE_
x-ms-office365-filtering-correlation-id: 45405f01-dd17-434a-760a-08db3ad42fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JvdQlr9b1lfLmBLv8fxBshm47/dq3F6Eot3lyyOWSQOClg3MhDa6Uu8w1G2suzzgh1oWn5uIsjc2UsOwFG73Qy6/0zYm3mvic2NbXKrVJWsY0mxiFO9CltgQ1wX9xq+R3ROtY6BmY5xDmmb46vo3j/fWthxot9y5HgitFTmdE2a4nTfmIc6fJ5bRPO7p1ix4EAReyfC0TYvvilPus0msvlfJcrWIgJUpPHLDuNPmiZCC6WGJpKimZPIGx/rAtSOAPXQxnEllwbnmFqhcxtjDhxd4hNzTSgs2Yv+pU6PEMHsz/AFWmJ2p3qOs7fvfCp41ZTQ/dZmkbhrwPGCED572DOktfrK0XNpWDQeV6daly9JP9V0kaEjdJDYEJK+QZiY0H0Th8saCCTQIIqy0DYrW7EGowyoOBXU/C0pWjR/ZPfOp/qwD0BNG2xgRxIsUAoUcOfATML9+zoX+ChSyug0OVrluFlXCXTMVQhsIZaUlikE8UkfSV3uG/2ChCRghGphG2mwVgkoM9r4PsGew2YuH9j8fgo0uaIuNfWfSHXZJ2wJA6I3ECI/QU0RKpyr3eY2I6Xn915i64NCFjkup5SHrezhrQGy9Yf3X1NC47giAUU7/RJ/jGKTPP+r4ry1xtwcc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(8936002)(8676002)(41300700001)(38070700005)(26005)(5660300002)(186003)(6512007)(1076003)(6506007)(71200400001)(54906003)(316002)(86362001)(6486002)(478600001)(66446008)(66556008)(64756008)(76116006)(66946007)(4326008)(66476007)(6916009)(122000001)(2906002)(38100700002)(36756003)(2616005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm1EVzdyS0xpN2ZtR2RrTVZWWE1ac3ZNOWUvTEhkSmJqbWg2SWJQM3c2MWhJ?=
 =?utf-8?B?YXBMZG9SYjFOTjZyQ0k4QXlQUDdZOGRvY200U2JlVlBZOUYxWEEyMUJUMUk0?=
 =?utf-8?B?RkttRHA1NVArUGpJbDJnM3dTRWZpN0o2MzdZcTZZRElwMEtHVHJ2SkcyOFpN?=
 =?utf-8?B?b1NlZFVJck85U1g5R3FrQjd2VGVTWkJtQUhZV296bjVreWo3WjF1WG5oRDUy?=
 =?utf-8?B?MllQOWpXZjE1Sy9ORXpNbktPMXFlckt5Yy8xV3dwS29McUZ2NFE3VFpSYWFu?=
 =?utf-8?B?MGhsVE4wcGh3RmE4QnZVRG5kTGpjL2YvNlRvZmRHMmlHZkdxRHZ5YU00VlBW?=
 =?utf-8?B?NlF5S2ZZTUpRYWwvOUtsaXNsRS9mMVZXUGcxdFBXL09GQWRPaHVzNm1GZzNX?=
 =?utf-8?B?VnA0b0h3T3RHU2hpSnJtc3hZeEUwaVA1ZDZpR3Z1dk5mV1FXSm44ek1uMjd5?=
 =?utf-8?B?N05tWVpjL0s5b0FOa09uUTNtZ1dRdXBtTndCdUs4MWpLYVJ2VmNacTFmdm1O?=
 =?utf-8?B?Y21xY253c25RUGhONjBWM3h4SU52V3dCYk1CMHl6YmtDOWlIem1WNG9FUEVn?=
 =?utf-8?B?cXRudU1yLytDTE5qM3JkeDJVN0hRYzdSeXorMjlycXlLWnc0L3dQbzlxZjZU?=
 =?utf-8?B?Z2VMTVg4eHc1aXB4SkVyOWMzVFNNUGNiZEVmUjhPUStFVkFBNG5YVnFyams2?=
 =?utf-8?B?L2k4L1ZmM2E3TTJvdHU4MWpNVWlHNzJGTUJLQnRvTnh0R1NFMUxzWUdodkdP?=
 =?utf-8?B?a3JnTWlYVGwwNXhVZmMrY0FVQWwrRE1KTmhDREVlbkNtVFZiWFhRQWRCelVp?=
 =?utf-8?B?TnZBRUJlVjUvN0M5MGlQbkRlUXpjMEluT2tnZlVFeksra29xajVmL2R5UlZF?=
 =?utf-8?B?K0xIY0Jodk8za1V5K1NNQlFXWTdISnFFOVYyRmRIMmxBUm1hVXNDMzVCUEI2?=
 =?utf-8?B?ZDJDbnFHb2VaMmxvemtoc3N5dmwvTm9xY3AyUVQxQ2ZkTUZBMDZWNURKZUxE?=
 =?utf-8?B?dFdzVWZweFZqbFVGOEE0aXEvYWdJbjVpYW02bVpoRGtNWDRETmpINjhaY1Jr?=
 =?utf-8?B?K09vZ3c5NW1OdkY1OXBmZEREQi9Eb1BpcFlYSE9SaitFd092L2VDTUhnWTJn?=
 =?utf-8?B?Nzh3MUNCUE94WEE2SlFnNDhMRzgybElISjJlbk1LcUlqejY5dVB3Y1cwOHZt?=
 =?utf-8?B?d3ZMNWNQbWtiV2c5YVRPRURLTitING5JRXIrZmM3RGdtY0hvSUNVYXhDRTBm?=
 =?utf-8?B?c0RrOVYyNFp3d0pRUDczNGMvYVRCSHVCV1FlUGI1V1Fab0lhSGJCVi9TTzV1?=
 =?utf-8?B?eTNQdDNoQy9UU0t2SWtPMkNSL2ZjeUNnOE5nVTJyeEJEajQ5aDdBYUsyWXFL?=
 =?utf-8?B?VG9obG9uM2VvajRqUU9hL0pYTzRJOEluRmwxalNad2Y1R1VPeS9QUTdTUm9B?=
 =?utf-8?B?QzJLSmFoZk4xV0hEWmJhNVVjTytzc0V2UEtDTTVyZWJUSjJHL1AxdUZHVmtI?=
 =?utf-8?B?eG1TUWVsMklaVDBvdTNaSkJmUitGMEZMVU9VdHBkZk9SSC9hSXFTTmtIRDN5?=
 =?utf-8?B?amp5bkZJRk5QanFJSFduZ241NHB0dUp0c2JKUExBa0xyNmNlcktrVHpOZ0Qy?=
 =?utf-8?B?Y0hjTWU1b0t4Z3VFSU8yMkNlTUJvTzd3WFJZTllBeGxzSEw1ZUVicmxyZ1Jr?=
 =?utf-8?B?MlBjVzhBTDBSWWhSUDQ0M2dubURXbVp6SGkza29td0lFbGNVaU9UclZVem9R?=
 =?utf-8?B?OWl1Y1gycXFaTFVIU0xVR1R1Z3lpZFR4VWpkNUFmN3BlYVRWTFZNSWxmR1BJ?=
 =?utf-8?B?eVl5bVN2Qlp0OVdkaGo0Wms1VzlXK2U4b3VsbURLaVFaNDNNN1B2elJSeXJx?=
 =?utf-8?B?bTVDNnFLS0R5ZTJsblpyNkNwVFBobjFjcFBJSkNvT1E2KzdzazhUQjdvaG9h?=
 =?utf-8?B?dndCSHFXTGdWekxHOTcranErc3NUMUxoM2M3T25uNVY0UjEyMkpRbEd4WDBQ?=
 =?utf-8?B?RmZCd0RzYVI3T2IzZyszdnN4UDloYndvS2oyOTlSOC9yQkIrb3AzNkE0clE5?=
 =?utf-8?B?N3hGQVNLdUcwVHM5MkMrZTVSM0RkL3lkUXJYWHUvV2o1VHZ6RUdYbmFVTEZj?=
 =?utf-8?B?eW1pNXBLeXdlWWNhcFNaeEp4bFF4ajJpVk9wWWxOVFVGYk5OcWpRYWF0dVNV?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4B1CF8262EE02409FD18CF5C79FECE7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5CXkjLmYGHVYNvCwUOOrQIPIKL3ElfOfbHjc9ow73SzFtvwbtCTKquL40TVcJb0dlONay/O5mQK/6YK7aQQc3EcJzMLTq02kS7/kRvsVdVwK1wx5/BHQJ77vH9lK5h+SMI7FtKtJwMXwuIkVIzxJpQhcWmn1TC9L7LUvH4Jmwuad4nQgZgsZkuSFr9XDK2xT7fuj/nE6cIEQndtJsNDjzBsJ8LNU4WvxuTDzdi1A7U8iWQOc+lACKYS62OskgUiRpluyg0Dt/In1PriSmuSkaGLxgKRr9Fgf7NO9kQnVSvc1wa9p4wVXxkcJ0R80O9o8aHC0blhz3b/DRTshvJyUq7yG6hbcp7WLgspXxhQi12ECearbuMvZEe1NZYp7WzWW2fEAeez8/CeDVmGHF7XPJVp2K1h+ohoQN1Tvd7oEah6uT93HvOdEJ4agmAivcLydjdKkKYFNLy9Gj689v867NIoWmlvE52XJnLxw8vI7kqFAOqMEZCiC5FWAgWo5xZrgkbJ9jrlHCXXhni4YKznpA0P/pEfbh3Unt/lerYpcnCeu45KVcmh57CKxTa/tmPruabt+OJ1oGt4ASs28hITKaYO93wjh6AFgByTTOSicFO1SGxY7+1x5yNHM2lURqIHSJ8JMAKd2oYV1pHwt+otYhbKjIM/ccrUscRc7xNvhb0FqkVJH426RiSevJ4G6+fJJZGTKCqMiCSkig7nTzF1KvvcdIHrD8Jkmm2VXyOo/dNbh1M7lE+q1VdOKmaRKr4eyD4+4/Q2nqd3DyFrcl3+PA+S3EImfgu0NVp2PuOvn8xPuO3TXVjrEo2XsjPiKH0qXB+d01C8pb06ewg0Lilp++A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45405f01-dd17-434a-760a-08db3ad42fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 21:32:01.0932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 14hn3x73kgYi2lqQwjqNcra5/UIP1zlYGGizoyd+P8953fa4z/2dhSdETQIFxAidn/+l60KXahWxRUlGlZygvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874
X-Proofpoint-GUID: uWLBkKH9vmKjEA2OPGVZfI3LUA_MY7ud
X-Proofpoint-ORIG-GUID: uWLBkKH9vmKjEA2OPGVZfI3LUA_MY7ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_15,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMTEsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+IFNldHRpbmcgdGhl
IFBBUktNT0RFX0RJU0FCTEVfSFMgYml0IGluIHRoZSBEV0MzX1VTQjNfR1VDVEwxLg0KPiBXaGVu
IHRoaXMgYml0IGlzIHNldCB0byAnMScgYWxsIEhTIGJ1cyBpbnN0YW5jZXMgaW4gcGFyayBtb2Rl
IGFyZSBkaXNhYmxlZA0KPiANCj4gRm9yIHNvbWUgVVNCIHdpZmkgZGV2aWNlcywgaWYgZW5hYmxl
IHRoaXMgZmVhdHVyZSBpdCB3aWxsIHJlZHVjZSB0aGUNCj4gcGVyZm9ybWFuY2UuIFRoZXJlZm9y
ZSwgYWRkIGFuIG9wdGlvbiBmb3IgZGlzYWJsaW5nIEhTIHBhcmsgbW9kZSBieQ0KPiBkZXZpY2Ut
dHJlZS4NCj4gDQo+IEluIFN5bm9wc3lzJ3MgZHdjMyBkYXRhIGJvb2s6DQo+IEluIGEgZmV3IGhp
Z2ggc3BlZWQgZGV2aWNlcyB3aGVuIGFuIElOIHJlcXVlc3QgaXMgc2VudCB3aXRoaW4gOTAwbnMg
b2YgdGhlDQo+IEFDSyBvZiB0aGUgcHJldmlvdXMgcGFja2V0LCB0aGVzZSBkZXZpY2VzIHNlbmQg
YSBOQUsuIFdoZW4gY29ubmVjdGVkIHRvDQo+IHRoZXNlIGRldmljZXMsIGlmIHJlcXVpcmVkLCB0
aGUgc29mdHdhcmUgY2FuIGRpc2FibGUgdGhlIHBhcmsgbW9kZSBpZiB5b3UNCj4gc2VlIHBlcmZv
cm1hbmNlIGRyb3AgaW4geW91ciBzeXN0ZW0uIFdoZW4gcGFyayBtb2RlIGlzIGRpc2FibGVkLA0K
PiBwaXBlbGluaW5nIG9mIG11bHRpcGxlIHBhY2tldCBpcyBkaXNhYmxlZCBhbmQgaW5zdGVhZCBv
bmUgcGFja2V0IGF0IGEgdGltZQ0KPiBpcyByZXF1ZXN0ZWQgYnkgdGhlIHNjaGVkdWxlci4gVGhp
cyBhbGxvd3MgdXAgdG8gMTIgTkFLcyBpbiBhIG1pY3JvLWZyYW1lDQo+IGFuZCBpbXByb3ZlcyBw
ZXJmb3JtYW5jZSBvZiB0aGVzZSBzbG93IGRldmljZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBT
dGFubGV5IENoYW5nIDxzdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIHwgNSArKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
fCA0ICsrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiBpbmRleCA0NzZiNjM2MTg1MTEuLjhmYmM5MmE1ZjJjYiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
QEAgLTEyMzMsNiArMTIzMyw5IEBAIHN0YXRpYyBpbnQgZHdjM19jb3JlX2luaXQoc3RydWN0IGR3
YzMgKmR3YykNCj4gIAkJaWYgKGR3Yy0+cGFya21vZGVfZGlzYWJsZV9zc19xdWlyaykNCj4gIAkJ
CXJlZyB8PSBEV0MzX0dVQ1RMMV9QQVJLTU9ERV9ESVNBQkxFX1NTOw0KPiAgDQo+ICsJCWlmIChk
d2MtPnBhcmttb2RlX2Rpc2FibGVfaHNfcXVpcmspDQo+ICsJCQlyZWcgfD0gRFdDM19HVUNUTDFf
UEFSS01PREVfRElTQUJMRV9IUzsNCj4gKw0KPiAgCQlpZiAoRFdDM19WRVJfSVNfV0lUSElOKERX
QzMsIDI5MEEsIEFOWSkgJiYNCj4gIAkJICAgIChkd2MtPm1heGltdW1fc3BlZWQgPT0gVVNCX1NQ
RUVEX0hJR0ggfHwNCj4gIAkJICAgICBkd2MtPm1heGltdW1fc3BlZWQgPT0gVVNCX1NQRUVEX0ZV
TEwpKQ0KPiBAQCAtMTU1NSw2ICsxNTU4LDggQEAgc3RhdGljIHZvaWQgZHdjM19nZXRfcHJvcGVy
dGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQkJCSJzbnBzLHJlc3VtZS1ocy10ZXJtaW5hdGlv
bnMiKTsNCj4gIAlkd2MtPnBhcmttb2RlX2Rpc2FibGVfc3NfcXVpcmsgPSBkZXZpY2VfcHJvcGVy
dHlfcmVhZF9ib29sKGRldiwNCj4gIAkJCQkic25wcyxwYXJrbW9kZS1kaXNhYmxlLXNzLXF1aXJr
Iik7DQo+ICsJZHdjLT5wYXJrbW9kZV9kaXNhYmxlX2hzX3F1aXJrID0gZGV2aWNlX3Byb3BlcnR5
X3JlYWRfYm9vbChkZXYsDQo+ICsJCQkJInNucHMscGFya21vZGUtZGlzYWJsZS1ocy1xdWlyayIp
Ow0KPiAgCWR3Yy0+Z2ZsYWRqX3JlZmNsa19scG1fc2VsID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbChkZXYsDQo+ICAJCQkJInNucHMsZ2ZsYWRqLXJlZmNsay1scG0tc2VsLXF1aXJrIik7DQo+
ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmgNCj4gaW5kZXggNDc0M2U5MThkY2FmLi4zMDkwN2ZmY2IzZWMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oDQo+IEBAIC0yNjMsNiArMjYzLDcgQEANCj4gICNkZWZpbmUgRFdDM19HVUNUTDFfREVW
X0ZPUkNFXzIwX0NMS19GT1JfMzBfQ0xLCUJJVCgyNikNCj4gICNkZWZpbmUgRFdDM19HVUNUTDFf
REVWX0wxX0VYSVRfQllfSFcJCUJJVCgyNCkNCj4gICNkZWZpbmUgRFdDM19HVUNUTDFfUEFSS01P
REVfRElTQUJMRV9TUwkJQklUKDE3KQ0KPiArI2RlZmluZSBEV0MzX0dVQ1RMMV9QQVJLTU9ERV9E
SVNBQkxFX0hTCQlCSVQoMTYpDQo+ICAjZGVmaW5lIERXQzNfR1VDVEwxX1JFU1VNRV9PUE1PREVf
SFNfSE9TVAlCSVQoMTApDQo+ICANCj4gIC8qIEdsb2JhbCBTdGF0dXMgUmVnaXN0ZXIgKi8NCj4g
QEAgLTExMDIsNiArMTEwMyw4IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPiAg
ICoJCQlnZW5lcmF0aW9uIGFmdGVyIHJlc3VtZSBmcm9tIHN1c3BlbmQuDQo+ICAgKiBAcGFya21v
ZGVfZGlzYWJsZV9zc19xdWlyazogc2V0IGlmIHdlIG5lZWQgdG8gZGlzYWJsZSBhbGwgU3VwZXJT
cGVlZA0KPiAgICoJCQlpbnN0YW5jZXMgaW4gcGFyayBtb2RlLg0KPiArICogQHBhcmttb2RlX2Rp
c2FibGVfaHNfcXVpcms6IHNldCBpZiB3ZSBuZWVkIHRvIGRpc2FibGUgYWxsIEhpc2hTcGVlZA0K
PiArICoJCQlpbnN0YW5jZXMgaW4gcGFyayBtb2RlLg0KPiAgICogQHR4X2RlX2VtcGhhc2lzX3F1
aXJrOiBzZXQgaWYgd2UgZW5hYmxlIFR4IGRlLWVtcGhhc2lzIHF1aXJrDQo+ICAgKiBAdHhfZGVf
ZW1waGFzaXM6IFR4IGRlLWVtcGhhc2lzIHZhbHVlDQo+ICAgKgkwCS0gLTZkQiBkZS1lbXBoYXNp
cw0KPiBAQCAtMTMxOCw2ICsxMzIxLDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXVuc2lnbmVkCQlk
aXNfdHhfaXBnYXBfbGluZWNoZWNrX3F1aXJrOjE7DQo+ICAJdW5zaWduZWQJCXJlc3VtZV9oc190
ZXJtaW5hdGlvbnM6MTsNCj4gIAl1bnNpZ25lZAkJcGFya21vZGVfZGlzYWJsZV9zc19xdWlyazox
Ow0KPiArCXVuc2lnbmVkCQlwYXJrbW9kZV9kaXNhYmxlX2hzX3F1aXJrOjE7DQo+ICAJdW5zaWdu
ZWQJCWdmbGFkal9yZWZjbGtfbHBtX3NlbDoxOw0KPiAgDQo+ICAJdW5zaWduZWQJCXR4X2RlX2Vt
cGhhc2lzX3F1aXJrOjE7DQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
