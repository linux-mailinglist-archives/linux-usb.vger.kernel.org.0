Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C18B69EED0
	for <lists+linux-usb@lfdr.de>; Wed, 22 Feb 2023 07:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjBVGjT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 01:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjBVGjQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 01:39:16 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D472A17D
        for <linux-usb@vger.kernel.org>; Tue, 21 Feb 2023 22:39:14 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M6YT5P030715;
        Tue, 21 Feb 2023 22:39:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=elowzE/rqYKpMv2AA8d5DOD6xliPaYvizJG3Hg+rL5g=;
 b=bQGL9e1Ztrf8NrqYlrhKSAIFhxVim6B1qLHxA4aghd1ZZPpDchSrjP3gdCoSFobT4G3M
 74e4tXI/rzbowOQOGHiybb8nt5IYALrae72sI7j2MG9HJGucrOVkbFdNH4GNlp991wNa
 Op7zkjYd+2Mr7/zZonFrQGCPUviNhwVzbqXW5IO2JUJYcBSnpeaEm//BAFk2ey4XEmdR
 rizX+td1f5W/ezY8fCxOMBaBz7aiV+dCueFd8QcEbdyUW1XWL0m7WyaTN4j2X+OMT0YC
 DONJpHlHCO+IDg5OhdKJLAsLt5kVkkRk0ZqsMzqDXV/pewou5yb0r52wAYKasvmwaJyW Ow== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ntxjtxffu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 22:39:11 -0800
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7419A400E1;
        Wed, 22 Feb 2023 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1677047950; bh=7AnBG/lowbw1yj2EqQzxPcXI2VxeIjBLLvBmTs4McVc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Hn7yqCvveTj2j8COU6YTUXqIiCgGqBCkbMnX2PyqhqalcfEpy+oXRxyosEGngLqDm
         aM1emwVK89gf0VZ7C2EvH/pwUwyvIQKcVJyRQi7x530OtqWQXx24XBOMthwoWFTdvm
         TkYz2f0zY9i9AMCQHcRs8e5wIh5XwgYVMr4NNXSas0habqHKb4f4w2iFkIeXAaIgcT
         rkz7WnHTXoJhZ5jihNc6KC+RW6fyN543dFudecWdp+YJOfoAsNAg9QkF1iMPi3+OIA
         wAcsfkuMSocrcjpq5YGvrsz4Jq6TciJsmH7jlrLTQSK2eKW7bXT5YQ1YhTtf/v0rR/
         kaYyyQt/ziLew==
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E8E97A005A;
        Wed, 22 Feb 2023 06:39:09 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7329DA00EF;
        Wed, 22 Feb 2023 06:39:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ZSGsBB0e";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jx6X77tvDA8kKS4AsTd5UHcddml+KAyhfKMMG8Z3eKf+h7CtXHowX+Yv7qmXlvrgWX7TJFEtIrPn1d4OTxu4OBxSPb9Fp+3LfaGaThKRJSj6xlUep3xWS9/Jt9bnFdQDiurIKVN4fYl4K+ZQU0FrerV29H1Pg8TlV8kq2TlJ/tiFnaehbN7a+Yh/W+04vVGSBX2cjDD5H4JpjRU7Z08lINKit1AZFxCAEfM4ps110uMYOJREusomq2CVdSaFpXQ/tGOsHX5ysbGrmJua7pv8JYKP909tNEA6E/xzWGVhRcQXwgPnoKTZljnpQteo4obaI53WBOxxQaY07QYIPyNs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elowzE/rqYKpMv2AA8d5DOD6xliPaYvizJG3Hg+rL5g=;
 b=fG4QGoyNVcs4tZSt3Aydb4Ff1LQL3G4tMGgrl/tKKeGeqghM5J/GRMaOf/qnHx2MC8kfRtxXxGaidlN0YnLYzd4P0XB4lBQuxJPt7C4jLaJUJsnYFdUc5nEYD0yP0n/p76Oip6GUtqXSlOvVmnSPapf61b/AxAXk7MRch41xXApOY0S3kdzfIAuO7Fn+PF2u6hAjSBTLqmfSBYqO0S+Lz5p4dx+4E5k+SViQF5Pv6exlHnzJy3XCDpGzISZY8+MiHpr7oZCi4mDX87lI2ou3ME5uywxkSBiEdNKNqT/LAIQEa7zRzTFQN/jbfz7lks/RXk4weUeRpiNZJup5LqAI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elowzE/rqYKpMv2AA8d5DOD6xliPaYvizJG3Hg+rL5g=;
 b=ZSGsBB0e2DQemhIK8v9lN0U+VHeIHQKQIqTrrkZDQH3rTNBEGoZucCbISFvnWPbhAf8A//NE+/URI/2hUmS21MV9M3fpZ0Pp5Rl5N1zAMDfYY1Ur6eTINazbJpLLmxxG+ZQJIZoJCK3+44ruMOvAMR4KxXIoqIHxbOY0IoRaro8=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 06:39:05 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::b864:207b:e50f:2ffe]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::b864:207b:e50f:2ffe%4]) with mapi id 15.20.6111.019; Wed, 22 Feb 2023
 06:39:05 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Palak SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8lwFCGPXw
