Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63CC67221EE
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 11:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjFEJTp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 05:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjFEJTo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 05:19:44 -0400
X-Greylist: delayed 469 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 02:19:38 PDT
Received: from mail.dieselschrauber.org (mail.dieselschrauber.org [178.209.53.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19648A4
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 02:19:37 -0700 (PDT)
Received: from dummy.faircode.eu (unknown [194.209.24.240])
        by mail.dieselschrauber.org (Postfix) with ESMTPSA id D4C2737604BF;
        Mon,  5 Jun 2023 11:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dieselschrauber.org;
        s=dkim; t=1685956305;
        bh=zyr2rK56iddfQu9V5QCbyAPi+LISEaDdS3KMaGA4e4s=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=ZOBAwM2qWBEcftAwdC+QCThJ5ppPAMKkf0mgnOtBf/y0TzI5uZ0tB5dbogingYC4y
         Rn/SQbSlxynDf6IdcLBejd1K/RZGnuQ7+ZGo6d6xJelGXD2O/SqZZl+uITfHFcVrjk
         N2qFEkTGC9jZwA1BA9TsNF+jlzwZdCNgDRJFylXU=
Date:   Mon, 5 Jun 2023 11:11:44 +0200 (GMT+02:00)
From:   Rainer Kaufmann <shop@dieselschrauber.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     info@kaufmann-automotive.ch, linux-usb@vger.kernel.org
Message-ID: <cccc4eb1-d397-4d06-ab6d-8e6e31956985@dieselschrauber.org>
In-Reply-To: <a4539841-b652-973b-f94b-aec35d137cf2@suse.com>
References: <40a1a3f4-46bf-1f3d-34a4-ff5c6f67dbaa@kaufmann-automotive.ch> <02366b3d-0dcf-2e13-579f-3da3726175f6@suse.com> <c2193d66-bf49-6a0e-1b7a-cf357265ffa6@kaufmann-automotive.ch> <a4539841-b652-973b-f94b-aec35d137cf2@suse.com>
Subject: Re: USB driver assignment request
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <cccc4eb1-d397-4d06-ab6d-8e6e31956985@dieselschrauber.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, of course!

05.06.2023 08:17:13 Oliver Neukum <oneukum@suse.com>:

>=20
>=20
> On 01.06.23 19:28, Rainer Kaufmann wrote:
>> Dear Oliver,
>> thank you very much providing the patch (attached).
>> I finally had time to test it and everything works fine!
>=20
> Hi,
>=20
> very good. May I include your tested-by tag, including your
> mail address, so that it will be recorded that the patch has
> been tested?
>=20
> =C2=A0=C2=A0=C2=A0 Regards
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Oliver
