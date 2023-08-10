Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A33776D06
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 02:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjHJA2l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 20:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjHJA2k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 20:28:40 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F89171D
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 17:28:40 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379NEgVx008557;
        Wed, 9 Aug 2023 17:28:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=cs4G7erz6xhwj/QZalvxyvgSBZy+/NGmedL19bF4eIU=;
 b=uAuMG+AtlenAdZeaJvLgxkBYFSeu+LHkX7Nflqtk3j2d3w/h8NrJaErpHaErPXtJu/0y
 1F2TyELR7XRrjtUW0MjHrNuebo52L80b9977EwZcJGIB/YzSc92GI3MapViJWJmtzy5m
 3p1bsW9kGxNjHw3D/C019VPtXXaGwF1GM7yAxiQTd9LeDGGb3BRZjZ96JgwF5ard5IS4
 zMNv//WsPy8BC0F1v7T9Zl/zRcvEw95Ss/FMtQNgIlRYEBpZg0zbPpL4GPnyrDAdjeSQ
 fktObJWsLycvo6shCXb7BBCpEtmcB4arVTYc0ynu3hxSJmdXDZ2Y9eA/15/ntWUccvlb Vg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3s9n2fdjyw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Aug 2023 17:28:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1691627315; bh=cs4G7erz6xhwj/QZalvxyvgSBZy+/NGmedL19bF4eIU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=erHZ3FsXS4zSv0Ym2Sr/miSpwoy47nrz4ALTDoy8u/xeLG6rEIJTyoFVOkiXM6xME
         wNsRbRF91mmV7kfgXtOZfNMD3Ziy1KWNiWMhYmbdY4B6rZrNefXiKtSHbluvwee7tS
         Iz5uXqU7SXCCKRXyg5AWSScInZia8yX4YSqFrj5F91be6nULWMqLBYGecVjAjiVeMk
         mlvKUK46lCmqRQsVj52IBgRGgkTkx1vegM49RYVW9l6SuIe7DMGZkv7XpRDlASyli1
         YdjbE6dcejm6zn6d7CwQynU5xgJGgzoibeWf0sUTc0nCZKnrt+ouNYwLSYCP+dn5LV
         lvSsrMQV1Qmqg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EED2A401CF;
        Thu, 10 Aug 2023 00:28:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 26536A0077;
        Thu, 10 Aug 2023 00:28:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=h+rzF6H2;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2917A40123;
        Thu, 10 Aug 2023 00:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDWGjjAjqB1/GqNxEAQWcNWCVOILDyWYIjPrG00k+UlKLnhjQ0Y08bGMiA4FBNpjvJV8mlA+jgbDAEf+kzNPqBGCp3DWC7DWzSO6YBPM82IQTLEekTlPaw08PKUsarVC5s8ehXuFPNpE6aLzfNfEFdnxMmVeUTTOShVrZQtzQfOD4zIerRR6sAN9O/c4EsKOSjkteC1SHT/qi4PDYTCjYs7KVwuvP+UZLwrvOMyj7Ly4vDPRt8xLeONJvienlVwzMKSLTF5uypcCRc5B10jOr4EJWHs89hWhbRQprdsZQRqAE0gATO9lk8H11qkoSO/VdEHQg5tcXtBxDjiJ2TT41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cs4G7erz6xhwj/QZalvxyvgSBZy+/NGmedL19bF4eIU=;
 b=RFBbB0H/YJRwc0PBHYzFBT2uszvrfkuRkWbHwg6upDjzQv9KxEt1IWkfVZ60yBbZrLaGp0lOrfgti4Ty/bZ07SEBeqQV2zfXWcOfRxXrbp9GmcBlTANAcGAmVszds9vthrrW/XR4hqqPiGTzwpuAMa8y+1OT65fxbcVguavHRhyfL0lVnJspALZXgRcCZWP6tWCN8KBUoK65nAWg8hVJf9SBrJJmHlvXfZO8QuHADyKJVmW6UgeAf4cocAY/kI+FJUw7W0v00dfKsPvFvW3eYOofAafeLmBwfQefofNr4XuEcrWxJJHipUnC9IWIhRsBp0cGHzDrLGKwPoWKGt09GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs4G7erz6xhwj/QZalvxyvgSBZy+/NGmedL19bF4eIU=;
 b=h+rzF6H2OKQswQ41yAtEpw/q8RolCvBRodblGUiy8yciZ9iZNK5Qi/dRiRn8mBmupbsZ65i7+rlsCGzI8XYpMNaiFZtRAXkcx9U+UBPmTYtlliFuBK3tQrQlhkhHDGvz7uAr9X/WvwvqtXvGacS+NXg27c6BYQDasEjN7h0Ng/E=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 00:28:29 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9bdb:ffe:c29f:432f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9bdb:ffe:c29f:432f%6]) with mapi id 15.20.6652.026; Thu, 10 Aug 2023
 00:28:27 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Thread-Topic: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Thread-Index: AQHZxwcxBbIIf0BjtUaoyoF9g1KO9q/itRGA