Date:   Wed, 22 Feb 2023 06:39:05 +0000
Message-ID: <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcaG1pbmFzXG?=
 =?iso-8859-1?Q?FwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0?=
 =?iso-8859-1?Q?YmEyOWUzNWJcbXNnc1xtc2ctOTcxMWQzMjMtYjI3Yi0xMWVkLWIwNjktNW?=
 =?iso-8859-1?Q?M1ZjY3NjdkNDhiXGFtZS10ZXN0XDk3MTFkMzI0LWIyN2ItMTFlZC1iMDY5?=
 =?iso-8859-1?Q?LTVjNWY2NzY3ZDQ4YmJvZHkudHh0IiBzej0iNzEwMCIgdD0iMTMzMjE1Mj?=
 =?iso-8859-1?Q?E1NDE1MTM5MTYyIiBoPSJKZmNrYXZTZ0crUUtMcFlLUzI4b05kanlYWmM9?=
 =?iso-8859-1?Q?IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2?=
 =?iso-8859-1?Q?dVQUFIWUlBQUJhRzM5WmlFYlpBVGxmOU5ScHZrMTdPVi8wMUdtK1RYc05B?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFBR0NBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBRUFBUUFCQUFBQTJXMC9vZ0FBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUo0QUFBQm1BR2tBYmdCaEFHNEFZd0JsQUY4QWNBQnNBR0VBYmdCdUFHa0?=
 =?iso-8859-1?Q?FiZ0JuQUY4QWR3QmhBSFFBWlFCeUFHMEFZUUJ5QUdzQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQU?=
 =?iso-8859-1?Q?dZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFITUFY?=
 =?iso-8859-1?Q?d0JuQUdZQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFaZ0J2QUhV?=
 =?iso-8859-1?Q?QWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxBSElBY3dCZkFITUFZUU?=
 =?iso-8859-1?Q?J0QUhNQWRRQnVBR2NBWHdCakFHOEFiZ0JtQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFkUUJ1QUdRQW?=
 =?iso-8859-1?Q?NnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBY3dCdEFHa0FZd0FB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?VBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?iso-8859-1?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QnpBSFFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQ0FBQUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQn?=
 =?iso-8859-1?Q?lBSFFBYmdCbEFISUFjd0JmQUhRQWN3QnRBR01BQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQU?=
 =?iso-8859-1?Q?FBQUFKNEFBQUJtQUc4QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVB?=
 =?iso-8859-1?Q?R1VBY2dCekFGOEFkUUJ0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdB?=
 =?iso-8859-1?Q?QUFHY0FkQUJ6QUY4QWNBQnlBRzhBWkFCMUFHTUFkQUJmQUhRQWNnQmhBR2?=
 =?iso-8859-1?Q?tBYmdCcEFHNEFad0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFBQ2VBQUFBY3dCaE?=
 =?iso-8859-1?Q?FHd0FaUUJ6QUY4QVlRQmpBR01BYndCMUFHNEFkQUJmQUhBQWJBQmhBRzRB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnpBR0VBYkFCbEFI?=
 =?iso-8859-1?Q?TUFYd0J4QUhVQWJ3QjBBR1VBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhNQWJnQndBSE1BWHdCc0FHa0?=
 =?iso-8859-1?Q?FZd0JsQUc0QWN3QmxBRjhBZEFCbEFISUFiUUJmQURFQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUNBQUFBQUFDZUFBQUFjd0J1QUhBQWN3QmZBR3dBYVFCakFHVUFi?=
 =?iso-8859-1?Q?Z0J6QUdVQVh3QjBBR1VBY2dCdEFGOEFjd0IwQUhVQVpBQmxBRzRBZEFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJ?=
 =?iso-8859-1?Q?QUFBQUFBSjRBQUFCMkFHY0FYd0JyQUdVQWVRQjNBRzhBY2dCa0FBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQS?=
 =?iso-8859-1?Q?IvPjwvbWV0YT4=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|DM6PR12MB4044:EE_
