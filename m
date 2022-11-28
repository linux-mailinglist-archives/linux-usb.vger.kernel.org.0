Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66AC63B20C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 20:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbiK1TSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 14:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbiK1TRr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 14:17:47 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27DD2B18E
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 11:17:16 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASIb1CK005231;
        Mon, 28 Nov 2022 11:17:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=76FHNYNLlgNPDMeWDo18w4FafoILllxXiuzfTB83EOw=;
 b=FUT/hC02Z2GEudhJb0LAKQglsVGZwgfxK2AjugdzMj3SckEgqCqypn2hIJs4Uf86bvcG
 is3g2zhK/gLYZAZN0BYtNlcZTMi0XdBGNeTXyaTACNgUw1GJrDlaGtIRX74K84VOlUL2
 YRN+dYoC8IsAmJpP7Pnlv5JcZVBA/zy06sq9hhpY1DhKoVbSwbviwvLufj/2JGRDwRp3
 qVZqJnYCjwSphhjfxd2nly6gsPJnjlycneoW348MQSR9HIePuTJb3P2wtCAptk+q1c7F
 G3eCErXqExbopHWGf1H2KJ5oATugWAhnOHa/r5opGJU1BUKeYl6+sNx50T2sMgX8j0BJ Lg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3m3jm1083h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 11:17:05 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E9FBC00FD;
        Mon, 28 Nov 2022 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1669663024; bh=76FHNYNLlgNPDMeWDo18w4FafoILllxXiuzfTB83EOw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Wd8M0+54H8jikvSJo6FOqEQSwX2YtIijaUuXqEuA9uTsM37r1j6+6MKQ79poCa0tb
         Sxb4a8uAAXajenwFHltIN0cQsQbZNOcMVkfR+LOrVW9O81qCGODEMT5ceNMGEXZlfy
         vqErUpwcsxXQGwVqWE23CR4zgpqMwslIvWe716GGbK0ZuJm0BuT2g7cb/L/iKbtOEA
         UU/1ejTlOgw5ju5thiTJo8hWbOTSrQEdNgt5QQuccVp93IfyK7lLHTNcSOsSLq4gl9
         aYfpUNnWPnPWlzUD6hiIU5l+tbju/KOKwHsXTlcb+kLyYgPjVpMuxm0dd4HkFW81yT
         U/fPGwSD52XoA==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 69DFAA005C;
        Mon, 28 Nov 2022 19:17:02 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 79D00400D7;
        Mon, 28 Nov 2022 19:17:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rx7cY3oU";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWQTbYzwGiaB4xd7C1/bXbYK7lrYoXhW6dOF63PMSKT5M+KExQ5zLFcf8lPybuglGXZuLIpDD9AiEpDuaOkaMtI1jFovRhNCxODNI4fzP14nbVbnKe8ZQhp35RNY01KROXQMkbvM67AUOMbFftmlq/sqbj1k+WsCqTpj5PqkuY1daaaVikh5gsT8xyZ38UUvCNZm/munAdJUwIgygN3TxqRZKzsFZiXz1Y96ukaxkZRqrboUFTK825vP7pNh6wsp3tSqVOdT2BdL0zt0fM6q/gcstK3mPB0iLiCjEq/861MpG+V8Gi78+1hOdBSuDTOgMI2Rvt1RkvMDbG2q4pkjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76FHNYNLlgNPDMeWDo18w4FafoILllxXiuzfTB83EOw=;
 b=VzZOfXeXeDehHKye5mr6Bm8kXqPeDKj4o5XuG0vReQ0MwoQTKGIimIf6PCQhESDYFepuKjh6q6aiZYqKvDYvD/KK1UC+4SBcu6QfhsFLkyT/mKc6/h0rUqyTN6FS36IAxYp19AJbEAJnZdB5l+gun4HXsvlCh+3o1yI3Yb+BUapcNPEvAU++e1oqUWp+iGQGQTRV8MNTfU8ps2tnHDDF9Gx2zyjTb9PiU2nqduf/NjQr9pR6H38fR8kfAcYbXHlDx+QB+1qlw9vfHjjYvQZXkGharaPSkweXWzVw6qtrhUWlfQ3+LAKcq0EBsiKDxLrRh5SwsUmLE7GjTKdVWixYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76FHNYNLlgNPDMeWDo18w4FafoILllxXiuzfTB83EOw=;
 b=rx7cY3oUKSrWvvuL0UZc8b++WD6PMKwiA4Wrd418JHypO2CEpDLnm/6EnS+f3ZpP/WXVWpVKsPa7tfBkGrZknBtdEv5C9JKhKSoO36qGH9qHjuu2FhhqpaxqTaYBPyzWv34FNCXg8znOMdybxkw9ugW3LqRF6i46x2q5M9mNZu8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL0PR12MB4865.namprd12.prod.outlook.com (2603:10b6:208:17c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 19:16:58 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 19:16:58 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Sven Peter <sven@svenpeter.dev>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: dwc3_set_mode vs. __dwc3_set_mode race
Thread-Topic: dwc3_set_mode vs. __dwc3_set_mode race
Thread-Index: AQHZAXcRTkDr3hmZu0ec9SIHOLXwmK5UuQUA
Date:   Mon, 28 Nov 2022 19:16:58 +0000
Message-ID: <20221128191654.wnzlswknkgscddwg@synopsys.com>
References: <dad79707-a778-4868-8684-f1658a38b4d0@app.fastmail.com>
In-Reply-To: <dad79707-a778-4868-8684-f1658a38b4d0@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BL0PR12MB4865:EE_
x-ms-office365-filtering-correlation-id: fab3d22d-26b0-45f5-ccdd-08dad1751ef7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HxjKJeiDJhlKn1e1Bky5lKaIIRJfA3Ev394TgnMWc+xE7qjh4FjzAcZSCltCFjUCqGEKS/noV7q7kyFGXHQtiXmJFPWqiah5mgAsNfMHGns3XpNryo/8gwO0n9ccFtdF8JkigU/yorBrKFSsYOfLnSg8XqB4Ph6r6eYvOnP4d05IQIC40ecAQr1Ok22mEYGHGJvfbIMYzIDmRgO757G7rmJwp1N2B02Jg63c6a+KiMPFayP4I87Nh1MTEw9xxS3iajrfAsdhlvRjRdDrd3N2yXyoo53tnlyZkdS3yM65Vier3tp8NX0ss0BSRa+W6NzeKRwcJopym0Q/v5RHlXJEVefgIlm/ggOnw4ZHRhNJzpsclDRMnj2bq4XFEolOPtMYorqyXTe/lrAaQJmGlQR7DYAmJm0UDtFJ8p017PoWt6vQRqg/DzwJhqNiNxRTeiOopEmmMQHzLZvsbWbzy5vp8aYFilw0xD899WHIOJlXN+5QQMXlJdBwC6Mi9a8LVycs0gsbN9pE7Lpz/oPRqMBpB33kS5xNh8VdNidbgVBGRuacIxG/LLbII6bIgUrM63dAmcgXeattmeKu1tPuiCcpkKEhxSX+y4Tw1Tehe+TExcbUqEPuBg9gpHRpwS7vvUHsrj8VDM+hiAtNVEkae8AfoqEuClbgLGhXq1Ddd3rpZNCG6CRHH29XUrciOYZXaPVBLYvUo8igWuCbRPyl4+Ikrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(346002)(39850400004)(451199015)(5660300002)(36756003)(76116006)(8676002)(66446008)(64756008)(2616005)(66476007)(6916009)(316002)(54906003)(26005)(66556008)(4326008)(6512007)(66946007)(186003)(41300700001)(8936002)(1076003)(122000001)(38100700002)(38070700005)(83380400001)(2906002)(86362001)(3716004)(71200400001)(478600001)(6486002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1B2M3I4cHZKK0NRYUhEZW1zd2xlcUw0QUNOL2xQT281T0MyajFRZnlFUnJk?=
 =?utf-8?B?ZmgybXFrbnB4YXdwNXkzeHg3ekx1MXVXL2I5MTNQL2JOaVhCcmVOV1V6QmRF?=
 =?utf-8?B?UTdBTWJGcmF6S1duckRXNjNINElHM2lVQ2tQMno3ckhkMi9RQkFyNldyUGpU?=
 =?utf-8?B?ZlBKRmJhNDRGK0trNXZTMEFzaVZNYWtTdENrY1IwMGZ3YzZzQ1M2eUtCZDVS?=
 =?utf-8?B?SXd4dlY2S3dDRGVOMXZCK1N0eXFuV3g1eTVndmdKZmdKdEI3dUdjcHZCcGpK?=
 =?utf-8?B?bXloY3lFdTBPS0FpcWtGeEE0K0REa0R5REd4Mk9kQko4T2lFQkFwTGRlY3Z1?=
 =?utf-8?B?TFo2RnRpU0JzMGRjLy9ndXhQU3Bwb0JZeE9sSUR2SXB1dWkxemZMOGlFRlFQ?=
 =?utf-8?B?NnBlWWFCblN6STRwdWdKQXF0eEhrWncvQUFHaC9SSXppUzA5Q3lsZ2k4NS9Q?=
 =?utf-8?B?NDBlaFUvL2FvTnZ1WFBUV2RJRzIzWFJkOGFRazFPVzY4aGFGdWYvN05qRXVk?=
 =?utf-8?B?MEtleUMzSFBTSi9CbHYxRE5OaFlnYS96RGJod2FaRkVmZmF1b3lVN3p6c0Qr?=
 =?utf-8?B?azlGOUFCeTlFUUc0QnR2UEhlTzNpRXl4eFpFUTl3M3BrRDhnVnMvTWx0SHNz?=
 =?utf-8?B?a0VRZThvdVJpOWN0Sm1vYW92dnAvTjVsVkh5Sk1rVHE2Vk40akhRY2lGTjRB?=
 =?utf-8?B?OElyd3NTT3NPQjhpUk9mdEliSGI1eURzc21qcXBwZVNBdzI0RGdtY0V3aUJE?=
 =?utf-8?B?STFId0w1TnVUWlp0MEtjUFBKc0NyaEhUUEV3eEIzMkJleGdvajQ5Y3pzeEJs?=
 =?utf-8?B?eUtEWUJaVVRhYWpDZHVBeE1SMGJWaDlyRHNkRUNGL1BGbFZRcnhuWFRnMzJW?=
 =?utf-8?B?SlhuMm1ieHRRRVN0WW9mTlBLSnlWVmhGN281dUZTQXgwT0pRbDZCbjJrMk1B?=
 =?utf-8?B?M2JzTXY3Qk9PR1hlMUxvZy85ZTQ0WHBZWkppd0ZFMGpOdUlUSkhBalRtb0VX?=
 =?utf-8?B?SEVuSmVjcyt6RnlON0lsTlcvSVhIamR2Qm15ZjlEY3hJOSsweU5mZm1Fc0xR?=
 =?utf-8?B?NUtmQ2RnSHI2VmNTNWR0OXlBSCsrRzJXdlNiK0Q2cXliRTJiOEJPcWo3Unkr?=
 =?utf-8?B?R0J4UEpjUW1Qc0pGdjlZSTJUUFNFRFYxc2lSSVE2VUV4NU1YNEorVUVCUnNM?=
 =?utf-8?B?ZFZSdktvR0RwUkhCZUhIbGFLcnBYUmF6Q0J3Rkt4QzdVdTVxclExMGp5amxv?=
 =?utf-8?B?Sy8vZmVMY1BxWjhTYldNcitnL1Arb2hoMjJDdHREa09EL1dLeWZqYnlwaW5N?=
 =?utf-8?B?anorbHA5dVI2WkFETk13M2VKMGZ5WVd4WUZhWUg3cWFRcFRZK0wwbFVYUW4r?=
 =?utf-8?B?T05qSUkyUEFqVisvMDA0dWhlaFJLbUxMM1g0QVVUNHZOMWc0UnY4ank0RWpi?=
 =?utf-8?B?bVFscXkraVpvbk9mRlovUFZvemZoZWlBRmQ0TXNKVU1ZYjVVM3NpN0ZYdXpm?=
 =?utf-8?B?WHdZWkozdytpc3YwQW5SeHBldlFPNmJZTEU4eWY4a1hPc1dmYll1b1ptQkJY?=
 =?utf-8?B?S3AvSEJRTWozYmZIRmpSTjdmVHZBWVZmZm9YOG9sRWNCQjlRZlhQbnlPTlBI?=
 =?utf-8?B?aVlxaTFBcHBtYjVrZFhWLzZ2YXRYMDA1dFFQbDZHZzFRRGk3dUtrNHlpL2Zp?=
 =?utf-8?B?TEdNK1BJQ1pnSFk5ZzJYZHM1ZkhKaXRHMGpGbFZEeGlzWHlMamVvMGQvZUhV?=
 =?utf-8?B?bmF2eWdxNE16RkF6Qm9RSG5xZU84WEthbWZmbTlRY3hQcnkzVTdaQ2JscFdW?=
 =?utf-8?B?ejNTeEZ3TGUrV0xRRXQvOGJ1ZzA2RG11M0xQZENTY1BjcXQrWTRjWmFuc0wr?=
 =?utf-8?B?U0FOTWlya3FOOUVzSVpBWEVIQktDRGpuRzhaWUkzdlF2ZFRhMVlXa1JoUTEz?=
 =?utf-8?B?RGs2VDlWZmVhcGFJSHlnQ3JaTGFQVFZsY1puRm82bDI2Z2RmcUREQnVJVFZy?=
 =?utf-8?B?UEN4R29XSW1nRU10OEZRYmtidXFhRWIwY2FBbnZ6b3kwWjMvNEFyM2tBdHo1?=
 =?utf-8?B?eUhrNDdhalhDUytwcnhLSjc0QmErcjdEQ05KZFFYbU5CWVBiTURNSC9xaTB5?=
 =?utf-8?Q?BiCIZt0TzDQnrKmH/rQPPlvOl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4C0FD04819E9748931F309124E40DFA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?M0pBSG9TSVk2VzFMZ2JzOXVVaG5JL08vZCtJRFdPNmdjT1ZrMnNiVnR3eTFs?=
 =?utf-8?B?djBmVGZKR0lEQzd5NzVZMmxtaWVUUGJrc2VpMUFkMG9oN09JR3pScHBoWm5v?=
 =?utf-8?B?R1hEZzFPYk1WbXJMYUgyRzNIckpOZ3lXeERRdEVCY3EwTzhBQ2FQYmVMUFdN?=
 =?utf-8?B?SGhFNnNxcDZ0S3lYMTduZFNWd0RsaTlIQXUzUkNpb21VN3FSdlpMYkxvcFl5?=
 =?utf-8?B?eExSSkN3YVd3bDROSkdaRkkxVmhvK1VjaTRZZ25pTENVeC8yWnNWQUNBbWhq?=
 =?utf-8?B?ZVEweVZqSk5ZMVUrc3RrdWtQc0lnazNpY05vNUFvTFA2VEkxWm5UcmFlQjk0?=
 =?utf-8?B?WjZ4Z05vb3ExMkhxNGxIZk1RbU9LUE1KTDFEbTB6UWE2dnMwaHFXUzZJSDhn?=
 =?utf-8?B?TjB5dTFUYnhNWVc5OTZ2WGVkWTdwS21HVEFrK3dseVZrTUVld3ZvWU9aOGdp?=
 =?utf-8?B?ckFjcDJncWc3Z2hmSVZsRFBvL0p5UGgyenM4eStqaTIxZFRwZ2FJd1gvL1lh?=
 =?utf-8?B?L1J1Ynp3bUhoN01oS2VVVE1DbG0rUUxvbHRZQXVrc2k2QXhVYjhCSlRsdkZK?=
 =?utf-8?B?Yy8vUXBLTWNVVGZTb1FSZy9YVUxVVWZwaWY5ekYzUW1XV3BaYVdGTG1ESTNj?=
 =?utf-8?B?Sk1HK2R4TW9EUDlXdUtscjgyaFBDZG9HUEZUNDZ4bDhyQzdZR3JGWjZJaHRx?=
 =?utf-8?B?a3NuY1hpZ080VEpzakR1T1pwK09FSGRaOU1aSGZLMmw1LzNsaGVmcTRWVjRj?=
 =?utf-8?B?TSsyeFZhZlRqdlJUQUFXQ0Nmb2F3Z05WOFlnczVPTnEwOFlxck9Pb0JjdlJy?=
 =?utf-8?B?c25HanlLaFFvK0VJTm5iNks4N1ljdklkb051MXphN1pMUiszMkJicjdBdGE2?=
 =?utf-8?B?QVJXVXdJV3lLN1BCcHNoc3FlNEZCSFlybzNmQnE0OTZycHU2U2dkOEdyc2VL?=
 =?utf-8?B?VjdaZzQydndLd3ppcHFNaXlkV1ppeGJHQ2ttUC8zS1Q0NW9UaldZRmtlcGsv?=
 =?utf-8?B?UlpVbjlwNjQ2bGhXc3ZaanlkUjJ2RVpseWVBNzBmVVVNaTMzaEdSRlhnd2dN?=
 =?utf-8?B?T3BLS1lzcWpQY1VzWGEveGl4djZkRW9WY1lNMUJQUzhwWTFLMFdOblFjV295?=
 =?utf-8?B?b1dNdnR5cVZHUC94dERSWnRnUFRnUGpqS0tQMjlXdFVLSVpPMmFENllPeUpJ?=
 =?utf-8?B?NnhRTE11cFBtTjBNR0pnSVJlQzJPV3Joa2tCbWJKTUlCRVBxRWVFZFBoTlc5?=
 =?utf-8?Q?401hBupRrX3Vs5Z?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab3d22d-26b0-45f5-ccdd-08dad1751ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 19:16:58.7125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60Iqa1Vauty2Z8qEoqy9mv5RW4dvkc+kObWBpVDLCNaKgVZFe6uAZzpKlYzOje1Ppf44A9gfqh+35KD5M4LTvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4865
X-Proofpoint-GUID: -DXiaDK8rPBRSlOs59q6U42cj9sNXyNC
X-Proofpoint-ORIG-GUID: -DXiaDK8rPBRSlOs59q6U42cj9sNXyNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_16,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280140
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU2F0LCBOb3YgMjYsIDIwMjIsIFN2ZW4gUGV0ZXIgd3JvdGU6DQo+IEhpIFRoaW5oLA0KPiAN
Cj4gSSd2ZSBydW4gaW50byBhIHJhY2UgYmV0d2VlbiBkd2MzX3NldF9tb2RlIGFuZCBfX2R3YzNf
c2V0X21vZGUgYWNjZXNzaW5nDQo+IGR3Yy0+ZGVzaXJlZF9kcl9yb2xlOiBJdCdzIGFuIGluY3Jl
ZGlibHkgdGlnaHQgcmFjZSB0aGF0J3MgaGFyZCB0byBoaXQgc2luY2UNCj4gcm9sZSBzd2l0Y2gg
ZXZlbnRzIG5lZWQgdG8gY29tZSBpbiBqdXN0IGFmdGVyIGVhY2ggb3RoZXIuIEl0J3MgcmVwcm9k
dWNpYmxlDQo+IHdpdGggYW4gQXBwbGUgTTEgY29ubmVjdGVkIHRvIGEgZGV2aWNlIHRoYXQgdmVy
eSBxdWlja2x5IHN3aXRjaGVzDQo+IHJvbGVzIHdoZW4gc2h1dHRpbmcgZG93biAod2hpY2ggaGFw
cGVucyB0byBiZSBhbm90aGVyIE0xKS4gVGhpcyBzb21ldGltZXMNCj4gdHJpZ2dlcnMgYSBkZXZp
Y2UtPmhvc3QtPmRldmljZSBzd2l0Y2ggc2VxdWVuY2Ugd2hpY2ggaXMgZmFzdCBlbm91Z2ggdG8g
aGl0IHRoaXMNCj4gcmFjZToNCj4gDQo+IENQVSBBDQo+IAlkd2MzX3NldF9tb2RlKERXQzNfR0NU
TF9QUlRDQVBfSE9TVCkgLy8gZmlyc3Qgcm9sZSBzd2l0Y2ggZXZlbnQNCj4gCQlzcGluX2xvY2tf
aXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+IAkJZHdjLT5kZXNpcmVkX2RyX3JvbGUgPSBt
b2RlOyAvLyBEV0MzX0dDVExfUFJUQ0FQX0hPU1QNCj4gCQlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gCQlxdWV1ZV93b3JrKHN5c3RlbV9mcmVlemFibGVfd3Es
ICZkd2MtPmRyZF93b3JrKTsgLy8gdHJ1ZSwgc2NoZWR1bGVzIF9fZHdjM19zZXRfbW9kZQ0KPiAN
Cj4gQ1BVIEINCj4gCV9fZHdjM19zZXRfbW9kZQ0KPiAJCS8vIC4uLi4NCj4gCQlzcGluX2xvY2tf
aXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+IAkJZHdjM19zZXRfcHJ0Y2FwKGR3YywgZHdj
LT5kZXNpcmVkX2RyX3JvbGUpOyAvLyBEV0MzX0dDVExfUFJUQ0FQX0hPU1QNCj4gCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gDQo+IENQVSBBDQo+IAlkd2Mz
X3NldF9tb2RlKERXQzNfR0NUTF9QUlRDQVBfREVWSUNFKSAvLyBzZWNvbmQgcm9sZSBzd2l0Y2gg
ZXZlbnQNCj4gCQlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+IAkJZHdj
LT5kZXNpcmVkX2RyX3JvbGUgPSBtb2RlOyAvLyBEV0MzX0dDVExfUFJUQ0FQX0RFVklDRQ0KPiAJ
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiANCj4gQ1BVIEIg
KGNvbnRpbnVlcyBydW5uaW5nIF9fZHdjM19zZXRfbW9kZSkNCj4gCXN3aXRjaCAoZHdjLT5kZXNp
cmVkX2RyX3JvbGUpIHsgLy8gRFdDM19HQ1RMX1BSVENBUF9ERVZJQ0UNCj4gCWNhc2UgRFdDM19H
Q1RMX1BSVENBUF9IT1NUOg0KPiAJCS8vIG5vdCBleGVjdXRlZCBzaW5jZSBkZXNpcmVkX2RyX3Jv
bGUgaXMgRFdDM19HQ1RMX1BSVENBUF9ERVZJQ0Ugbm93DQo+IAkJYnJlYWs7DQo+IA0KPiBDUFUg
QSAoY29udGludWVzIHJ1bm5pbmcgZHdjM19zZXRfbW9kZSkNCj4gCXF1ZXVlX3dvcmsoc3lzdGVt
X2ZyZWV6YWJsZV93cSwgJmR3Yy0+ZHJkX3dvcmspOyAvLyBfX2R3YzNfc2V0X21vZGUgaXMgc3Rp
bGwgcnVubmluZw0KPiANCj4gQ1BVIEIgKGNvbnRpbnVlcyBydW5uaW5nIF9fZHdjM19zZXRfbW9k
ZSkNCj4gCWNhc2UgRFdDM19HQ1RMX1BSVENBUF9ERVZJQ0U6DQo+IAkJLy8gLi4uLg0KPiAJCXJl
dCA9IGR3YzNfZ2FkZ2V0X2luaXQoZHdjKTsNCj4gDQo+IA0KPiBXZSB0aGVuIGhhdmUgRFdDM19H
Q1RMLkRXQzNfR0NUTF9QUlRDQVBESVIgPSBEV0MzX0dDVExfUFJUQ0FQX0hPU1QgYW5kDQo+IGR3
Yy0+Y3VycmVudF9kcl9yb2xlID0gRFdDM19HQ1RMX1BSVENBUF9IT1NUIGJ1dCBpbml0aWFsaXpl
ZCB0aGUgY29udHJvbGxlciBpbg0KPiBkZXZpY2UgbW9kZSB3aGVuIGNhbGxpbmcgZHdjM19nYWRn
ZXRfaW5pdC4gVGhpcyBvYnZpb3VzbHkgZG9lc24ndCB3b3JrIGFuZCBpcw0KPiBub3QgZWFzeSB0
byByZWNvdmVyIGZyb20uDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHdlIGNhbid0IGp1c3QgbG9jayBk
d2MzLT5tdXRleCBzaW5jZSBkd2MzX3NldF9tb2RlIG1heSBiZSBjYWxsZWQNCj4gZnJvbSBhbiBl
eHRjb24gaW50ZXJydXB0IGluIGF0b21pYyBjb250ZXh0ICh3aGljaCBpcyBwcm9iYWJseSB0aGUg
cmVhc29uIGZvcg0KPiBkZWZlcnJpbmcgdGhlIG1vZGUgc3dpdGNoIHRvIGEgd29ya3F1ZXVlKS4N
Cj4gDQo+IE90aGVyd2lzZSBJIGNhbiBvbmx5IHRoaW5rIG9mIGNyZWF0aW5nIGEgc2luZ2xlLXRo
cmVhZGVkIHdvcmsgcXVldWUgYW5kDQo+IGFsbG9jYXRpbmcgYSBuZXcgd29ya19zdHJ1Y3QgdG9n
ZXRoZXIgd2l0aCBkZXNpcmVkX3JvbGUgaW5zaWRlIGR3YzNfc2V0X21vZGUNCj4gYW5kIHB1dHRp
bmcgdGhhdCBvbnRvIHRoZSBxdWV1ZSwgaS5lLiBzb21ldGhpbmcgbGlrZToNCj4gDQo+IHN0cnVj
dCBkd2MzX3NldF9tb2RlX3dvcmsgew0KPiAJc3RydWN0IGR3YzMgKmR3YzsNCj4gCXUzMiBkZXNp
cmVkX2RyX3JvbGU7DQo+IAlzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsNCj4gfTsNCj4gDQo+IHZv
aWQgZHdjM19zZXRfbW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSkNCj4gew0KPiAJc3Ry
dWN0IGR3YzNfc2V0X21vZGVfd29yayAqd29yayA9IGt6YWxsb2Moc2l6ZW9mKCp3b3JrKSwgR0ZQ
X0FUT01JQyk7DQo+IA0KPiAJSU5JVF9XT1JLKCZ3b3JrLT53b3JrLCBfX2R3YzNfc2V0X21vZGUp
Ow0KPiAJd29yay0+ZHdjID0gZHdjOw0KPiAJd29yay0+ZGVzaXJlZF9kcl9yb2xlID0gbW9kZTsN
Cj4gCXF1ZXVlX3dvcmsoZHdjLT5kcmRfd29ya19xdWV1ZSwgJndvcmstPndvcmspOw0KPiB9DQo+
IA0KPiBUaGF0IHdheSBhbGwgcm9sZSBzd2l0Y2ggZXZlbnRzIHdpbGwgYmUgZXhlY3V0ZWQgaW4g
b3JkZXIgYW5kIHdlIGNhbid0IHJhY2UNCj4gZGVzaXJlZF9kcl9yb2xlIGFueW1vcmUuDQo+IEkn
bSBub3QgdmVyeSBoYXBweSB3aXRoIHRoYXQgc29sdXRpb24gYnV0IGNhbid0IHRoaW5rIG9mIGFu
eXRoaW5nIGVsc2UuDQo+IA0KPiBBbnkgdGhvdWdodHMgb3IgaWRlYXM/IEkgY2FuIG90aGVyd2lz
ZSBwcmVwYXJlIGEgcGF0Y2guDQo+IA0KPiANCj4gVGhhbmtzLA0KPiANCj4gDQo+IFN2ZW4NCg0K
WW91ciByZXZpc2VkIGNoYW5nZSBpbiB0aGUgbmV3IHBhdGNoIGlzIGEgYmV0dGVyIG9wdGlvbi4N
Cg0KVGhhbmtzLA0KVGhpbmg=