Date:   Thu, 10 Aug 2023 00:28:27 +0000
Message-ID: <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
In-Reply-To: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN0PR12MB6032:EE_
x-ms-office365-filtering-correlation-id: 844e3440-2203-4557-bd01-08db9938b72b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cd874eRq0SFeqZIfdpXXFni1DbH4n1BKC9tD144HhJ3kf+JuFvOUaf8Ze3YZzEUguqGw+kPK78HodAY6Bi+Sq6CvvOKxP0IlVRNg6nB+Fxs3MtLN6QVWUSDX6/fvyBwY2KpzInkExZ1TOaofmwPEef4+iLyJa+d/GRsFFjQy/lqRe1XNDz4KnmH/LVhP7PWrG7bP1B0H78+JVpDMw9LbpiLYawpWVi46PpV9XtqBLCkKwQTdHWoJ/QOOiH8W/EaNKHmXhEqdCGJQiv4kqEPw864lYutZhsMZqLesHeXUlaKbprmQTKh4aZTYbeLilghS0g3lkuOpOQlBThh9/DMTaaeebc4T+FKbgk4HM5ldLoQhbPlPo2YP73WEDAO4bpeuoj6rrFSm+Fg1pYRKWjS5gLqwp9iTc4b3W80pkkZUVQQtSXNswevUGBU6NjftvICl6L5t0ROaMDWob3OHSWY+HzsMUs6o8UXdrifw82bDdiRPfDrku8a3HZu5CMqXHSJQxx3iIikB9sxx/gJB0umpv4leIDofgdAQ8RXyU1cLA0v/ldTKvLkpWDuWjMV7WrcmAudBBTqbahYUx963tX87j/WZOxDx2GEqPiuNTSxpXf2to7hE2IiZIrtfzbrUQP7B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(1800799006)(186006)(66946007)(38100700002)(66556008)(66446008)(66476007)(76116006)(91956017)(83380400001)(54906003)(36756003)(5660300002)(8676002)(8936002)(316002)(6916009)(64756008)(122000001)(4326008)(3716004)(2906002)(41300700001)(38070700005)(71200400001)(86362001)(6486002)(6512007)(6506007)(478600001)(1076003)(26005)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkV3N0I4M0kwYlFDbW5VL3M5N2RmRkxzV3BtZEZMYUtmQXR6ZitWWXJaelBG?=
 =?utf-8?B?dnk1ZXRNcVYxYlQ5aXlNd3ZBSWdJcjU1anU4S1lXYi9PMWZRakZ6RFZES0Vu?=
 =?utf-8?B?aVdUNGJQcHZnLytlRHFaKzNsakFlMmdCbGFtdkdubVUrUmRGU0VPOTFPK0E4?=
 =?utf-8?B?dlUyVTlHNFp2RDdNdFdaOW1qdDZURGhlNS9uMVM2MDhIMGtmSE11RDduazFG?=
 =?utf-8?B?Tm9VbmZsS2V6MWNVemlmWjNiMmdFZTBSU1plcnVYeThLemJXVkY3d2NQZ2Fu?=
 =?utf-8?B?SlZ3V0FtdFBTOUtxdi9XazJPcC85TUp4QUY2YnVIOE4wT2psZWp2c0V0Snow?=
 =?utf-8?B?OFlDNHZYbm9YbzNEWW1UZHc4TDZsam1nVkt2eWxWOTcwNDhaeUx2bk9UajNG?=
 =?utf-8?B?TkdNYy95U3IxVVVQWVRiSlJYYzJkZHczcjJnRVVBQXlWTDRISWFYRisxUzRh?=
 =?utf-8?B?Ynp4dE1rZUxiSnVkSnBzRTB5SkNhQUJtanJMeVZaZjEwdWUrTVR6dWhaTkN5?=
 =?utf-8?B?QzVNbXFIbVk0eDBzd1NGdXd6emorZGNzdVdJYlY5Z3ZlUlRWOENCTDVLQW55?=
 =?utf-8?B?NEU3R3JJSS9CbjRKSGVVMldrZ0tNeEF3Y1NhK0RkSy9YTFdodE90K1ZHNWUr?=
 =?utf-8?B?aWd5UlVkUEt2NHhHa3V4V1B5bVFQamNONHU5UGRlNTY5OEljMnhpL3JEQTFq?=
 =?utf-8?B?NXA0bk5uQXRrb1hmOUdmUGpFL0RmZWFXNkdicFY1ZnRUTm9QbWk5WFY5Z1NV?=
 =?utf-8?B?dmhzS0RYa0FqVHNvZWY1a3lhT1pQMTcwdk12TUFYeGpKUWRBNFRqMmM1ZlBj?=
 =?utf-8?B?MXlxdFl5SkVheDBQKzQyU3o0bHg3OEZ0TFVhNHhZQTJtaFY2T1JXNU13Ukc5?=
 =?utf-8?B?SDhWTUlQdkNVdEVrVWZ1QUliREJpV0ZhU2UxQ1B6V2krR25wNVo0Y0NSSkU4?=
 =?utf-8?B?cUc5eW10ZHd4aG5MWElZQUxkTXlxd1N6NWxMelFEdTJGbXZoV1lVY2haQzhm?=
 =?utf-8?B?YUI1TmppUDgyZGdWeDhMNU1Vc2xZY2ZmcEhEUzNNYVduMmxzSW5tKzNoTE8r?=
 =?utf-8?B?cXBGZ2VaczY3S2syUGpVZWt2dnltbmF1NTlRU05COGdsU2RkY2ZwNUlWWDhV?=
 =?utf-8?B?TE5hWmRVdnVPdzRCaE1aWmhpR3NNTFdYcTgwSE5tREV6WDJJcGppWjM5NEJW?=
 =?utf-8?B?Vk1ReWtPSlU2NkUzYk9ObVJjU2xMd2t5MGVZNVM2dW1RT0E1SjRIUXVNVTFM?=
 =?utf-8?B?VU9HZndGRkw1NXBOcFBKUzRWOW5lVlVMVk5vRCtxYlZOenRFZXVvYTRqS1Bo?=
 =?utf-8?B?VnoxSEJsQ2Z3ellNajZNZCtrTUhVSDVLaW82SjVST1I2enZHYUpPU2NKb1NO?=
 =?utf-8?B?eU0xc0tIUmhPNXdTTEU4R3IyMFlVZ2s0VWxUOC91RXBuR2F6eUFoV01CclVx?=
 =?utf-8?B?Q3ZoWWhOS2ZvdmJMTkdjVUFlUTVyTjhLUUd3QlFEdkxNWU9TaDRXZmhHWEd5?=
 =?utf-8?B?VGovVGRpTjdNS1hhWjAyK3NBaUxJcUpBa0dESWNxNFhhcnVHY2YwZjB0Rjls?=
 =?utf-8?B?ZEJZNkY4YTgvVUw4bXc0T2VlZXltb3EvQUJIZmFhYktuL0VhbGloUUpJK3lR?=
 =?utf-8?B?M3dWMDN2S0R5VWI4TTFaaHJieVg1T3NyanFqejFXNis2UmQ5RmFzV2Uzellv?=
 =?utf-8?B?ZG9taTROT3lhQ1dIWU5QcEtoVzlTaUU4Skp1VThyckpKVS80c0dpa0JUWXY1?=
 =?utf-8?B?SWpSWUt2NE9ycFRrMkIzcisvUGdQb0NETlQxaE1WU21GbVpic2llQ3AxL2Jv?=
 =?utf-8?B?dmxWcFFRUzhsU3QzZllkc2J1NWpBVElwR2F4RExISHpWWndSTGFVckVJMXU0?=
 =?utf-8?B?ZGFGc3ZRZ0xYUytvMlFBdzIyTi84S0djYzVlVnliekp3UHdUUkJvVjdmK3FE?=
 =?utf-8?B?Yi9pblRIelhlSGQzZzBpRzlUREJNblRxUHd4VE00TkdZczliR3o4OFBjR2Zq?=
 =?utf-8?B?QitjT3pBZy91Q1lJUnZuUUppUHV4UnIvMmtjSDdtK3FUTmNZTHlhSFlFWHQ5?=
 =?utf-8?B?OHRUVWdjbEt3MTdEWjRIMG5XcGVOVWsvejNjMVFzUzI2ZzhiemZlNG9vbVlL?=
 =?utf-8?Q?S7OqC/d/IbSuoN3WyE7CeiBmO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3C9B127CC28C54E9B8397040120138F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?aDcwVWZxZ3NxQ29JNmI4NzZFaFk4RUUxVEJmMnVmay9FSXRLbGxhOHJKK1VM?=
 =?utf-8?B?bjJCUDZxcWVzdnpzL0ZlS2RMbGl0MXVpUEZ6ZHIwU3JJRHAvV0w3MTFjSWpW?=
 =?utf-8?B?Z09pNTBTNlZQU29qc3FlU1pnejRZOTlxbGlBMEZRdVBqOVZOazR5SzdQQm9B?=
 =?utf-8?B?eUp0bzVpM2FnTkhURUxuMmR3cU16cERBN052eFpqUkJJdzN1UTM0dDlweFMx?=
 =?utf-8?B?QlNJLzkwUGx3blprbVhLcHZWRWNjQm9kazQ3dU5KUUY1THpaaG9DTDY5dVpF?=
 =?utf-8?B?UENCRlIrckRSTVZQU0loL2NmbzdHUkVhQllybnF4NTYrcDJ4WUdQODlFMjB6?=
 =?utf-8?B?bUNKZkZoa2FQVTZ1OGN5YXZPaFpua0dyc3I3TlJrcURFYWNudFh3b0lNbWI1?=
 =?utf-8?B?KzZKaWZRcXhwZXpWbklYUFlqTHpJWW1kNXhjOWZ0S2ZUNzQyU2xMelAvdzdO?=
 =?utf-8?B?Um1KWXV0Y21tblZQYTkzNzNUUmRVek5vUitndWZRYkNZekk0OEFHOG9PdXA2?=
 =?utf-8?B?ZzN4TFJNMUdCeS9EelpnMEtpQlBQbk5ld1ZtYi81SlI5bGh2R1g2M0x5VEt6?=
 =?utf-8?B?Rlo1dWxsY09TMEV4K244R0xwUXNHMDRSbjZlV1MwY0FQUVI5WE5KWVp5MThm?=
 =?utf-8?B?eUJzaU11VXhRQ3hEb1JkcDVERDlabTlRYTdmd00wYzdrZ1B0eHM3UU9DRkhv?=
 =?utf-8?B?Rng1czZqRGpwL3F0Q1NJSjNXL3QvdW45d2s3eGdyT1IvbHBJL3BXMGhKUERm?=
 =?utf-8?B?ZTlaelVvOWY4NlVCN0syTW1GaURHbmlleWhVRE5FbXloZVd4aGNwaEZ3MXZT?=
 =?utf-8?B?TWRkN2U5eE40L1pYeGcrVHdOU0lIVkh2QmFWZHZ2My9TN1c1TDRDTHFLd1BR?=
 =?utf-8?B?cjlGZGRIZ2tKYjV5VUduaGhjUDN6VjlCSk5hKzlkbE9jSEg5L0tCU285YmVT?=
 =?utf-8?B?NnRlUWpyU1BYczVsRnFCdkhjSDYyUDZka2dZU3QyU1A0K2Q2ZnBqZmdtbU1h?=
 =?utf-8?B?UUh5aEJOQkdPeFVKSE1xYW9DWmlobTRQYVRJR09RU1Ixb2lHeWZJOFozL0Za?=
 =?utf-8?B?MVIzL25PeHV1dXBkVmVoNDFHZXlTeGdqTnMyTmMyYlpHaUIrVFpZNWVyZTgw?=
 =?utf-8?B?MEdWNjZFN3E4Z2FzaFdraUt1OXZGSHcybU1lTHhLaG50WU9OVEJObWxXcExE?=
 =?utf-8?B?RjlKVmw4eWdLU0c3QlF1aktmUUpCWkFxdkVGUldMY2tzbVErYm43d3krUXNl?=
 =?utf-8?Q?jFtG1RmsH5VFA5q?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e3440-2203-4557-bd01-08db9938b72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 00:28:27.2890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qauGYwtd3latf/+tZSkgJ20wjDQ1N7keu/O34OQ2Ij1f0V4KrzCFCVg1CtyR/EcPN9nJSCv3n1+ZoaAYW/pXAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