x-ms-office365-filtering-correlation-id: e4021902-05d0-4a33-fbcf-08db149f7e46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64Bbj2Z8buFcO1JWtzogEV8CQ2CdOJMRAmNJMS9Ihkb4MMF8HVX76hA8P9HzHRYfMDvwXSszJKIFA2S6RDmPbbkljuc0cdf+6Fo9FuoFo5fGmD4QIeFRlTFQ3NVKmKPkbZxXOFnQ7YrUmLJ0JiHiuglF7j0+Z116mfn8jmREc10n/k/AI3gdGlUPk1SzfN9s+4ley4gc+2kC9MQMpEIT9sZjjtMFR7NTezJDnkKM+OJ+tW1ND4wfKEMCzi1FKq2vOYJYCvwxUsv55BKhM2pADO+VxAjR01tQPsEqOESmxOJ4xb2Edvx9eW0YTigEpl+kSIqpTWysvxyaL+1R0VgdndeIcmrE+mGxocj1azqL1JnktPVDu4bW1s6Zc09M3Sm0djoTB5JIvO8cD7CAIWTdCYXlScLOS1GHc9/fFH+cBDEjRbnY4OkJHqUWJtRUahzBszyV/jHSY73nJTzjAKuyvhpPBpdVJyV00rkOZ/JtWWf/sG3Dle90qQriVwjfJncE39QzAvQUKgxzrBGQZphhGPSjs+0fwT8Nyvo62XsXZuTA6caN9yW5sYEP2Uct4dWYoDdG49Ony8Gv7M0pWeOiyxPx9SEQR4YYkCPVLNVQbAaOLd7hQhyLQqg3+mxpjvf1M8CrveX2imdARrcLtseLQ8bkdC5x2XHXDo+aOGGJ+ePvBIcWFCn/cloK0epjLLM9HdWpNQ6aNRiQz1IatDBoc76x95brIWFIElP6G2GxT08yGDdQu/BOmTxKHQpg1gfP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(83380400001)(2906002)(5660300002)(9686003)(6506007)(53546011)(110136005)(478600001)(86362001)(8936002)(52536014)(41300700001)(33656002)(55016003)(71200400001)(7696005)(122000001)(38100700002)(38070700005)(26005)(186003)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(4326008)(76116006)(414714003)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oV+k4QFDJvzh+CAeZawa7nAw0ccI9zOZTdxzfiHD85BYq2OUOVmh3UUKbX?=
 =?iso-8859-1?Q?pDM3MwsHS0auTE4vdgU5jNhxMBZAIg7pH2DobGceZqIBuWHT+E4aN/A5Sa?=
 =?iso-8859-1?Q?kM5p8z+ntI+9eBNm4dIlez+ApJhIXv+45/WaKl5Y4hON9+NmM8m2muGWOb?=
 =?iso-8859-1?Q?0bD1Qisq0FUr20ikC0j+9pud38G+yMow780dESHt3SYhQX2O5YrEzxq/Ml?=
 =?iso-8859-1?Q?weU6e/SU2FoI5UkTiRQ55SpbNkfreimxORp6XGXKloyoRXR6aLgppm9MjM?=
 =?iso-8859-1?Q?Xth1dWeLTEstxbWmvNbqxBDDf7uIEMK8ZlrE2Bi2Jh49QNRzHN+R4ConQh?=
 =?iso-8859-1?Q?mPPm78q68Wds+DUOtbfOmuQlxVhmjrqR2FNrKY5Syv5k9oSebVopQZz3dl?=
 =?iso-8859-1?Q?PuM5Q2/dAxahZ1ZU6f2Dr8vaia5tRtaTQpzNuPvrBYnTtP46bXBO2edYOf?=
 =?iso-8859-1?Q?KtAZ4VjurxJNGomb6KmlMbyA1zsRywN4RpGSyeDWrhIAGR+4Gl9OpoMSSJ?=
 =?iso-8859-1?Q?NZoxUTIKeqFZmJUdcmJy2IjgKlho2DkIgQ7bZlkOH1uKOY8PzHePlAXCTx?=
 =?iso-8859-1?Q?2WnG8olY161LLu7IAcJgqOLsxRilqZLV7neUGOYGU+cQXwU27UusG7gSBs?=
 =?iso-8859-1?Q?Kkq8jQkdifkeQ25tg7b5nNtcJvJ8rTdCOPuh5iZxoWbfKjFklPYJaAp1ir?=
 =?iso-8859-1?Q?Ms8YTcoB/qpXYtj0Ghy1BVn0wYwspAqLC4Gy/Xn3mqpZ4PNuf881sRUXG0?=
 =?iso-8859-1?Q?Eu8EZ3OXXdZsCxiIKVM5XTIOrwj7If2idSGUToqMG51MHLVZ3e6AUy16uz?=
 =?iso-8859-1?Q?80Orp/ZVfFnjdeZsqlqQ0fQVaSrVuUR38xNm396B5jq/aUKDLrMGhzF4CB?=
 =?iso-8859-1?Q?jzBFvJCAk5MnJK67r+c4rjmcFbEJzhDv7r7OazYn8wUEqX4SYTcANLSyp1?=
 =?iso-8859-1?Q?nb6u+mwAEq0M5vQ1u0oReXI9zi8nH/Y0lSSE5XLtIrdhjlbS5K1g8fXyii?=
 =?iso-8859-1?Q?2XM2ELTG7q+5BKVTR1RjD42i8Dq807v612/IMHJrkq6oZF2gD6xsjzdUZa?=
 =?iso-8859-1?Q?mRY4/W6+DWiJwVpUUI+th/VMnvqcULaonT3iOp+Uq540z2fMfjh4G27P6Y?=
 =?iso-8859-1?Q?sRKctiWi2Q9dLSbxdJW+LIFY4N5aW2sT8v+pVJKmuUV/LUiW+N4cS9W57B?=
 =?iso-8859-1?Q?k0xsa6dbDcF7CoCSgQHfcbfyCjDVPsEWK8MFZdrGcCNx1BekT65JKKmI2C?=
 =?iso-8859-1?Q?/JpoV/2sg63M2h428J6rRFhLc8A4XtqjSm3jkZPjAKipMIcsAbLUZGwLp8?=
 =?iso-8859-1?Q?2lWGfQEnWe0i7hiYFwrWLPe2JVssKg5hJooB+84NEkpDzdjA11hmV2i7h4?=
 =?iso-8859-1?Q?VnHQ6jfsO4ifnqqo0bTV175sypu5/vkKBINqCjLD0x/Mu+giahZXdocsSv?=
 =?iso-8859-1?Q?+aoL+HZgiJlYm6FM94FPiy+WHT1KqeaUdPxgc2tY5Q1cOv5S0eOuZubdZZ?=
 =?iso-8859-1?Q?6n4q11r5NyU2Nyv8QhtUCMRoNoBeP1XgkGd2dKId760al2Lf8Nas4YjsuY?=
 =?iso-8859-1?Q?8AA4i3X8Q8SDNgMjvv+eyVW6L2yJEEiK13osfJTcyci5gQxriu9Pu5qxeG?=
 =?iso-8859-1?Q?NkpM5ogInSinPP2p0IGOI/M8kkbtM7VS/x?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: a7kw8d8i6+Rj81KPamiCi6/6cNIhc+5K5h8yQZBlbKi74/mq8+sE6AjLa9HAoVvRH6KFfHSJ2Fp+0WlEMvZ3nAxsVUtUFQcmJ+xhB4ZVFZK0ATY11WovXqwIljGu14lKdkbo4p6RT4fa62PkqZjRW3MVm2XQEufkiycquMtx+LXnMZWIHZ29fnsnPqpBLH5aST7iOUy3fsbvRAA5s392NmTlJYUMPSiGZAUMO/SC+CVvJy+MJwYsYs9wpOxGOInurszMaiNxppmzKhCDd7SWhB9MQ8JhQk0oJ4d5SSkUHCHwLO1Hqg+dXTRdel/qXy4mfrj6x+81VbmJMB9HZ6tMkFJ338+EzyNxv6LGAbAK5CRKnkXBAQUSuGaes/DvQ4j+u/8nN6/F9/49hEtNvp0oJYKEOI77IW8dQs31jd7q7p/P1bL55UI7IBC13e8LKRmT0SDfQYfcVoyOroXV+mB87oKWVyWUxcRP3M6rTDPmrW/D7Ycu8piNc+RT9+chLARHVr8N3o0J+IshidV8nsOLcJsQfyFjQQeVY+JYx7MK80fJY+RQem7551qqFa6C9voIf+3YZQL1kiWLGYsdcvUIZ+EJVQUr8jSrpNETfm28aLIIkrOD3RaGWPnZwfQtyIBM8SnRME1hK0c34iaNMa39K0TzE/93lhR+rNNaltglBCJPoKAP57vMraXS48LbyWfubMH1tE9TkJt2CFCYgwwFxB2MtINpJbDsyyh5gWmoZlzYbAZugAlb0iR3W3010TQPZLALSKLZk3oFzRoBVq1e3sxIT9DQQ3ZeMk3kd8pKfnEx8nsknkGhE+wdd62bPuAL2vxL7eMt6IysjW6Vwtlqbg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4021902-05d0-4a33-fbcf-08db149f7e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 06:39:05.3837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8gtbmYZCVpqtEO2RsC8lY2oPmt8iHa/WNY71Mze4L+QvWjlJ100Q94XQpXWwzfzm96XRS7r/0bL+LtjqNAMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
