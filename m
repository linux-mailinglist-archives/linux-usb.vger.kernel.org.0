Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6DE6B2F4F
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 22:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjCIVJl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 16:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjCIVJj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 16:09:39 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FACF6C40
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 13:09:32 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329K5vnI003116;
        Thu, 9 Mar 2023 13:09:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=illn6HlqxrvZ+hps1mCuToMuE5gFj4qsNCBBreeivCE=;
 b=pgt9vF+8NQy5/W/Rj3rf44Plr7ElUrBLXY0r27K3yfXwiJ5mXTi4Shpz1TU5w09er/KO
 sh0xmWSz9ne0HoXn7qnOp4cT0q3gKpAx3VSw7s+cCpaTnhBnzneGwCWMXpW1V1yIxbLu
 yonfSaVBuWoR2nwWq3OlqF/xMi7bjwT5eReUlKNYefRb9hHleHiisCgUcfCR5e3gd51r
 gznXmp11IkTBzqUAVK0iNNK8nbMI0YkpyHFvGFCXCoedZn/ghQP1G4Snqq3IckcCkv53
 PcoXpj2cL0PChFJNZZtlmk3yzLo60XceRufb/QMlHOZSkIZYDaZxrmGpJvuTEwH/Fn4u Ew== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3p6tgs69kv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Mar 2023 13:09:23 -0800
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3D5D240103;
        Thu,  9 Mar 2023 21:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1678396162; bh=illn6HlqxrvZ+hps1mCuToMuE5gFj4qsNCBBreeivCE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YlcqTN+XscamcgNOPzlC+xAAxoYdtKpCqyFUNvIet/ZRZWvsyNef4K/7Pip24J/t/
         XvGeS4ChM5v2GOR/p2eRGokdk5QNJuY9FG2NG5lSlncz4ZO84r+ML9KIRncHDdhXHg
         gq9bJZfppWxJNEsCqL3IHxSirtIPkpUqDRFsfuCTOsTyfOvR8JNuKx4W98LjQBpJDj
         4DqiB/TfmbbmZYXN75HATurNyuFvkMtmWeedJYmi7vJcM9FV6KWxh55L50ikGo9tDT
         LhCclVhHqCDEnnXVe5LLPOKjoyTnS10cX0Cc/7uKP017YJrG4YlpySn5MJ6buUHlFQ
         C3ym2SCcAGQZw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A0712A0253;
        Thu,  9 Mar 2023 21:09:21 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 885F8800BD;
        Thu,  9 Mar 2023 21:09:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NwZy2wlk";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC3rgEZOR9HMTqw6VtpyNKPlserDBs53EhWnplmfof3Hrkg87CFZCkBhjj6bDbGA0P6X31KRcpuYoKcCARO1wiT55PBCWrKRTjpcC5ydh8aEmPoZudCJSL7gU291uMKJVHWPPC2Lj6dGic5Uj59jC0jZ+oUsewu1HAcYwHFxp0Oqu8bUSIE/EKlik+k+MOS31e2oTIJEkEK2ZzlilYJYKkHFkD0M0p7M++HWA55LrxVcxYLyTKbRtjNjprQfbUuLOIcz7rEGY6HxkKtFryGm/dfcy/ConLDUKIHHaOYhotTqdAefo1MK25nEr0nyg6vkIzTCz1dt/YURP0g152T8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=illn6HlqxrvZ+hps1mCuToMuE5gFj4qsNCBBreeivCE=;
 b=NhDPczjB/6p1xvkGr1b5vey3TQ5nZuNvNNG68D1RfaHUACLyUT3+3mSFxswdUWxZJmJcK5tBn85TTPwmBMVQMgNdc42WGeADG69nFrQt5c8QIJcjIHs0cJbamqcswc+VceQl8B58kAljxBlSGIKkkKtfMvOV6s6LMktsZsL38Tr0vrk4sz3O/Qh7R65Yrnz722MWwiRUGyKjPC9PDa1E8ebI44jAcberib1Omm5yMa0x/FAUKSlsBOGWLPdHGEs29wGBAsKhMIoS3s3NNay096alOjX08YMo8czQbaDsUZ0LC0KTnoDH2LAmPBdwxLZi7PurhhMBAi5QcjF6DGEZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=illn6HlqxrvZ+hps1mCuToMuE5gFj4qsNCBBreeivCE=;
 b=NwZy2wlkxtmRnQBGTcySVfd4tZFCOPduslz29XKUBwURan8k69lCZUZHtwB4tq6I+1Lt9DqT6Ae+Dx6vrLd5fQo6QJeOycmdPX6FY6VbFGEhCrsfbeEXUoKUiRYXmwBUHeYf+5zYzM+vPmJj+ixy9dsau18KXbLGJjxEeBqfvc0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 21:09:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 21:09:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIAgAAPLgCAAAUXgA==
Date:   Thu, 9 Mar 2023 21:09:15 +0000
Message-ID: <20230309210907.r5daisahfzyhjl46@synopsys.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
 <ZAjE+p4IoXk/kvXu@kroah.com>
 <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
 <ZAja0So7EDH5FfI0@kroah.com>
 <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
 <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
 <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
 <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
 <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
In-Reply-To: <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA0PR12MB8325:EE_
x-ms-office365-filtering-correlation-id: c047da0e-08ab-44d8-6c95-08db20e28a1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rc5F3ZmEecdrqpwl47x2xz346Ii9xh5NLzJlQuIgJREJ4N/e/qbEwln5tdWm+iKqJbUGFrFSMAn6azB9bEh56nN6FYGXq1FjlVOK6NRqR8IqnyG17xt/4tXfP/14Y60ZP2Rhbx+CDqgxtIb4b6oAU4v1N5pSnuTUxD/0G8uZCWN8RbwEtturA3A5iflxYX1Ef+NjWKPbc9FWIoML0J0ERO0A3q2d7ZsENj0mUOj6B3tTPg6lNuiAMe6Uqwz+8p4RbKTOglR8U4y8IaD53KsDqYa6fq+CC4icjKuHv057YB3PrQFqwNvQPQs0s4wZ9InpQ/mrCCxIOI7EW/Gf/Rg+0n14/4WCO+jsKrtRx8F5u+MMRi3O7OmJrmtg9WgzFJaZZBKyCCFmrlntaXDORBXFVBKmUUh6xggTAMTTrZvsaV8jtg289ue4IDNLC7e67IM0e+v+HXLZQP57gS6VWwIVvH3GUCk4H9VicMftyssP0Fev41AEvEReQ7FrOhhQNLnN8NvzUWUBEkh615mNZDsaye8+4bvHFcL36e3egG0/UE8o9e9J+nKTQNl1z8uPnqB526RtiTdvCoeMAwHsQxXSQKiYUwzG5WiwDwmlLdziLV1xY3ZqHjTnIQ5sK65B9+Gt9kMYql8zP2yW/qem4OkDnoamL4SgHzS9lc2scHhJYnzIWQwo2l9wtAcb/FDN4NPHthfe2USoqDPigKtV8hRi1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(36756003)(83380400001)(1076003)(26005)(186003)(6512007)(71200400001)(6506007)(2616005)(6486002)(66476007)(66946007)(66556008)(86362001)(6916009)(8676002)(66446008)(76116006)(64756008)(8936002)(4326008)(2906002)(41300700001)(5660300002)(316002)(122000001)(38100700002)(478600001)(54906003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzJQcUduQmFEeWt5SzhsWW0yVldVazNiUzJVYmVTeXh4Uk9wM2hLZzFsOUJa?=
 =?utf-8?B?Z2hra0Z1cTVJbk9KTFNrOVZBbzVMV0JiUW1zdUUrR2NSYzR6U25XNXN3Qzhx?=
 =?utf-8?B?NlNOQWMwNkpoY0dQUXhqRTRLbjVJZVc2V3JPd1FrZktXcjcza0E2ZkV1Y21O?=
 =?utf-8?B?UWo5Wjkwb3RXZFhHUmxsdU5sSmF6S1liTjVJSisxOERTOWlPdkduenJhWGZs?=
 =?utf-8?B?Qm50MzM3NHJIMFRXZ3U5anZJckx4VnVlT0doWEtoci9LeEZBT1FOMUc1cFVr?=
 =?utf-8?B?ejhhbDc4NTRPS2VLNE91MWREbEpTazV4NVFJNzNnM2c5QXd0VC9XMm1sbzJG?=
 =?utf-8?B?eUI1bWl1SUxidFhqSExCaCttaXVaaTlFeGdwYVZ2Q284cFdoTzB3enlzbzl0?=
 =?utf-8?B?dG11bzcwaDJGS1NRaXB6TnJzbFlQLzAwZlliSDVwTDhyUVFNZ2gwc1VndXVk?=
 =?utf-8?B?dW8zY3ZlY0pHVU02Q1pxNHdKZUdsVHBudTJZZzBjNFpZSVdRRDl3emI3Tzhn?=
 =?utf-8?B?bU4zT0ZyZFhIT2FaK3MxakFDSFJTK1RHbys5RkhnN25KekFocFVmczhHYmZy?=
 =?utf-8?B?YWo3b01MZVZyb0hqZytmWHRLbGRMOW4xcG5Id0lZcnpjQkRCZHNPZVRWUTYr?=
 =?utf-8?B?c0daaHdRWlUvUjlEb1h3UWRsRG01UW1ndHJLU290TkgzL093MDg3Q1hqRTU5?=
 =?utf-8?B?NFVtZ1FTL1dlQU9ISmhoTkhldHk0TE56NzhzZ1JBa0VnNDYwb0s3UkZaaVhY?=
 =?utf-8?B?ZnhJSzE4ZERwTXRhdTlpUlczQUlmVzZmSHdxdEJpdkNMZjR2eCtOWXJmeXhz?=
 =?utf-8?B?VVZnNGY0d2ZjT0pKUTVpdmM3U0xqeVhnaXlwWkhXblhDTjB3Nm95T296TWRn?=
 =?utf-8?B?TUsrZ2xxc3puSWhSZ3BoYi9obE9OaEdQUGdaVitZb3RTWHdUT2d5OUZPVzZP?=
 =?utf-8?B?QWtIRmx1MUNXVnB3R3JibWJhdXlqUmx3TlU1QTZGenlHWFNZTjFlbWJ5ckFS?=
 =?utf-8?B?a2pWdWVNU0lUYXNxbmUxU2FZOStadU1CKzcwTEltL2czNHVMRFYzK0ZGdjJh?=
 =?utf-8?B?ZTk3TjlsZldQV1NRMWJyMGQzNTBaU2tSNkIyQ1lxb3RabnUrR1hiS1UvVldm?=
 =?utf-8?B?bU9CYWFCbmhSeUpVd1ViRzBKVWNVSXUwVXRWWmlOWC9KTzE2enZjR0dnMHpW?=
 =?utf-8?B?R0EvYVd5YzljYkRDSVI3ZWpUT0hSUzhWNnZHOFlmUmVIc056QVBVZW1zTzh2?=
 =?utf-8?B?c2dzTG8xa2ZraVJIdWRyWVQyM3lvSm9tMjBTZVUwUnNXWit4QURPdHdMSk4w?=
 =?utf-8?B?ZnRCLy8zcElxNnFTMnFEWCtBa0VvQXJvR09jMVpWOEs2M0s4cnpBaE56cjRY?=
 =?utf-8?B?WUxLOXpSdVN3cDNYbEMvUk9YMW1rRkx5SUdFMzg5S2wrQjMzaUxUcStFb1JS?=
 =?utf-8?B?LzEyZjNLbkxFY3NYV01vTEJoc1NpcWV1RnlBQkxjYS9aQTU1TVZRekhYNjdB?=
 =?utf-8?B?Yi9yNDBMVldsYmcvcENzdFBiM3dudk5VblArd1NERUdxUmFNL1FJU081dmtP?=
 =?utf-8?B?YlZYQUZOdmt3SlA0SmxhRXArYkV3OC9oelJFTkU5ZE9wbkJxSDJhV1ZNYmJq?=
 =?utf-8?B?bDlvbmdDREEyOE5XNGRzVUhoSGllUU85SXY0RmRVYksrSUttNXRjNzJkQ2Rm?=
 =?utf-8?B?WnR0b0pFT0Z1eWIrREY4c2x3WHVZZnJJMVBuZ1BBSUtLTWFaMGhoR0s4aE9X?=
 =?utf-8?B?bnJ1OWRxMUpMYklrbmJwZVdja1lYOE5WUTQxU21aRTlpT1pSSHRQWjRodm8z?=
 =?utf-8?B?OEhBQThpRVN4WkVGWmd4dlYzWmx6VWlGLys0Q2lIdm04Tk9McmJKeDg3YUc0?=
 =?utf-8?B?c2l2SytNRFU2dmtWWDhlWURkWjA4SmhwcDFmT01TK01PMFlsd1pycmZ1Uklo?=
 =?utf-8?B?bGhyYnpmNVJYeEJFSEdITThzSUptNHNoZGR5dExKV2w1aTJuVFQxVFVSem84?=
 =?utf-8?B?K0doaHlOUTg1SG4rNG5zcGp4WXRNVnNBeVdZR3NER1B2elROVU9uYUxobk5o?=
 =?utf-8?B?ZHFiVm16UDMwdjRNaDFob3RyME1rWkZHeENhZURlbVRMeTBkTjJ6SWI0NFBX?=
 =?utf-8?Q?ouLVy2ojnUlepsNp1ndXg67EF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51085420E9B7E643911761B59A4F138A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3/SlMvfRzobK5JLp5tFpWkO+2porVBQQOXE0IniugYSSQFMuTNBQjRFaiZRITz8zr1RieBWiE2MA++c4n/AIEZxWyRo4Da98q5DQqjEG3uCNkjjc/0CJNYIXkplaKUgSBKdkrurW/fKncsn+CybwyYqY1Q4yNeE3rMS+WxqcIlZkhU0zo9/n6eCg/R3Q/r7FGUcvhE9n2ta7gjkHXA9JUMvpTFQ+APdT0n/fL8qbd/Utv+VVit6V92bSzep7bHi+gvh8yaFkseS0zXKEr/JoecQocsp51YCsm7gfJuhOA9sFs1uE9+Zb1oiQCGJqDUEM4FJAwH7Li7NeEzlBgw49Wz7BE3zGQvwcNx3UxqH7Zpu0uR5JtGA3YuEmxBxOVf0Rn2n7sYFc/w4tN8dLV/YUxNxW7KbdUui6PAKp4zBWbkEMobgGd6eZl7bxvtfn7h/oMhYAGuGaWRSSgP7ZLbx0VLPid6WySFCPCgmfg77Wzb7eAf33fORS1qtQGjxrylIyJkrkrFInJf+maDWdxKmYiDRRRHJ89ui6n8dYqpKlTlHYUCCArzqLa/AEptSuc14HQJnZs7U2O88iYTm3qHx7r8YxJQGpDHNLWgNZvvG4KUSal+vk/MNNXfowN9cxRoU/ndO20qbKfHc9AmBFvufONoLaBwMAki/X+Lchm1O0ubMYLIdUDfg65HST7UZ/Ta2s1/79wlX5W/nHriJ54MZLaN/iLkeoIZndcin/rvbIw5853JTGOA6w1S9Vs6weKtxWERPTm9obTkQ6IQs9lWkjiGfQGATYs0v1XS3HS7K/WMnsy8euItUFOXPP46c0Fw/SlKzBOGc5KaqFgvvBwXQyW3NxZ0YPAppP2DU043DeFDzfC0VCmSJYNWwN2B+1zol764VqVYQycGy8Oaxbx9oxsCEjsqknyNsRkVZVMdS+9P4=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c047da0e-08ab-44d8-6c95-08db20e28a1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 21:09:15.4248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2nciJFvJaFhlEL2FdwewbgOXy9vwM8ZVVX7q62tfmmklenSEzHtnT+OD0+3xV26Q84AnqEGSWQf95uA9cADTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325
X-Proofpoint-ORIG-GUID: T53dtH27WgnloDYn-W-wHPT_O6uYvQ4W
X-Proofpoint-GUID: T53dtH27WgnloDYn-W-wHPT_O6uYvQ4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_12,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=789 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090171
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXIgMDksIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+IE9uIFRodSwg
MjAyMy0wMy0wOSBhdCAxOTo1NiArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFRo
dSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gT24gVGh1LCAy
MDIzLTAzLTA5IGF0IDE3OjMyICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4g
PiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMjI6MjYgKzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3Jv
dGU6DQo+ID4gPiA+ID4gT24gV2VkLCAyMDIzLTAzLTA4IGF0IDE5OjU4ICswMTAwLCBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIFdlZCwgTWFyIDA4LCAy
MDIzIGF0IDA2OjEyOjUxUE0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+
ID4gPiA+IE9uIFdlZCwgMjAyMy0wMy0wOCBhdCAxODoyNSArMDEwMCwgR3JlZyBLSCB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNToxMDoxN1BNICswMDAw
LCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gd2UgYXJlIHVzaW5n
IGZzbC1sczEwNDNhLXJkYiBiYXNlZCBkZXNpZ24gYnV0IHdpdGggYSBsczEwMjNhIFNPQyBhbmQN
Cj4gPiA+ID4gPiA+ID4gPiA+IHVzZSBVU0IwIGluIGdhZGdldCBtb2RlIHJ1bm5pbmcgZWl0aGVy
IE5DTSBvciBSTkRJUyBldGhlcm5ldCBvbiB0b3AuDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiA+IFdoZW4gd2UgY29ubmVjdCB0aGUgZ2FkZ2V0IHRvIGEgUEMoTGludXggb2Yg
V2luZG93cykgb3ZlciBhbiBVU0IyIGh1YiwNCj4gPiA+ID4gPiA+ID4gPiA+IG5ldHdvcmtpbmco
TkNNIG9yIFJORElTKSB3b3JrcyB3ZWxsLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+ID4gPiBIb3dldmVyLCB3aGVuIHdlIGNvbm5lY3QgdGhlIGdhZGdldCBkaXJlY3RseSB0byB0
aGUgUEMvbGFwdG9wIHdoaWNoIHVzZXMgVVNCMw0KPiA+ID4gPiA+ID4gPiA+ID4gd2Ugc2VlIHNv
bWV0aGluZyBvZGQ6DQo+ID4gPiA+ID4gPiA+ID4gPiAgIFBpbmcgZnJvbSBQQyB0byBnYWRnZXQg
d29ya3MuDQo+ID4gPiA+ID4gPiA+ID4gPiAgIFBpbmcgZnJvbSBnYWRnZXQgdG8gbGFwdG9wIGRv
ZXMgbm90LiBIb3dldmVyIGlmIHdlIGFsc28gcGluZyBmcm9tIFBDIGF0IHRoZSBzYW1lIHRpbWUg
d2UNCj4gPiA+ID4gPiA+ID4gPiA+ICAgc2VlIGdhZGdldCB0byBQQyBzdGFydCB3b3JraW5nLg0K
PiA+ID4gPiA+ID4gPiA+ID4gU2VlbXMgbGlrZSBwaW5nIGZyb20gdGhlIFBDIHRpZ2dlcnMgdGhl
IGdhZGdldCB0byBzZWUgaW5jb21pbmcgcGtncyBzb21laG93Lg0KPiA+ID4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+ID4gPiBBbnkgaWRlYSB3aGF0IG1pZ2h0IGJlIHdyb25nIG9yIGhvdyB0
byBkZWJ1ZyB0aGlzPw0KPiA+ID4gPiA+ID4gPiA+ID4gS2VybmVsIDUuMTUuODcNCj4gPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA1LjE1LnkgaXMgdmVyeSBvbGQsIGRvZXMgdGhpcyBh
bHNvIGhhcHBlbiBvbiA2LjI/DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiBJIGp1c3QgdHJpZWQgNi4xLjE1IGFuZCB0aGUgcHJvYmxlbSByZW1haW5zLCBJ
IGhvcGUgdGhhdCBpcyBjbG9zZSBlbm91Z2ggPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJ
dCdzIGdvb2QgZW5vdWdoIDopDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEhhdmUgYW55IGxv
Z3MgYXQgYWxsIHRoYXQgc2hvdyBhbnkgcHJvYmxlbXM/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiBObywgZG9uJ3Qga25vdyB3aGVyZSB0byBzdGFydC4gVGhlcmUgYXJlIG5vIGVycm9ycyBsb2dn
ZWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAgIEFsc28sIHlvdSBtaWdodCB3YW50IHRvDQo+
ID4gPiA+ID4gPiAgY2M6ICB0aGUgZHdjMyBtYWludGFpbmVyLi4uDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gSSB0aG91Z2h0IEkgZGlkIGJ1dCB0aGF0IGxvb2sgbGlrZSBvbGQgaW5mbywgYWRkZWQg
VGhpbmggTmd1eWVuIG5vdywgdGhhbmtzDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gIEpvY2tlDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICB0aGFua3MsDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ICBncmVnIGstaGoNCj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
IEZvdW5kIGFuZCBVU0JDIERvY2sgYW5kIGNvbm5lY3RlZCB0aGF0IGJldHdlZW4gZ2FkZ2V0IGFu
IFBDIGFuZCB0aGlzIGFsc28gd29ya3Mgd2VsbC4NCj4gPiA+ID4gU2VlbXMgbGlrZSBhIGh1Yiwg
cmVnYXJkbGVzcyBvZiBVU0IyL1VTQjMsIG1ha2UgdGhlIHVzYiBuZXR3b3JrIGZ1bmN0aW9uIGlu
IGJvdGggZGlyZWN0aW9ucy4NCj4gPiA+ID4gDQo+ID4gPiA+IEZvdW5kIG91dCBzb21ldGhpbmcg
aW50ZXJlc3RpbmcsIG9uIFBDOg0KPiA+ID4gPiBjZCAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8w
MDAwOjAwOjE0LjAvdXNiMS8xLTEvcG93ZXIgICMgV2hlcmUgbXkgZ2FkZ2V0IGlzIGNvbm5lY3Rl
ZA0KPiA+ID4gPiBlY2hvIDAgPiB1c2IyX2hhcmR3YXJlX2xwbQ0KPiA+ID4gPiANCj4gPiA+ID4g
Tm93IHBpbmcgd29ya3Mgbm9ybWFsbHkuDQo+ID4gPiA+IA0KPiA+ID4gPiBTbyBMUE0gZG9lcyBu
b3Qgc2VlbSB0byB3b3JrIHByb3Blcmx5IG9uIGdhZGdldC4gQ2FuIEkgZGlzYWJsZSBMUE0gc29t
ZWhvdw0KPiA+ID4gPiBvbiBnYWRnZXQgc2lkZT8gDQo+ID4gPiA+IA0KPiA+IA0KPiA+IFRoZXJl
J3Mgbm8gb3B0aW9uIGluIGdhZGdldCBjb25maWdmcyB0byBhbGxvdyB5b3UgdG8gZG8gdGhhdCBh
dCB0aGUNCj4gPiBtb21lbnQuIFlvdSBjYW4gZGlzYWJsZSBMUE0gaW4gZHdjMyBjb250cm9sbGVy
IGluIHRoZSBkZXZpY2V0cmVlIHdpdGgNCj4gPiAic25wcyxkaXNfZW5ibHNscG1fcXVpcmsiIGlu
c3RlYWQuDQo+IA0KPiBZZXMsIEkgZm91bmQgdGhhdC4gVGhhbmtzLg0KDQpBbHNvIG5vdGUgdGhh
dCBMUE0gaXMgZm9yIGRldmljZSBvcGVyYXRpbmcgaW4gdXNiMiBzcGVlZC4gSWYgaXQncyB1c2Iz
DQpzcGVlZHMsIHRoZW4geW91IG5lZWQgdG8gZGlzYWJsZSBVMyBzdXNwZW5kLg0KDQo+IA0KPiA+
IA0KPiA+IElmIHRoZSBob3N0IHB1dHMgdGhlIGdhZGdldCBpbiBzdXNwZW5kLCB0aGUgZ2FkZ2V0
IHdvbid0IGJlIGFibGUgdG8NCj4gPiBjb21tdW5pY2F0ZSB3aXRoIHRoZSBob3N0IHVudGlsIHRo
ZSBob3N0IHdha2VzIHRoZSBnYWRnZXQgdXAgYW5kIHN0YXJ0cw0KPiA+IHRhbGtpbmcgdG8gdGhl
IGdhZGdldCBhZ2Fpbi4gVGhlIGdhZGdldCBtYXkgYmUgYWJsZSB0byBzaWduYWwgdGhlIGhvc3QN
Cj4gPiB0byB3YWtldXAgdmlhIHJlbW90ZSB3YWtldXAuIERpZCB5b3UgY2hlY2sgaWYgdGhlIGRl
dmljZSBpcyBpbiBzdXNwZW5kPw0KPiA+IElmIGl0J3MgaW4gc3VzcGVuZCwgaXMgdGhlIGdhZGdl
dCBlbmFibGVkIHdpdGggcmVtb3RlIHdha2V1cD8gRGlkIHRoZQ0KPiA+IE5DTSBkcml2ZXIgc2Vu
dCBhIHJlbW90ZSB3YWtldXAgc2lnbmFsIHRvIHRoZSBob3N0PyBJIGRpZG4ndCB2ZXJpZnksIGJ1
dA0KPiA+IEkgc3VzcGVjdCB0aGUgTkNNIGdhZGdldCBkcml2ZXIgaXNuJ3QgY29uZmlndXJlZC9p
bXBsZW1lbnRlZCB3aXRoIHJlbW90ZQ0KPiA+IHdha2V1cC4NCj4gDQo+IFRoZW4gbWF5YmUgTkNN
L1JORElTIHNob3VsZCBpbmZvcm0vZGlzYWJsZSBMUE0gaW4gdGhlIGRldmljZSBkcml2ZXI/DQo+
IE9uZSBjYW5ub3QgaGF2ZSBoYWxmIGFuIGltcGwuIG9mIHRoaXMgZmVhdHVyZS4NCg0KTW9zdCBk
cml2ZXJzIGRvbid0IGZ1bGx5IHN1cHBvcnQgZXZlcnkgZmVhdHVyZS4gVGhleSBhcmUgaW1wbGVt
ZW50ZWQgYXMNCm5lZWRlZC4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIE5DTS9STkRJUyBkcml2ZXIu
IFBlcmhhcHMgeW91IGNhbiBwaW5nIGl0cw0KbWFpbnRhaW5lciB0byBzZWUgaXRzIGN1cnJlbnQg
c3RhdHVzIHRvIHNlZSBpZiBpdCBuZWVkcyB0byBiZSB1cGRhdGVkLg0KVW5sZXNzIHRoZXJlJ3Mg
YSBxdWlyayBmcm9tIHRoZSBob3N0L2RldmljZSwgd2Ugc2hvdWxkbid0IGhhdmUgdG8NCmRpc2Fi
bGUgTFBNLg0KDQpCUiwNClRoaW5o