X-Proofpoint-ORIG-GUID: paDCKd_vQDvrUOGXYpmk84ZCSWhVSg67
X-Proofpoint-GUID: paDCKd_vQDvrUOGXYpmk84ZCSWhVSg67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_20,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=4
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=4
 suspectscore=0 priorityscore=1501 spamscore=4 adultscore=0 phishscore=0
 mlxlogscore=138 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308100001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgQWxhbiwNCg0KT24gRnJpLCBBdWcgMDQsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IEFu
IG91dHN0YW5kaW5nIHN5emJvdCBidWcgcmVwb3J0IGhhcyBiZWVuIHRyYWNlZCB0byBhIHJhY2Ug
YmV0d2VlbiB0aGUNCj4gcm91dGluZSB0aGF0IHJlYWRzIGluIHRoZSBkZXZpY2UgZGVzY3JpcHRv
ciBmb3IgYSBkZXZpY2UgYmVpbmcNCj4gcmVpbml0aWFsaXplZCBhbmQgdGhlIHJvdXRpbmUgdGhh
dCB3cml0ZXMgdGhlIGRlc2NyaXB0b3JzIHRvIGEgc3lzZnMNCj4gYXR0cmlidXRlIGZpbGUuICBU
aGUgcHJvYmxlbSBpcyB0aGF0IHJlaW5pdGlhbGl6aW5nIGEgZGV2aWNlLCBsaWtlDQo+IGluaXRp
YWxpemluZyBpdCBmb3IgdGhlIGZpcnN0IHRpbWUsIHN0b3JlcyB0aGUgZGV2aWNlIGRlc2NyaXB0
b3INCj4gZGlyZWN0bHkgaW4gdGhlIHVzYl9kZXZpY2Ugc3RydWN0dXJlLCB3aGVyZSBpdCBtYXkg
YmUgYWNjZXNzZWQNCj4gY29uY3VycmVudGx5IGFzIHBhcnQgb2Ygc2VuZGluZyB0aGUgZGVzY3Jp
cHRvcnMgdG8gdGhlIHN5c2ZzIHJlYWRlci4NCj4gDQo+IFRoaXMgdGhyZWUtcGFydCBzZXJpZXMg
Zml4ZXMgdGhlIHByb2JsZW06DQo+IA0KPiAJVGhlIGZpcnN0IHBhdGNoIHVuaXRlcyB0aGUgY29k
ZSBwYXRocyByZXNwb25zaWJsZSBmb3IgZmlyc3QNCj4gCXJlYWRpbmcgdGhlIGRldmljZSBkZXNj
cmlwdG9yIGluIGh1Yi5jJ3Mgb2xkIHNjaGVtZSBhbmQgbmV3DQo+IAlzY2hlbWUsIHNvIHRoYXQg
bmVpdGhlciBvZiB0aGVtIHdpbGwgY2FsbA0KPiAJdXNiX2dldF9kZXZpY2VfZGVzY3JpcHRvcigp
Lg0KPiANCj4gCVRoZSBzZWNvbmQgcGF0Y2ggY2hhbmdlcyB1c2JfZ2V0X2RldmljZV9kZXNjcmlw
dG9yKCksIG1ha2luZw0KPiAJaXQgcmV0dXJuIHRoZSBkZXNjcmlwdG9yIGluIGEgZHluYW1pY2Fs
bHkgYWxsb2NhdGVkIGJ1ZmZlcg0KPiAJcmF0aGVyIHRoYW4gc3RvcmluZyBpdCBkaXJlY3RseSBp
biB0aGUgZGV2aWNlIHN0cnVjdHVyZS4NCj4gDQo+IAlUaGUgdGhpcmQgcGF0Y2ggY2hhbmdlcyBo
dWJfcG9ydF9pbml0KCksIGFkZGluZyBhIG5ldyBhcmd1bWVudA0KPiAJdGhhdCBzcGVjaWZpZXMg
YSBidWZmZXIgaW4gd2hpY2ggdG8gc3RvcmUgdGhlIGRldmljZQ0KPiAJZGVzY3JpcHRvciBmb3Ig
ZGV2aWNlcyBiZWluZyByZWluaXRpYWxpemVkLg0KPiANCj4gQXMgYSByZXN1bHQgb2YgdGhlc2Ug
Y2hhbmdlcywgdGhlIGNvcHkgb2YgdGhlIGRldmljZSBkZXNjcmlwdG9yIHN0b3JlZA0KPiBpbiB0
aGUgdXNiX2RldmljZSBzdHJ1Y3R1cmUgd2lsbCBuZXZlciBiZSBvdmVyd3JpdHRlbiBvbmNlIGl0
IGhhcyBiZWVuDQo+IGluaXRpYWxpemVkLiAgVGhpcyBlbGltaW5hdGVzIHRoZSBkYXRhIHJhY2Ug
Y2F1c2luZyB0aGUgYnVnIGlkZW50aWZpZWQNCj4gYnkgc3l6Ym90Lg0KPiANCj4gSXQgd291bGQg
YmUgbmljZSBhdCBzb21lIHBvaW50IHRvIG1ha2UgYSBzaW1pbGFyIGNoYW5nZSB0byB0aGUgY29k
ZQ0KPiB0aGF0IHJlYWRzIHRoZSBkZXZpY2UncyBCT1MgZGVzY3JpcHRvcjsgcmVpbml0aWFsaXph
dGlvbiBzaG91bGQgbm90DQo+IG92ZXJ3cml0ZSBpdHMgZXhpc3RpbmcgZGF0YSBlaXRoZXIuICBU
aGlzIHNlcmllcyBkb2Vzbid0IGF0dGVtcHQgdG8gZG8NCj4gdGhhdCwgYnV0IGl0IHdvdWxkIGJl
IGEgZ29vZCB0aGluZyB0byBkby4NCj4gDQoNClRlc3RpbmcgZnJvbSBHcmVnJ3MgdXNiLW5leHQg
YnJhbmNoLCB0aGlzIHNlcmllcyBjYXVzZXMgcHJvYmxlbSB3aXRoDQpkZXZpY2UgZW51bWVyYXRp
b246DQoNClsgICAzMS42NTA3NTldIHVzYiAyLTE6IG5ldyBTdXBlclNwZWVkIFBsdXMgR2VuIDJ4
MSBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkDQpbICAgMzEuNjYzMTA3XSB1c2Ig
Mi0xOiBkZXZpY2UgZGVzY3JpcHRvciByZWFkLzgsIGVycm9yIC03MQ0KWyAgIDMxLjk1MjY5N10g
dXNiIDItMTogbmV3IFN1cGVyU3BlZWQgUGx1cyBHZW4gMngxIFVTQiBkZXZpY2UgbnVtYmVyIDMg
dXNpbmcgeGhjaV9oY2QNClsgICAzMS45NjUxMjJdIHVzYiAyLTE6IGRldmljZSBkZXNjcmlwdG9y
IHJlYWQvOCwgZXJyb3IgLTcxDQpbICAgMzIuMDgwOTkxXSB1c2IgdXNiMi1wb3J0MTogYXR0ZW1w
dCBwb3dlciBjeWNsZQ0KWyAgIDM0LjgyNjg5M10gdXNiIDItMTogbmV3IFN1cGVyU3BlZWQgUGx1
cyBHZW4gMngxIFVTQiBkZXZpY2UgbnVtYmVyIDUgdXNpbmcgeGhjaV9oY2QNClsgICAzNC44Mzky
NDFdIHVzYiAyLTE6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvOCwgZXJyb3IgLTcxDQpbICAgMzUu
MTI5OTA4XSB1c2IgMi0xOiBuZXcgU3VwZXJTcGVlZCBQbHVzIEdlbiAyeDEgVVNCIGRldmljZSBu
dW1iZXIgNiB1c2luZyB4aGNpX2hjZA0KWyAgIDM1LjE0MjI2NF0gdXNiIDItMTogZGV2aWNlIGRl
c2NyaXB0b3IgcmVhZC84LCBlcnJvciAtNzENClsgICAzNS4yNTcxNTVdIHVzYiB1c2IyLXBvcnQx
OiBhdHRlbXB0IHBvd2VyIGN5Y2xlDQpbICAgMzcuMjU4OTIyXSB1c2IgMS0xOiBuZXcgaGlnaC1z
cGVlZCBVU0IgZGV2aWNlIG51bWJlciA1IHVzaW5nIHhoY2lfaGNkDQpbICAgMzguMTE1MDUzXSB1
c2IgMi0xOiBuZXcgU3VwZXJTcGVlZCBQbHVzIEdlbiAyeDEgVVNCIGRldmljZSBudW1iZXIgOCB1
c2luZyB4aGNpX2hjZA0KWyAgIDM4LjEyNzQwN10gdXNiIDItMTogZGV2aWNlIGRlc2NyaXB0b3Ig
cmVhZC84LCBlcnJvciAtNzENClsgICAzOC40MTcwNjZdIHVzYiAyLTE6IG5ldyBTdXBlclNwZWVk
IFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlciA5IHVzaW5nIHhoY2lfaGNkDQpbICAgMzgu
NDI5NDI4XSB1c2IgMi0xOiBkZXZpY2UgZGVzY3JpcHRvciByZWFkLzgsIGVycm9yIC03MQ0KWyAg
IDM4LjU0NTMxNV0gdXNiIHVzYjItcG9ydDE6IGF0dGVtcHQgcG93ZXIgY3ljbGUNClsgICA0My4z
NDczMTJdIHVzYiAyLTI6IG5ldyBTdXBlclNwZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51
bWJlciAxMSB1c2luZyB4aGNpX2hjZA0KWyAgIDQzLjM1OTY1OV0gdXNiIDItMjogZGV2aWNlIGRl
c2NyaXB0b3IgcmVhZC84LCBlcnJvciAtNzENClsgICA0My42NDkzMjNdIHVzYiAyLTI6IG5ldyBT
dXBlclNwZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlciAxMiB1c2luZyB4aGNpX2hj
ZA0KWyAgIDQzLjY2MTY4MV0gdXNiIDItMjogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC84LCBlcnJv
ciAtNzENClsgICA0My43Nzc1NjZdIHVzYiB1c2IyLXBvcnQyOiBhdHRlbXB0IHBvd2VyIGN5Y2xl
DQoNCkkgd2FzIHRlc3Rpbmcgd2l0aCBvdXIgaG9zdCBhbG9uZyB3aXRoIG90aGVyIGNvbW1vbiB2
ZW5kb3IgaG9zdHMgd2l0aCBhDQpmZXcgMy54IGRldmljZXMuIFJldmVydGluZyB0aGlzIHNlcmll
cyByZXNvbHZlcyB0aGUgaXNzdWUuIEkgZGlkbid0IGRvDQpleHRlbnNpdmUgdGVzdHMgZm9yIHZh
cmlvdXMgc3BlZWRzIG9yIGRlYnVnIGl0LiBJIGp1c3Qgd2FudCB0byBub3RpZnkNCnRoaXMgZmly
c3QgcGVyaGFwcyB5b3UgY2FuIGZpZ3VyZSBvdXQgdGhlIGlzc3VlIHJpZ2h0IGF3YXkuDQoNCkkg
Y2FuIGxvb2sgaW50byBpdCBhbmQgcHJvdmlkZSBtb3JlIGluZm8gbGF0ZXIgdGhpcyB3ZWVrLiBJ
ZiB5b3Ugd2FudCB0bw0KcHJpbnQgYW55IGRlYnVnLCBsZXQgbWUga25vdyBhbmQgSSBjYW4gcHJv
dmlkZSBsYXRlciB0aGlzIHdlZWsuDQoNClRoYW5rcywNClRoaW5o