X-Proofpoint-ORIG-GUID: I58dFcyPPH3CYjFdLBtbyZ3GDKQu_4v3
X-Proofpoint-GUID: I58dFcyPPH3CYjFdLBtbyZ3GDKQu_4v3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_02,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 suspectscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220055
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Palak,

On 2/15/2023 11:48 PM, Palak SHAH wrote:
>From: Palak SHAH <palak.shah@raritan.com>=20
>Sent: Wednesday, February 15, 2023 11:48 PM
>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE <maynard.cab=
iente@raritan.com>
>Cc: linux-usb@vger.kernel.org; Palak SHAH <palak.shah@raritan.com>
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Minas,
>I recently came back from vacation and resumed debugging the dwc2 audio da=
ta issue.=20
>
>Based on what you suggested in our last conversation, I put some more debu=
gging messages the linux/driver/usb/gadget.c file and I am seeing the follo=
wing -=20
>
>// When the data is coming in and the XferComp is successful, I see the fo=
llowing -
>[=A0=A0 81.279536]=A0=20
>[=A0=A0 81.280336] dwc2 ffb40000.usb: dwc2_hsotg_irq: 04288028 00080000 (d=
08c3cc4) retry 8
>[=A0=A0 81.280348] dwc2 ffb40000.usb: dwc2_hsotg_irq: daint=3D00020000
>[=A0=A0 81.280357] dwc2 ffb40000.usb: dwc2_hsotg_irq, calling dwc2_hsotg_e=
pint 0
>[=A0=A0 81.280367] dwc2 ffb40000.usb: ENTERING dwc2_hsotg_epint: EP(1) DIR=
ECTION (out)=20
>[=A0=A0 81.280375] dwc2 ffb40000.usb: dwc2_gadget_read_ep_interrupts
>[=A0=A0 81.280395] dwc2 ffb40000.usb: dwc2_hsotg_epint: ep1(out) DxEPINT=
=3D0x00000001
>[=A0=A0 81.280406] dwc2 ffb40000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=
=3D0x800480c8, DXEPTSIZ=3D0bee44f0
>[=A0=A0 81.280415] dwc2 ffb40000.usb: dwc2_hsotg_epint: calling dwc2_gadge=
t_complete_isoc_request_ddma
>[=A0=A0 81.280424] dwc2 ffb40000.usb: dwc2_gadget_complete_isoc_request_dd=
ma: calling dwc2_hsotg_complete_request()
>[=A0=A0 81.280437] dwc2 ffb40000.usb: dwc2_hsotg_complete_request, complet=
e: ep 4a6713b7 ep1out, req 41f4c070, 0 =3D> ea5b3941
>[=A0=A0 81.280456] dwc2 ffb40000.usb: dwc2_hsotg_ep_queue, ep1out: req 41f=
4c070: req len(200)@req buf(3fb7d86f), # of int=3D0, req zero=3D0, snok(sho=
rt not ok)=3D0
>[=A0=A0 81.280474] dwc2 ffb40000.usb: dwc2_hsotg_ep_queue, EP #(ep1out) Ha=
ndle DDMA isochronous transfers separately.
>[=A0=A0 81.280483] dwc2 ffb40000.usb: ENTERING dwc2_gadget_fill_isoc_desc
>[=A0=A0 81.280493] dwc2 ffb40000.usb: dwc2_gadget_fill_isoc_desc: Filling =
ep 1, dir (out) isoc desc # (132)
>[=A0=A0 81.280502] dwc2 ffb40000.usb: dwc2_gadget_complete_isoc_request_dd=
ma: compl_desc # 130
>[=A0=A0 81.280511] dwc2 ffb40000.usb: dwc2_hsotg_epint: At the end of the =
function, dwc2_hsotg_epint()
>[=A0=A0 81.280511]=A0 -------------------A GAP of 6 secs -----------------=
----------------------------------------------
>
>// After the gap, I don't see any XferCompl request, however I see dwc2_ga=
dget_handle_out_token_ep_disabled() API getting called.=20
>
>[=A0=A0 87.871437] dwc2 ffb40000.usb: ENTERING dwc2_hsotg_epint: EP(1) DIR=
ECTION (out)=20
>[=A0=A0 87.872434] dwc2 ffb40000.usb: ENTERING dwc2_hsotg_epint: EP(1) DIR=
ECTION (out)=20
>[=A0=A0 87.872451] dwc2 ffb40000.usb: dwc2_gadget_read_ep_interrupts
>[=A0=A0 87.872461] dwc2 ffb40000.usb: dwc2_hsotg_epint: ep1(out) DxEPINT=
=3D0x00000010
>[=A0=A0 87.872470] dwc2 ffb40000.usb: dwc2_hsotg_epint, calling dwc2_gadge=
t_handle_out_token_ep_disabled
>[=A0=A0 87.872478] dwc2 ffb40000.usb: dwc2_gadget_handle_out_token_ep_disa=
bled: target_frame =3D 0x00002bd0
>[=A0=A0 87.872486] dwc2 ffb40000.usb: ENTERING dwc2_gadget_start_isoc_ddma
>[=A0=A0 87.872497] dwc2 ffb40000.usb: ENTERING dwc2_gadget_fill_isoc_desc
>[=A0 =A087.872507] dwc2 ffb40000.usb: dwc2_gadget_fill_isoc_desc: Filling =
ep 1, dir (out) isoc desc # (0)
>[=A0=A0 87.872524] dwc2 ffb40000.usb: ENTERING dwc2_gadget_fill_isoc_desc
>[=A0=A0 87.872534] dwc2 ffb40000.usb: dwc2_gadget_fill_isoc_desc: Filling =
ep 1, dir (out) isoc desc # (1)
>[=A0=A0 87.872544] dwc2 ffb40000.usb: dwc2_hsotg_epint: At the end of the =
function, dwc2_hsotg_epint()
>[=A0=A0 87.872544]=A0=20
>
>I have attached the full log here.
>
>When I look at the dwc2_hsotg_epint() API, I see that when the XFERCompl i=
s successful, then the following is true -=20
>if (ints & DXEPINT_XFERCOMPL) {
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_dbg(hsotg->dev,
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "%s:=
 XferCompl: DxEPCTL=3D0x%08x, DXEPTSIZ=3D%08x\n",
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __fu=
nc__, dwc2_readl(hsotg, epctl_reg),
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc2=
_readl(hsotg, epsiz_reg));
>
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* In DDMA handle isochronou=
s requests separately */
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (using_desc_dma(hsotg) &&=
 hs_ep->isochronous) {
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_dbg(hsotg->d=
ev, "%s: calling dwc2_gadget_complete_isoc_request_ddma\n", __func__);
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc2_gadget_comp=
lete_isoc_request_ddma(hs_ep);
>
>However, in case of no XferCompl, it bypasses this and goes to the followi=
ng IF condition -=20
>=A0=A0=A0=A0=A0=A0=A0=A0if (ints & DXEPINT_OUTTKNEPDIS){
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_dbg(hsotg->dev,"%s, call=
ing dwc2_gadget_handle_out_token_ep_disabled\n", __func__);
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc2_gadget_handle_out_token=
_ep_disabled(hs_ep);
>=A0=A0=A0=A0=A0=A0=A0 }
>
>In what scenario does the DXEPINT_XFERCOMPL change to DXEPINT_OUTTKNEPDIS?=
=20
>This change in the IF() condition, co incides with the time lapse. Can you=
 please help me understand this?
>

DXEPINT_OUTTKNEPDIS asserted when OUT token for ISOC (ep1out) arrive to cor=
e
but EP not enabled yet. Based on this interrupt driver start ISOC transfer =
by
filling descriptors chain an enabling EP. This flow used for very beginning=
 first
ISOC packet. This part not seen in the log but looks like it was successful
because we see expecting DXEPINT_XFERCOMPL interrupts until 6 sec gap.
After time gap due to some reasons EP became disabled and then driver tryin=
g
to re-start ISOC traffic based on DXEPINT_OUTTKNEPDIS interrupt as describe=
d=20
above. But something go wrong, EP not enabled and we got DXEPINT_OUTTKNEPDI=
S
interrupt and re-starting again and again.

In dwc2_gadget_start_isoc_ddma() function the final step is enabling EP:
	ctrl =3D dwc2_readl(hsotg, depctl);
	ctrl |=3D DXEPCTL_EPENA | DXEPCTL_CNAK;
	dwc2_writel(hsotg, ctrl, depctl);
}
Let add at the end debug print depctl to check EP Enable bit set or not.
Additionally lets print some registers too: GRXSTSR, DCFG, DCTL and DSTS.
Apply this patch and send me debug log:

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 62fa6378d2d7..34f786b514ec 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1028,6 +1028,9 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_h=
sotg_ep *hs_ep)
        ctrl =3D dwc2_readl(hsotg, depctl);
        ctrl |=3D DXEPCTL_EPENA | DXEPCTL_CNAK;
        dwc2_writel(hsotg, ctrl, depctl);
+       dev_dbg(hsotg->dev, "%s: GRXSTSR=3D0x%08x DCFG=3D=3D0x%08x DCTL=3D0=
x%08x DSTS=3D0x%08x DxEPCTL(%d)=3D0x%08x",
+               __func__, dwc2_readl(hsotg, GRXSTSR), dwc2_readl(hsotg, DCF=
G), dwc2_readl(hsotg, DCTL),
+               dwc2_readl(hsotg, DSTS), index, dwc2_readl(hsotg, depctl));
 }

Another thing which I recommend to do is increasing request count of audio =
gadget.
Depend on which uac (uac1 or uac2) you use, accordingly increase 2 to 32:
u_uac1.h:
#define UAC1_DEF_REQ_NUM 2
u_uac2.h:
#define UAC2_DEF_REQ_NUM 2

Thanks,
Minas

Please reply emails in "Plain Text" format only.


>Thank you so much for your help all along.
>
>Thanks,
>Palak
>
