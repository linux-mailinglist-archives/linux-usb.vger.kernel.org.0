Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F01760333
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 01:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjGXXfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 19:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjGXXf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 19:35:29 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8015E10F0
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 16:35:26 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a04e5baffcso3418884b6e.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 16:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690241725; x=1690846525;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I8fz4cK5y9JcsINOznOi6I+slOOwe0qn3DVZUoBbC9w=;
        b=gyrYIkCIORhM0Xo2OeACAoyeqsgmvMki5OW8sawDOPwE5GdYjIxsgmzappwCq4L/Cs
         iMEYziJKPM+2nJ78HrBHl0HrPDB6+jse0+hZn03CY9LzFP9fWcw3uJWL0WPhj+LRtbWB
         gpJQwIkDf4gdR+5RT3UtTKIx8vCMdlnA3tGEqUpJsxWiXYlTKBGOgXIRA/wA08FnUZ50
         4Hccw59fEEXUpqVhUR1zsk4R1sFumUACUOPxpP3ynBqazO2vNV7NukOlD45vvhoVBILa
         KTN/b8HZGu6TjTsgPmloqRKO8vVV+Xes65ZK4uvTGV5uoAk0mMzjI6x2fSF+hClCJk2k
         dePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690241725; x=1690846525;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8fz4cK5y9JcsINOznOi6I+slOOwe0qn3DVZUoBbC9w=;
        b=QGBVhzhOtKE5/+LvpWuJEnFi+mgnPvD3E+onAjkCz1511pOj/MPEd9BOOCGVHlfn+A
         tER2R75Kww6D2EMaapE6/9p+qBC9XRccdq3OJKwawA/vGlmCXhaDo1vOFpFXsq0jN6gV
         ahKk9RsepTVECm8guKbihxhGHgEesZMj2Sz1PBF9tTaZppb7zc2XcP6T7Pw8fls+cf95
         qBzKEbBVIbziLDkVsFqhms/MdtbhpGKrKLH8TXDhI2NSxAxhtemZfoXew6b+VALPP+Y2
         zoaKGaGLCv76C4tpZZGA0J6qJmM2JwMyMKcfE9fHD25/PVFPSgNm2gDT+Oepem7geiQl
         RyNA==
X-Gm-Message-State: ABy/qLa1zmHw3Jmk/3GuOx+bLYlRFZh5bHgvAFgpeCopmlB2ork9DWfT
        I/vQ8w7wkki9J61VP3Cw/PXCeZu4Y0EVyMxJiABZu0TEW+0zng==
X-Google-Smtp-Source: APBJJlHKzcKAobl5khO29PPaUVb1mxmTjNfIZiG7nJgTD+W4ZTW0fBPWTnXszJ94+eWGsz8m7WPAKJnjrzckijvbdxY=
X-Received: by 2002:a05:6358:998b:b0:134:c8ee:e451 with SMTP id
 j11-20020a056358998b00b00134c8eee451mr5606851rwb.13.1690241725467; Mon, 24
 Jul 2023 16:35:25 -0700 (PDT)
MIME-Version: 1.0
From:   Andrea Stedile <andreastedile97@gmail.com>
Date:   Tue, 25 Jul 2023 01:35:14 +0200
Message-ID: <CAMOGSPFDpPEeAEjc1c=a_Z3TZOcrTO8FBxNRqDXUADdRc+CRPw@mail.gmail.com>
Subject: UCSI_GET_PDOS failed + video + logs
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
Maybe you are getting this email twice, but it was flagged as spam.
I would like to report a possible bug that I am deterministically able
to reproduce by plugging my USB-C charger. Kernel is
6.5.0-0.rc2.17.fc39.x86_64.
My laptop has three USB-C ports, one on the left side and two on the
right side. The single port on the left supports USB-PD. The two right
ports support DisplayPort and Thunderbolt 3.
I made a screen recording of the output of sudo journalctl -k -f when
I connect the charger to the left port. I also created a text file
containing the text output. You can find them at [4].
The output contains a lot of lines, because I have added other kernel
parameters to help me debug an i915 bug I am experiencing [1] that may
be related to this one (see perhaps the traces at [2] and [3]).
On the other two USB-C port (that also allows for video and audio), I
obtain similar errors (uploaded video and text file at [4] as well).
The errors is:
ucsi_acpi USBC000:00: possible UCSI driver bug 2
ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-22)
Can I help in debugging this?
Kind regards,
Andrea
[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8964
[2] https://www.diffchecker.com/S5MEjVHU/
[3] https://www.diffchecker.com/rMjENqjH/
[4] https://drive.google.com/drive/folders/1eWsUBHDLizLjEx7R1b6ukjQISOPl_TNK?usp=sharing
